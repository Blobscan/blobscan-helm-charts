#!/bin/sh
set -e

helm uninstall blobscan-api
helm uninstall blobscan-indexer
helm uninstall blobscan

kubectl delete pvc data-blobscan-postgresql-0
