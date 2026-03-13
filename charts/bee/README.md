
# bee

![Version: 0.16.8](https://img.shields.io/badge/Version-0.16.8-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.4.0](https://img.shields.io/badge/AppVersion-2.4.0-informational?style=flat-square)

Ethereum Swarm Bee Helm chart for Kubernetes

**Homepage:** <https://www.ethswarm.org>

## Architecture

Bee is the Ethereum Swarm client. This chart deploys Bee nodes as a StatefulSet with configurable persistence, P2P networking, and optional gateway proxy support. It supports:

- **Bee node** — The core Swarm client for content storage and retrieval
- **Gateway Proxy** — Optional reverse proxy for public-facing Swarm gateway access
- **Service Monitor** — Optional Prometheus ServiceMonitor for metrics collection

## Installing the Chart

```bash
helm repo add blobscan https://blobscan.github.io/blobscan-helm-charts
helm repo update
helm install bee blobscan/bee
```

### With custom values

```bash
helm install bee blobscan/bee -f my-values.yaml
```

## Upgrading

```bash
helm upgrade bee blobscan/bee
```

## Uninstalling

```bash
helm uninstall bee
```

> **Note:** This will not delete Bee data PVCs. To fully clean up, delete them manually.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| devops | devops@ethswarm.org |  |
| svetomir | svetomir@ethswarm.org |  |
| darkobas2 | darkobas@ethswarm.org |  |

## Source Code

* <https://github.com/ethersphere/bee>

## Requirements

Kubernetes: `>=1.19.0-0`

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoNeighborhood.enabled | bool | `false` |  |
| beeCommand[0] | string | `"bee"` |  |
| beeCommand[1] | string | `"start"` |  |
| beeCommand[2] | string | `"--config=.bee.yaml"` |  |
| beeConfig.api-addr | string | `":1633"` |  |
| beeConfig.full-node | bool | `true` |  |
| beeConfig.network-id | int | `1` |  |
| beeConfig.p2p-addr | string | `":1634"` |  |
| beeEnv | list | `[]` |  |
| beeSelector.role | string | `"bee"` |  |
| envFrom | list | `[]` |  |
| extraEnvs | list | `[]` |  |
| extraInitContainers | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| gatewayProxy.autobuy.enabled | bool | `false` |  |
| gatewayProxy.enabled | bool | `false` |  |
| gatewayProxy.envs | list | `[]` |  |
| gatewayProxy.image.pullPolicy | string | `"IfNotPresent"` |  |
| gatewayProxy.image.repository | string | `"ethersphere/gateway-proxy"` |  |
| gatewayProxy.image.tag | string | `"0.16.0"` |  |
| gatewayProxy.ingress.annotations | object | `{}` |  |
| gatewayProxy.ingress.enabled | bool | `false` |  |
| gatewayProxy.ingress.hosts[0].domain | string | `""` |  |
| gatewayProxy.ingress.hosts[0].paths | list | `[]` |  |
| gatewayProxy.ingress.hosts[0].tlsSecret | string | `""` |  |
| gatewayProxy.ingress.pathType | string | `"ImplementationSpecific"` |  |
| gatewayProxy.ingress.tls | bool | `false` |  |
| gatewayProxy.resources | object | `{}` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ethersphere/bee"` |  |
| image.tag | string | `"2.2.0"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].domain | string | `""` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.hosts[0].tlsSecret | string | `""` |  |
| ingress.pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | bool | `false` |  |
| libp2pSettings.enabled | bool | `false` |  |
| libp2pSettings.libp2pKeys.bee-0 | string | `"{\"address\":\"6828fe67d8aed6065412dc374b601dce8aac40fe\",\"crypto\":{\"cipher\":\"aes-128-ctr\",\"ciphertext\":\"80fc86951b7c3ef77c1f44ffedade4312937e14673618bc87940bea2d8fe6b1d\",\"cipherparams\":{\"iv\":\"58bf5af2fd6b7c796fbfdf853b5e22c1\"},\"kdf\":\"scrypt\",\"kdfparams\":{\"n\":32768,\"r\":8,\"p\":1,\"dklen\":32,\"salt\":\"2bc758a178b3a43cb334436bc055cdad4898e1dacc9b9422b602254f29da08ed\"},\"mac\":\"c5616ee1343240181f4255a9072923dfc63be7f47ff8fb73519d53c31eb749ae\"},\"version\":3}"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| p2pFixedPort.enabled | bool | `false` |  |
| p2pFixedPort.nodePortStart | int | `31000` |  |
| p2pFixedPort.publicIpUrl | string | `"http://169.254.169.254/latest/meta-data/public-ipv4"` |  |
| password | string | `nil` |  |
| persistence.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.annotations | object | `{}` |  |
| persistence.enabled | bool | `false` |  |
| persistence.separateLocalstore.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.separateLocalstore.enabled | bool | `false` |  |
| persistence.separateLocalstore.size | string | `"1Gi"` |  |
| persistence.separateStatestore.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.separateStatestore.enabled | bool | `false` |  |
| persistence.separateStatestore.size | string | `"1Gi"` |  |
| persistence.size | string | `"1Gi"` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podManagementPolicy | string | `"OrderedReady"` |  |
| podSecurityContext.fsGroup | int | `999` |  |
| probesEnable | bool | `true` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `nil` |  |
| serviceMonitor.additionalLabels | object | `{}` |  |
| serviceMonitor.enabled | bool | `false` |  |
| singlePodSts.enabled | bool | `false` |  |
| singlePodSts.labelFilter | string | `"queen-bee"` |  |
| swarmSettings.enabled | bool | `false` |  |
| swarmSettings.swarmKeys.bee-0 | string | `"{\"address\":\"f176839c150e52fe30e5c2b5c648465c6fdfa532\",\"crypto\":{\"cipher\":\"aes-128-ctr\",\"ciphertext\":\"352af096f0fca9dfbd20a6861bde43d988efe7f179e0a9ffd812a285fdcd63b9\",\"cipherparams\":{\"iv\":\"613003f1f1bf93430c92629da33f8828\"},\"kdf\":\"scrypt\",\"kdfparams\":{\"n\":32768,\"r\":8,\"p\":1,\"dklen\":32,\"salt\":\"ad1d99a4c64c95c26131e079e8c8a82221d58bf66a7ceb767c33a4c376c564b8\"},\"mac\":\"cafda1bc8ca0ffc2b22eb69afd1cf5072fd09412243443be1b0c6832f57924b6\"},\"version\":3}"` |  |
| tolerations | list | `[]` |  |
| updateStrategy.type | string | `"RollingUpdate"` |  |
