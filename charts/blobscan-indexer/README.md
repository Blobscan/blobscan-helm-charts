
# blobscan-indexer

![Version: 0.4.2](https://img.shields.io/badge/Version-0.4.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Blobscan-indexer indexes blobs using Blobscan API.

**Homepage:** <https://blobscan.com>

## Source Code

* <https://github.com/blobscan/blobscan-indexer>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the Deployment |
| args | list | `[]` | Command arguments |
| config | object | See `values.yaml` | Config file https://github.com/Blobscan/blobscan/blob/next/.env.example |
| config.BLOBSCAN_API_ENDPOINT | string | `"http://blobscan-api:3001"` | Blobscan API service endpoint URL |
| config.DENCUN_FORK_SLOT | string | `""` | Slot number when Dencun fork activated (uncomment and set for testnets) |
| config.NETWORK_NAME | string | `"mainnet"` | Ethereum network name (mainnet, holesky, sepolia, gnosis) |
| config.RUST_LOG | string | `"blob_indexer=INFO"` | Rust logging configuration for the blob indexer |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customArgs | list | `[]` | Custom args for the blobscan-indexer container |
| customCommand | list | `[]` | Command replacement for the blobscan-indexer container |
| externalConfigMaps | list | `[]` | External ConfigMaps to mount as environment variables Example: ["blobscan-indexer-config"] |
| externalSecrets | list | `[]` | External Secrets to mount as environment variables Example: ["blobscan-indexer-secrets"] |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPodPorts | list | `[]` | Extra Pod ports |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| image.pullPolicy | string | `"IfNotPresent"` | blobscan-indexer container pull policy |
| image.repository | string | `"blossomlabs/blobscan-indexer"` | blobscan-indexer container image repository |
| image.tag | string | `"latest"` | blobscan-indexer container image tag |
| imagePullSecrets | list | `[]` | Image pull secrets for Docker images |
| initContainers | list | `[]` | Additional init containers |
| nameOverride | string | `""` | Overrides the chart's name |
| nodeSelector | object | `{}` | Node selector for pods |
| podAnnotations | object | `{}` | Pod annotations |
| podDisruptionBudget | object | `{}` | Define the PodDisruptionBudget spec If not set then a PodDisruptionBudget will not be created |
| podLabels | object | `{}` | Pod labels |
| priorityClassName | string | `nil` | Pod priority class |
| resources | object | `{}` | Resource requests and limits |
| secretEnv | object | `{"BEACON_NODE_ENDPOINT":"http://beacon-node:5052","EXECUTION_NODE_ENDPOINT":"http://execution-node:8545","SECRET_KEY":"supersecret","SENTRY_DSN":""}` | Secret env variables injected via a created secret |
| secretEnv.BEACON_NODE_ENDPOINT | string | `"http://beacon-node:5052"` | Ethereum consensus layer (beacon chain) node endpoint URL |
| secretEnv.EXECUTION_NODE_ENDPOINT | string | `"http://execution-node:8545"` | Ethereum execution layer node endpoint URL |
| secretEnv.SECRET_KEY | string | `"supersecret"` | Secret key used for authentication and encryption |
| secretEnv.SENTRY_DSN | string | `""` | Sentry DSN for error tracking and monitoring |
| securityContext | object | See `values.yaml` | The security context for pods |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| serviceMonitor.annotations | object | `{}` | Additional ServiceMonitor annotations |
| serviceMonitor.enabled | bool | `false` | If true, a ServiceMonitor CRD is created for a prometheus operator https://github.com/coreos/prometheus-operator |
| serviceMonitor.interval | string | `"15s"` | ServiceMonitor scrape interval |
| serviceMonitor.labels | object | `{}` | Additional ServiceMonitor labels |
| serviceMonitor.namespace | string | `nil` | Alternative namespace for ServiceMonitor |
| serviceMonitor.path | string | `"/metrics"` | Path to scrape |
| serviceMonitor.relabelings | list | `[]` | ServiceMonitor relabelings |
| serviceMonitor.scheme | string | `"http"` | ServiceMonitor scheme |
| serviceMonitor.scrapeTimeout | string | `"30s"` | ServiceMonitor scrape timeout |
| serviceMonitor.tlsConfig | object | `{}` | ServiceMonitor TLS configuration |
| terminationGracePeriodSeconds | int | `30` | How long to wait until the pod is forcefully terminated |
| tolerations | list | `[]` | Tolerations for pods |
| topologySpreadConstraints | list | `[]` | Topology Spread Constraints for pods |
