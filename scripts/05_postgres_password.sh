#!/bin/sh

echo ""
echo "--------------------------------"
echo "Postgresql password:"
kubectl get secret blobscan-blobscandb -o jsonpath="{.data.postgres-password}" |base64 -d
echo ""
