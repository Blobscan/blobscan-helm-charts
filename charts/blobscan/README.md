
# blobscan

![Version: 0.4.0](https://img.shields.io/badge/Version-0.4.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Blobscan meta-chart (depends on blobscan-api, blobscan-web and blobscan-indexer)

**Homepage:** <https://blobscan.com>

## Source Code

* <https://github.com/blobscan/blobscan/>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://blobscan.github.io/blobscan-helm-charts | blobscan-api | 0.3.1 |
| https://blobscan.github.io/blobscan-helm-charts | blobscan-indexer | 0.2.10 |
| https://blobscan.github.io/blobscan-helm-charts | blobscan-web | 0.3.1 |
| https://charts.bitnami.com/bitnami | blobscandb(postgresql) | 15.5.20 |
| https://charts.bitnami.com/bitnami | redis(redis) | 19.6.4 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the Deployment |
| args | list | `[]` | Command arguments |
| blobscandb.auth.database | string | `"blobscan"` |  |
| blobscandb.auth.password | string | `"postgres"` |  |
| blobscandb.auth.postgresPassword | string | `"postgres"` |  |
| blobscandb.auth.username | string | `"postgres"` |  |
| blobscandb.enabled | bool | `true` | If enabled a postgres chart will be deployed as a dependency |
| blobscandb.image.pullPolicy | string | `"IfNotPresent"` |  |
| blobscandb.image.registry | string | `"docker.io"` |  |
| blobscandb.image.repository | string | `"bitnami/postgresql"` |  |
| blobscandb.image.tag | string | `"16-debian-12"` |  |
| blobscandb.primary.persistence.enabled | bool | `true` |  |
| blobscandb.primary.persistence.size | string | `"100Gi"` |  |
| config | object | See `values.yaml` | Config file https://github.com/Blobscan/blobscan/blob/next/.env.example |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customArgs | list | `["web"]` | Custom args for the blobscan container |
| customCommand | list | `[]` | Command replacement for the blobscan container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPodPorts | list | `[]` | Extra Pod ports |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| httpPort | int | `3000` | Ports |
| image.pullPolicy | string | `"IfNotPresent"` | blobscan container pull policy |
| image.repository | string | `"blossomlabs/blobscan-web"` | blobscan container image repository |
| image.tag | string | `"latest"` | blobscan container image tag |
| imagePullSecrets | list | `[]` | Image pull secrets for Docker images |
| ingress.annotations | object | `{}` | Annotations for Ingress |
| ingress.enabled | bool | `false` | Ingress resource for the HTTP API |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths | list | `[]` |  |
| ingress.tls | list | `[]` | Ingress TLS |
| initContainers | list | `[]` | Additional init containers |
| livenessProbe | object | See `values.yaml` | Liveness probe |
| nameOverride | string | `""` | Overrides the chart's name |
| nodeSelector | object | `{}` | Node selector for pods |
| podAnnotations | object | `{}` | Pod annotations |
| podDisruptionBudget | object | `{}` | Define the PodDisruptionBudget spec If not set then a PodDisruptionBudget will not be created |
| podLabels | object | `{}` | Pod labels |
| priorityClassName | string | `nil` | Pod priority class |
| readinessProbe | object | See `values.yaml` | Readiness probe |
| redis.architecture | string | `"standalone"` |  |
| redis.auth.enabled | bool | `false` |  |
| redis.enabled | bool | `true` | If enabled a redis chart will be deployed as a dependency |
| replicas | int | `1` | Number of replicas |
| resources | object | `{}` | Resource requests and limits |
| secretEnv | object | `{}` | Secret env variables injected via a created secret |
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
