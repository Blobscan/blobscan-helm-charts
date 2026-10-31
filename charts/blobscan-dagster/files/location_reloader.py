"""Reload the webserver's code locations when they go stale.

The webserver never retries a location that failed to load, and never refreshes
one it loaded successfully. A rollout can hit either: it reaches the code
server while the old pod is going away, or it loads from the old pod while the
Service still points at it (mainnet, 2026-10-31). This sidecar reloads a
location when it is in an error state or when its loaded serverId differs from
the one the code server reports now.

Configuration (environment):
  WEBSERVER_URL    GraphQL endpoint of the webserver, e.g. http://localhost:3000/graphql
  CODE_SERVER      host:port of the code server's gRPC endpoint
  INTERVAL_SECONDS seconds between checks
"""
import json
import os
import time
import urllib.request

import grpc

URL = os.environ["WEBSERVER_URL"]
CODE_SERVER = os.environ["CODE_SERVER"]
INTERVAL = int(os.environ["INTERVAL_SECONDS"])

LOCATIONS = """{ workspaceOrError { ... on Workspace { locationEntries {
  name locationOrLoadError { __typename ... on RepositoryLocation { serverId } } } } } }"""
RELOAD = """mutation($name: String!) { reloadRepositoryLocation(
  repositoryLocationName: $name) { __typename ... on WorkspaceLocationEntry {
  locationOrLoadError { __typename } } } }"""


def query(q, variables=None):
    body = json.dumps({"query": q, "variables": variables or {}}).encode()
    req = urllib.request.Request(URL, data=body, headers={"Content-Type": "application/json"})
    with urllib.request.urlopen(req, timeout=30) as resp:
        return json.load(resp)["data"]


def live_server_id():
    # GetServerId replies with one string field (tag 0x0a, 1-byte length). Raw
    # gRPC: importing dagster here would not fit in the sidecar's memory.
    call = grpc.insecure_channel(CODE_SERVER).unary_unary(
        "/api.DagsterApi/GetServerId",
        request_serializer=lambda b: b,
        response_deserializer=lambda b: b,
    )
    reply = call(b"", timeout=10)
    return reply[2 : 2 + reply[1]].decode()


def check():
    entries = query(LOCATIONS)["workspaceOrError"]["locationEntries"]
    live = live_server_id()
    for entry in entries:
        loaded = entry["locationOrLoadError"] or {}
        if loaded.get("__typename") == "PythonError":
            why = "load error"
        elif loaded.get("serverId") != live:
            why = "code server changed"
        else:
            continue
        result = query(RELOAD, {"name": entry["name"]})["reloadRepositoryLocation"]
        state = (result.get("locationOrLoadError") or {}).get("__typename")
        print(f"reloaded code location {entry['name']} ({why}): {state}")


if __name__ == "__main__":
    while True:
        time.sleep(INTERVAL)
        try:
            check()
        except Exception as err:
            print(f"location check failed: {err}")
