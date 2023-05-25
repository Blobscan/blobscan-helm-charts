#!/bin/sh
set -x

kubectl logs -f prysm-geth-001-0 --all-containers=true
