#!/bin/sh
set -e

helm repo add ethereum-helm-charts https://ethpandaops.github.io/ethereum-helm-charts
helm repo add bitnami https://charts.bitnami.com/bitnami

# helm install -f ethereum-node_values.yaml ethereum-node ethereum-helm-charts/ethereum-node
# helm install -f /home/pablo/src/Ethereum/4844-testnet/kubernetes/devnet-5/node-001/values.yaml ethereum-node ethereum-helm-charts/ethereum-node

# config yaml like in 4844-testnet but without the parent node 'node-001'

# helm install -f values-ethereum_node.yaml ethereum-node ethereum-helm-charts/ethereum-node
# helm install -f values2.yaml ethereum-node ethereum-helm-charts/ethereum-node
helm install -f values3.yaml ethereum-node ethereum-helm-charts/ethereum-node
