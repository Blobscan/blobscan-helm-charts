
# blobscan

![Version: 0.6.6](https://img.shields.io/badge/Version-0.6.6-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Blobscan meta-chart (depends on blobscan-api, blobscan-web and blobscan-indexer)

**Homepage:** <https://blobscan.com>

## Source Code

* <https://github.com/blobscan/blobscan/>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://blobscan.github.io/blobscan-helm-charts | blobscan-api | 0.4.4 |
| https://blobscan.github.io/blobscan-helm-charts | blobscan-indexer | 0.2.11 |
| https://blobscan.github.io/blobscan-helm-charts | blobscan-web | 0.4.2 |
| https://charts.bitnami.com/bitnami | blobscandb(postgresql) | 15.5.20 |
| https://charts.bitnami.com/bitnami | redis(redis) | 19.6.4 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the Deployment |
| args | list | `[]` | Command arguments |
| blobscan-api | object | `{"config":{"BLOBSCAN_API_BASE_URL":"http://blobscan-api:3001","BLOBSCAN_API_PORT":3001,"CHAIN_ID":"1","DATABASE_URL":"postgresql://postgres:postgres@blobscan-blobscandb:5432/blobscan?pgbouncer=true&sslmode=require","DIRECT_URL":"postgresql://postgres:postgres@blobscan-blobscandb:5432/blobscan?sslmode=require","GOOGLE_STORAGE_ENABLED":"false","METRICS_ENABLED":"true","NETWORK_NAME":"mainnet","OTEL_EXPORTER_OTLP_ENDPOINT":"http://localhost:4318","OTEL_EXPORTER_OTLP_PROTOCOL":"http/protobuf","OTLP_AUTH_PASSWORD":"","OTLP_AUTH_USERNAME":"","POSTGRES_STORAGE_ENABLED":"true","REDIS_URI":"redis://blobscan-redis-master:6379/1","SECRET_KEY":"supersecret","SWARM_STORAGE_ENABLED":"false","TRACES_ENABLED":"false"},"enabled":true,"image":{"pullPolicy":"IfNotPresent","repository":"blossomlabs/blobscan-api","tag":"latest"},"replicas":1,"resources":{"limits":{"cpu":3,"memory":"1Gi"},"requests":{"cpu":1,"memory":"512Mi"}}}` | Values for the blobscan-api subchart |
| blobscan-api.config.BLOBSCAN_API_BASE_URL | string | `"http://blobscan-api:3001"` | Base URL for the Blobscan API service |
| blobscan-api.config.BLOBSCAN_API_PORT | int | `3001` | Port on which the Blobscan API service listens |
| blobscan-api.config.CHAIN_ID | string | `"1"` | Ethereum network chain ID (1 for mainnet) |
| blobscan-api.config.DATABASE_URL | string | `"postgresql://postgres:postgres@blobscan-blobscandb:5432/blobscan?pgbouncer=true&sslmode=require"` | PostgreSQL connection string for blobscan-api with read-write access |
| blobscan-api.config.DIRECT_URL | string | `"postgresql://postgres:postgres@blobscan-blobscandb:5432/blobscan?sslmode=require"` | Direct PostgreSQL connection string for Prisma (no pgbouncer) |
| blobscan-api.config.GOOGLE_STORAGE_ENABLED | string | `"false"` | Enable Google Cloud Storage for blob data |
| blobscan-api.config.METRICS_ENABLED | string | `"true"` | Enable metrics collection and reporting |
| blobscan-api.config.NETWORK_NAME | string | `"mainnet"` | Ethereum network name (mainnet, holesky, sepolia, gnosis) |
| blobscan-api.config.OTEL_EXPORTER_OTLP_ENDPOINT | string | `"http://localhost:4318"` | Endpoint URL for OpenTelemetry data export |
| blobscan-api.config.OTEL_EXPORTER_OTLP_PROTOCOL | string | `"http/protobuf"` | Protocol used for OpenTelemetry data export |
| blobscan-api.config.OTLP_AUTH_PASSWORD | string | `""` | Password for OpenTelemetry authentication |
| blobscan-api.config.OTLP_AUTH_USERNAME | string | `""` | Username for OpenTelemetry authentication |
| blobscan-api.config.POSTGRES_STORAGE_ENABLED | string | `"true"` | Enable PostgreSQL storage for blob data |
| blobscan-api.config.REDIS_URI | string | `"redis://blobscan-redis-master:6379/1"` | Redis connection URI for caching and queue management |
| blobscan-api.config.SECRET_KEY | string | `"supersecret"` | Secret key used for session management and encryption |
| blobscan-api.config.SWARM_STORAGE_ENABLED | string | `"false"` | Enable Swarm decentralized storage for blob data |
| blobscan-api.config.TRACES_ENABLED | string | `"false"` | Enable distributed tracing |
| blobscan-api.enabled | bool | `true` | Enable or disable the blobscan-api component |
| blobscan-api.image.pullPolicy | string | `"IfNotPresent"` | Docker image pull policy for blobscan-api |
| blobscan-api.image.repository | string | `"blossomlabs/blobscan-api"` | Docker image repository for blobscan-api |
| blobscan-api.image.tag | string | `"latest"` | Docker image tag for blobscan-api |
| blobscan-api.replicas | int | `1` | Number of blobscan-api replicas |
| blobscan-api.resources.limits | object | `{"cpu":3,"memory":"1Gi"}` | Resource limits for blobscan-api pods |
| blobscan-api.resources.limits.cpu | int | `3` | CPU limit for blobscan-api |
| blobscan-api.resources.limits.memory | string | `"1Gi"` | Memory limit for blobscan-api |
| blobscan-api.resources.requests | object | `{"cpu":1,"memory":"512Mi"}` | Resource requests for blobscan-api pods |
| blobscan-api.resources.requests.cpu | int | `1` | CPU request for blobscan-api |
| blobscan-api.resources.requests.memory | string | `"512Mi"` | Memory request for blobscan-api |
| blobscan-indexer | object | `{"enabled":false,"replicas":1,"resources":{"limits":{"cpu":"1000m","memory":"200Mi"},"requests":{"cpu":"500m","memory":"100Mi"}}}` | Values for the blobscan-indexer subchart |
| blobscan-indexer.enabled | bool | `false` | Enable or disable the blobscan-indexer component |
| blobscan-indexer.replicas | int | `1` | Number of blobscan-indexer replicas |
| blobscan-indexer.resources.limits | object | `{"cpu":"1000m","memory":"200Mi"}` | Resource limits for blobscan-indexer pods |
| blobscan-indexer.resources.limits.cpu | string | `"1000m"` | CPU limit for blobscan-indexer |
| blobscan-indexer.resources.limits.memory | string | `"200Mi"` | Memory limit for blobscan-indexer |
| blobscan-indexer.resources.requests | object | `{"cpu":"500m","memory":"100Mi"}` | Resource requests for blobscan-indexer pods |
| blobscan-indexer.resources.requests.cpu | string | `"500m"` | CPU request for blobscan-indexer |
| blobscan-indexer.resources.requests.memory | string | `"100Mi"` | Memory request for blobscan-indexer |
| blobscan-web | object | `{"config":{"BLOBSCAN_API_BASE_URL":"http://blobscan-api:3001","BLOBSCAN_API_PORT":3001,"DATABASE_URL":"postgresql://postgres:postgres@blobscan-blobscandb:5432/blobscan?pgbouncer=true&sslmode=require","DIRECT_URL":"postgresql://postgres:postgres@blobscan-blobscandb:5432/blobscan?sslmode=require","GOOGLE_SERVICE_KEY":"","GOOGLE_STORAGE_BUCKET_NAME":"","GOOGLE_STORAGE_ENABLED":"false","GOOGLE_STORAGE_PROJECT_ID":"","METRICS_ENABLED":"true","NETWORK_NAME":"mainnet","OTEL_EXPORTER_OTLP_ENDPOINT":"http://localhost:4318","OTEL_EXPORTER_OTLP_PROTOCOL":"http/protobuf","OTLP_AUTH_PASSWORD":"","OTLP_AUTH_USERNAME":"","POSTGRES_STORAGE_ENABLED":"true","SECRET_KEY":"supersecret","SWARM_STORAGE_ENABLED":"false","TRACES_ENABLED":"false"},"enabled":true,"image":{"pullPolicy":"IfNotPresent","repository":"blossomlabs/blobscan-web","tag":"latest"},"replicas":1,"resources":{"limits":{"cpu":3,"memory":"512Mi"},"requests":{"cpu":1,"memory":"128Mi"}}}` | Values for the blobscan-web subchart |
| blobscan-web.config.BLOBSCAN_API_BASE_URL | string | `"http://blobscan-api:3001"` | Base URL for the Blobscan API service |
| blobscan-web.config.BLOBSCAN_API_PORT | int | `3001` | Port on which the Blobscan API service listens |
| blobscan-web.config.DATABASE_URL | string | `"postgresql://postgres:postgres@blobscan-blobscandb:5432/blobscan?pgbouncer=true&sslmode=require"` | PostgreSQL connection string for blobscan-web |
| blobscan-web.config.DIRECT_URL | string | `"postgresql://postgres:postgres@blobscan-blobscandb:5432/blobscan?sslmode=require"` | Direct PostgreSQL connection string for Prisma (no pgbouncer) |
| blobscan-web.config.GOOGLE_SERVICE_KEY | string | `""` | Google Cloud service account key for authentication (JSON format) |
| blobscan-web.config.GOOGLE_STORAGE_BUCKET_NAME | string | `""` | Google Cloud Storage bucket name for blob data storage |
| blobscan-web.config.GOOGLE_STORAGE_ENABLED | string | `"false"` | Enable Google Cloud Storage for blob data |
| blobscan-web.config.GOOGLE_STORAGE_PROJECT_ID | string | `""` | Google Cloud project ID for blob data storage |
| blobscan-web.config.METRICS_ENABLED | string | `"true"` | Enable metrics collection and reporting |
| blobscan-web.config.NETWORK_NAME | string | `"mainnet"` | Ethereum network name (mainnet, holesky, sepolia, gnosis) |
| blobscan-web.config.OTEL_EXPORTER_OTLP_ENDPOINT | string | `"http://localhost:4318"` | Endpoint URL for OpenTelemetry data export |
| blobscan-web.config.OTEL_EXPORTER_OTLP_PROTOCOL | string | `"http/protobuf"` | Protocol used for OpenTelemetry data export |
| blobscan-web.config.OTLP_AUTH_PASSWORD | string | `""` | Password for OpenTelemetry authentication |
| blobscan-web.config.OTLP_AUTH_USERNAME | string | `""` | Username for OpenTelemetry authentication |
| blobscan-web.config.POSTGRES_STORAGE_ENABLED | string | `"true"` | Enable PostgreSQL storage for blob data |
| blobscan-web.config.SECRET_KEY | string | `"supersecret"` | Secret key used for session management and encryption |
| blobscan-web.config.SWARM_STORAGE_ENABLED | string | `"false"` | Enable Swarm decentralized storage for blob data |
| blobscan-web.config.TRACES_ENABLED | string | `"false"` | Enable distributed tracing |
| blobscan-web.enabled | bool | `true` | Enable or disable the blobscan-web component |
| blobscan-web.image.pullPolicy | string | `"IfNotPresent"` | Docker image pull policy for blobscan-web |
| blobscan-web.image.repository | string | `"blossomlabs/blobscan-web"` | Docker image repository for blobscan-web |
| blobscan-web.image.tag | string | `"latest"` | Docker image tag for blobscan-web |
| blobscan-web.replicas | int | `1` | Number of blobscan-web replicas |
| blobscan-web.resources.limits.cpu | int | `3` | CPU limit for blobscan-web |
| blobscan-web.resources.limits.memory | string | `"512Mi"` | Memory limit for blobscan-web |
| blobscan-web.resources.requests | object | `{"cpu":1,"memory":"128Mi"}` | Resource requests for blobscan-web pods |
| blobscan-web.resources.requests.cpu | int | `1` | CPU request for blobscan-web |
| blobscan-web.resources.requests.memory | string | `"128Mi"` | Memory request for blobscan-web |
| blobscandb | object | `{"auth":{"database":"blobscan","password":"postgres","username":"postgres"},"enabled":true,"image":{"pullPolicy":"IfNotPresent","registry":"docker.io","repository":"bitnami/postgresql","tag":"16-debian-12"},"primary":{"enabled":true,"persistence":{"size":"8Gi"}}}` | Values for the PostgreSQL subchart |
| blobscandb.auth.database | string | `"blobscan"` | PostgreSQL database name |
| blobscandb.auth.password | string | `"postgres"` | PostgreSQL password |
| blobscandb.auth.username | string | `"postgres"` | PostgreSQL username |
| blobscandb.enabled | bool | `true` | Enable or disable the PostgreSQL database component |
| blobscandb.image.pullPolicy | string | `"IfNotPresent"` | PostgreSQL image pull policy |
| blobscandb.image.registry | string | `"docker.io"` | PostgreSQL image registry |
| blobscandb.image.repository | string | `"bitnami/postgresql"` | PostgreSQL image repository |
| blobscandb.image.tag | string | `"16-debian-12"` | PostgreSQL image tag |
| blobscandb.primary.enabled | bool | `true` | Enable PostgreSQL primary instance |
| blobscandb.primary.persistence.size | string | `"8Gi"` | Size of the PostgreSQL persistent volume |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| customCommand | list | `[]` | Command replacement for the blobscan container |
| extraContainers | list | `[]` | Additional containers |
| extraEnv | list | `[]` | Additional env variables |
| extraPodPorts | list | `[]` | Extra Pod ports |
| extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| extraVolumeMounts | list | `[]` | Additional volume mounts |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| httpPort | int | `3000` | Ports |
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
| redis.auth.password | string | `""` |  |
| redis.enabled | bool | `true` | If enabled a redis chart will be deployed as a dependency |
| redis.master.persistence.enabled | bool | `true` |  |
| redis.master.persistence.size | string | `"8Gi"` |  |
| redis.master.resources.limits.cpu | string | `"500m"` |  |
| redis.master.resources.limits.memory | string | `"512Mi"` |  |
| redis.master.resources.requests.cpu | string | `"250m"` |  |
| redis.master.resources.requests.memory | string | `"256Mi"` |  |
| redis.metrics.enabled | bool | `false` |  |
| redis.metrics.serviceMonitor.enabled | bool | `false` |  |
| redis.replica.persistence.enabled | bool | `true` |  |
| redis.replica.persistence.size | string | `"8Gi"` |  |
| redis.replica.replicaCount | int | `1` |  |
| redis.replica.resources.limits.cpu | string | `"250m"` |  |
| redis.replica.resources.limits.memory | string | `"256Mi"` |  |
| redis.replica.resources.requests.cpu | string | `"100m"` |  |
| redis.replica.resources.requests.memory | string | `"128Mi"` |  |
| redis.service.port | int | `6379` |  |
| redis.service.type | string | `"ClusterIP"` |  |
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
