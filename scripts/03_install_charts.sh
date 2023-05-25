#!/bin/sh
set -e

kind load docker-image blossomlabs/blobscan:local

#helm install -f ./charts/blobscan/myvalues.yaml blobscan ./charts/blobscan
helm install blobscan ./charts/blobscan
helm install blobscan-api ./charts/blobscan-api
helm install blobscan-indexer ./charts/blobscan-indexer

echo ""
echo "--------------------------------"
echo "Postgresql password:"
kubectl get secret blobscan-postgresql -o jsonpath="{.data.postgres-password}" |base64 -d
