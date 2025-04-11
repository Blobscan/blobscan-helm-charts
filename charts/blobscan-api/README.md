
# blobscan-api

![Version: 0.4.1](https://img.shields.io/badge/Version-0.4.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Blobscan API

**Homepage:** <https://blobscan.com>

## Source Code

* <https://github.com/blobscan/blobscan/>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the Deployment |
| args | list | `[]` | Command arguments |
| config | object | See `values.yaml` | Config file https://github.com/Blobscan/blobscan/blob/main/.env.example |
| config.BEE_ENDPOINT | string | `"http://localhost:1633"` | Swarm Bee node endpoint for decentralized storage |
| config.BLOBSCAN_API_BASE_URL | string | `"http://blobscan-api:3001"` | Base URL for the Blobscan API service |
| config.BLOBSCAN_API_PORT | int | `3001` | Port on which the Blobscan API service listens |
| config.CHAIN_ID | string | `"1"` | Ethereum network chain ID (1 for mainnet) |
| config.DATABASE_URL | string | `"postgresql://postgres:postgres@blobscan-blobscandb:5432/blobscan?pgbouncer=true&sslmode=require"` | PostgreSQL connection string for the main database connection |
| config.DIRECT_URL | string | `"postgresql://postgres:postgres@blobscan-blobscandb:5432/blobscan?sslmode=require"` | Direct PostgreSQL connection string, used for Prisma direct database access |
| config.GOOGLE_SERVICE_KEY | string | `""` | Google Cloud service account key for authentication (JSON format) |
| config.GOOGLE_STORAGE_BUCKET_NAME | string | `""` | Google Cloud Storage bucket name for blob data storage |
| config.GOOGLE_STORAGE_ENABLED | string | `"false"` | Enable Google Cloud Storage for blob data |
| config.GOOGLE_STORAGE_PROJECT_ID | string | `""` | Google Cloud project ID for blob data storage |
| config.LOG_LEVEL | string | `"info"` | Log level (info, warning, error, debug) |
| config.METRICS_ENABLED | string | `"true"` | Enable metrics collection and reporting |
| config.NETWORK_NAME | string | `"mainnet"` | Ethereum network name (mainnet, holesky, sepolia, gnosis) |
| config.OTEL_EXPORTER_OTLP_ENDPOINT | string | `"http://localhost:4318"` | Endpoint URL for OpenTelemetry data export |
| config.OTEL_EXPORTER_OTLP_PROTOCOL | string | `"http/protobuf"` | Protocol used for OpenTelemetry data export |
| config.OTLP_AUTH_PASSWORD | string | `""` | Password for OpenTelemetry authentication |
| config.OTLP_AUTH_USERNAME | string | `""` | Username for OpenTelemetry authentication |
| config.POSTGRES_STORAGE_ENABLED | string | `"true"` | Enable PostgreSQL storage for blob data |
| config.REDIS_URI | string | `"redis://blobscan-redis-master:6379/1"` | Redis connection URI for caching and queue management |
| config.SECRET_KEY | string | `"supersecret"` | Secret key used for session management and encryption |
| config.SWARM_BATCH_ID | string | `""` | Swarm batch ID for blob data storage in Swarm network |
| config.SWARM_STORAGE_ENABLED | string | `"false"` | Enable Swarm decentralized storage for blob data |
| config.TRACES_ENABLED | string | `"false"` | Enable distributed tracing |
| config.WEAVEVM_API_KEY | string | `""` | API key for WeaveVM integration |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customArgs | list | `[]` | Custom args for the blobscan-api container |
| customCommand | list | `[]` | Command replacement for the blobscan-api container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPodPorts | list | `[]` | Extra Pod ports |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| httpPort | int | `3001` | Ports |
| image.pullPolicy | string | `"IfNotPresent"` | blobscan-api container pull policy |
| image.repository | string | `"blossomlabs/blobscan-api"` | blobscan-api container image repository |
| image.tag | string | `"latest"` | blobscan-api container image tag |
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
