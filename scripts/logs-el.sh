#!/bin/sh
set -x

# kubectl logs -f prysm-geth-001-0 geth-prysm-001-0

kubectl logs -f geth-prysm-001-0 --all-containers=true
