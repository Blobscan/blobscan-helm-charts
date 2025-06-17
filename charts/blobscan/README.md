
# blobscan

![Version: 0.9.1](https://img.shields.io/badge/Version-0.9.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Blobscan meta-chart (depends on blobscan-api, blobscan-web and blobscan-indexer)

**Homepage:** <https://blobscan.com>

## Source Code

* <https://github.com/blobscan/blobscan/>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../blobscan-api | blobscan-api | 0.6.1 |
| file://../blobscan-indexer | blobscan-indexer | 0.4.0 |
| file://../blobscan-web | blobscan-web | 0.6.0 |
| https://charts.bitnami.com/bitnami | blobscandb(postgresql) | 15.5.20 |
| https://charts.bitnami.com/bitnami | redis(redis) | 19.6.4 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the Deployment |
| args | list | `[]` | Command arguments |
| blobscan-api | object | `{"affinity":{},"annotations":{},"args":[],"bullmqExporter":{"databaseMapping":"0:ethereum-prod","enabled":false,"image":{"pullPolicy":"IfNotPresent","repository":"blossomlabs/bullmq-prometheus","tag":"latest"},"serviceMonitor":{"annotations":{},"enabled":false,"interval":"15s","labels":{},"path":"/metrics","relabelings":[],"scheme":"http","scrapeTimeout":"30s","tlsConfig":{}}},"config":{"BEE_ENDPOINT":"http://localhost:1633","BLOBSCAN_API_BASE_URL":"http://blobscan-api:3001","BLOBSCAN_API_PORT":3001,"CHAIN_ID":"1","ETH_PRICE_SYNCER_CHAIN_ID":"137","ETH_PRICE_SYNCER_CRON_PATTERN":"* * * * *","ETH_PRICE_SYNCER_ENABLED":false,"ETH_PRICE_SYNCER_ETH_USD_PRICE_FEED_CONTRACT_ADDRESS":"0xF9680D99D6C9589e2a93a78A04A279e509205945","ETH_PRICE_SYNCER_TIME_TOLERANCE":60,"GOOGLE_STORAGE_BUCKET_NAME":"","GOOGLE_STORAGE_ENABLED":"false","GOOGLE_STORAGE_PROJECT_ID":"","LOG_LEVEL":"info","METRICS_ENABLED":"false","NETWORK_NAME":"mainnet","OTEL_EXPORTER_OTLP_ENDPOINT":"http://localhost:4318","OTEL_EXPORTER_OTLP_PROTOCOL":"http/protobuf","POSTGRES_STORAGE_ENABLED":"true","SWARM_BATCH_ID":"","SWARM_STORAGE_ENABLED":"false","TRACES_ENABLED":"false"},"containerSecurityContext":{},"customArgs":[],"customCommand":[],"enabled":true,"externalConfigMaps":[],"externalSecrets":[],"extraContainers":[],"extraEnv":[],"extraPodPorts":[],"extraPorts":[],"extraVolumeMounts":[],"extraVolumes":[],"httpPort":3001,"image":{"pullPolicy":"IfNotPresent","repository":"blossomlabs/blobscan-api","tag":"latest"},"imagePullSecrets":[],"ingress":{"annotations":{},"enabled":false,"hosts":[{"host":"chart-example.local","paths":[]}],"tls":[]},"initContainers":[],"livenessProbe":{"initialDelaySeconds":60,"periodSeconds":120,"tcpSocket":{"port":"http"}},"nodeSelector":{},"podAnnotations":{},"podDisruptionBudget":{},"podLabels":{},"priorityClassName":null,"readinessProbe":{"initialDelaySeconds":10,"periodSeconds":10,"tcpSocket":{"port":"http"}},"replicas":1,"resources":{"limits":{"cpu":3,"memory":"1Gi"},"requests":{"cpu":1,"memory":"512Mi"}},"secretEnv":{"DATABASE_URL":"postgresql://postgres:postgres@blobscan-blobscandb:5432/blobscan?pgbouncer=true&sslmode=require","DIRECT_URL":"postgresql://postgres:postgres@blobscan-blobscandb:5432/blobscan?sslmode=require","ETH_PRICE_SYNCER_CHAIN_JSON_RPC_URL":"http://polygon-rpc:8545","GOOGLE_SERVICE_KEY":"","OTLP_AUTH_PASSWORD":"","OTLP_AUTH_USERNAME":"","REDIS_URI":"redis://blobscan-redis-master:6379/1","SECRET_KEY":"supersecret","SENTRY_DSN_API":"","WEAVEVM_API_KEY":""},"securityContext":{"fsGroup":1000,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000},"service":{"type":"ClusterIP"},"serviceAccount":{"annotations":{},"create":false,"name":""},"serviceMonitor":{"annotations":{},"enabled":false,"interval":"15s","labels":{},"namespace":null,"path":"/metrics","relabelings":[],"scheme":"http","scrapeTimeout":"30s","tlsConfig":{}},"terminationGracePeriodSeconds":30,"tolerations":[]}` | Values for the blobscan-api subchart |
| blobscan-api.affinity | object | `{}` | Affinity configuration for pods |
| blobscan-api.annotations | object | `{}` | Annotations for the Deployment |
| blobscan-api.args | list | `[]` | Command arguments |
| blobscan-api.bullmqExporter | object | `{"databaseMapping":"0:ethereum-prod","enabled":false,"image":{"pullPolicy":"IfNotPresent","repository":"blossomlabs/bullmq-prometheus","tag":"latest"},"serviceMonitor":{"annotations":{},"enabled":false,"interval":"15s","labels":{},"path":"/metrics","relabelings":[],"scheme":"http","scrapeTimeout":"30s","tlsConfig":{}}}` | BullMQ Prometheus exporter configuration |
| blobscan-api.bullmqExporter.databaseMapping | string | `"0:ethereum-prod"` | Redis database and namespace to monitor, in the format "<db>:<namespace>" |
| blobscan-api.bullmqExporter.enabled | bool | `false` | Enable or disable the BullMQ Prometheus exporter sidecar container |
| blobscan-api.bullmqExporter.image.pullPolicy | string | `"IfNotPresent"` | BullMQ Prometheus exporter image pull policy |
| blobscan-api.bullmqExporter.image.repository | string | `"blossomlabs/bullmq-prometheus"` | BullMQ Prometheus exporter image repository |
| blobscan-api.bullmqExporter.image.tag | string | `"latest"` | BullMQ Prometheus exporter image tag |
| blobscan-api.bullmqExporter.serviceMonitor | object | `{"annotations":{},"enabled":false,"interval":"15s","labels":{},"path":"/metrics","relabelings":[],"scheme":"http","scrapeTimeout":"30s","tlsConfig":{}}` | ServiceMonitor configuration for BullMQ exporter |
| blobscan-api.bullmqExporter.serviceMonitor.annotations | object | `{}` | Additional ServiceMonitor annotations |
| blobscan-api.bullmqExporter.serviceMonitor.enabled | bool | `false` | Enable or disable the ServiceMonitor for BullMQ exporter |
| blobscan-api.bullmqExporter.serviceMonitor.interval | string | `"15s"` | ServiceMonitor scrape interval, defaults to main ServiceMonitor interval if not set |
| blobscan-api.bullmqExporter.serviceMonitor.labels | object | `{}` | Additional ServiceMonitor labels |
| blobscan-api.bullmqExporter.serviceMonitor.path | string | `"/metrics"` | ServiceMonitor path, defaults to /metrics |
| blobscan-api.bullmqExporter.serviceMonitor.relabelings | list | `[]` | ServiceMonitor relabelings |
| blobscan-api.bullmqExporter.serviceMonitor.scheme | string | `"http"` | ServiceMonitor scheme, defaults to main ServiceMonitor scheme if not set |
| blobscan-api.bullmqExporter.serviceMonitor.scrapeTimeout | string | `"30s"` | ServiceMonitor scrape timeout |
| blobscan-api.bullmqExporter.serviceMonitor.tlsConfig | object | `{}` | ServiceMonitor TLS configuration |
| blobscan-api.config.BEE_ENDPOINT | string | `"http://localhost:1633"` | Swarm Bee node endpoint for decentralized storage |
| blobscan-api.config.BLOBSCAN_API_BASE_URL | string | `"http://blobscan-api:3001"` | Base URL for the Blobscan API service |
| blobscan-api.config.BLOBSCAN_API_PORT | int | `3001` | Port on which the Blobscan API service listens |
| blobscan-api.config.CHAIN_ID | string | `"1"` | Ethereum network chain ID (1 for mainnet) |
| blobscan-api.config.ETH_PRICE_SYNCER_CHAIN_ID | string | `"137"` | ID of the chain where price feed contract is deployed on |
| blobscan-api.config.ETH_PRICE_SYNCER_CRON_PATTERN | string | `"* * * * *"` | Cron pattern for the job that periodically stores ETH price in database |
| blobscan-api.config.ETH_PRICE_SYNCER_ENABLED | bool | `false` | Enable the ETH price syncer job |
| blobscan-api.config.ETH_PRICE_SYNCER_ETH_USD_PRICE_FEED_CONTRACT_ADDRESS | string | `"0xF9680D99D6C9589e2a93a78A04A279e509205945"` | Contract address for the Chainlink ETH/USD price feed on the specified chain |
| blobscan-api.config.ETH_PRICE_SYNCER_TIME_TOLERANCE | int | `60` | Maximum allowed age (in seconds) of the fetched price before it's considered stale |
| blobscan-api.config.GOOGLE_STORAGE_BUCKET_NAME | string | `""` | Google Cloud Storage bucket name for blob data storage |
| blobscan-api.config.GOOGLE_STORAGE_ENABLED | string | `"false"` | Enable Google Cloud Storage for blob data |
| blobscan-api.config.GOOGLE_STORAGE_PROJECT_ID | string | `""` | Google Cloud project ID for blob data storage |
| blobscan-api.config.LOG_LEVEL | string | `"info"` | Log level (info, warning, error, debug) |
| blobscan-api.config.METRICS_ENABLED | string | `"false"` | Enable metrics collection and reporting |
| blobscan-api.config.NETWORK_NAME | string | `"mainnet"` | Ethereum network name (mainnet, holesky, sepolia, gnosis) |
| blobscan-api.config.OTEL_EXPORTER_OTLP_ENDPOINT | string | `"http://localhost:4318"` | Endpoint URL for OpenTelemetry data export |
| blobscan-api.config.OTEL_EXPORTER_OTLP_PROTOCOL | string | `"http/protobuf"` | Protocol used for OpenTelemetry data export |
| blobscan-api.config.POSTGRES_STORAGE_ENABLED | string | `"true"` | Enable PostgreSQL storage for blob data |
| blobscan-api.config.SWARM_BATCH_ID | string | `""` | Swarm batch ID for blob data storage in Swarm network |
| blobscan-api.config.SWARM_STORAGE_ENABLED | string | `"false"` | Enable Swarm decentralized storage for blob data |
| blobscan-api.config.TRACES_ENABLED | string | `"false"` | Enable distributed tracing |
| blobscan-api.containerSecurityContext | object | `{}` | The security context for containers |
| blobscan-api.customArgs | list | `[]` | Custom args for the blobscan-api container |
| blobscan-api.customCommand | list | `[]` | Command replacement for the blobscan-api container |
| blobscan-api.enabled | bool | `true` | Enable or disable the blobscan-api component |
| blobscan-api.externalConfigMaps | list | `[]` | External ConfigMaps to mount as environment variables Example: ["blobscan-api-config"] |
| blobscan-api.externalSecrets | list | `[]` | External Secrets to mount as environment variables Example: ["blobscan-api-secrets"] |
| blobscan-api.extraContainers | list | `[]` | Additional containers |
| blobscan-api.extraEnv | list | `[]` | Additional env variables |
| blobscan-api.extraPodPorts | list | `[]` | Extra Pod ports |
| blobscan-api.extraPorts | list | `[]` | Additional ports. Useful when using extraContainers |
| blobscan-api.extraVolumeMounts | list | `[]` | Additional volume mounts |
| blobscan-api.extraVolumes | list | `[]` | Additional volumes |
| blobscan-api.httpPort | int | `3001` | Ports |
| blobscan-api.image.pullPolicy | string | `"IfNotPresent"` | Docker image pull policy for blobscan-api |
| blobscan-api.image.repository | string | `"blossomlabs/blobscan-api"` | Docker image repository for blobscan-api |
| blobscan-api.image.tag | string | `"latest"` | Docker image tag for blobscan-api |
| blobscan-api.imagePullSecrets | list | `[]` | Image pull secrets for Docker images |
| blobscan-api.ingress.annotations | object | `{}` | Annotations for Ingress |
| blobscan-api.ingress.enabled | bool | `false` | Ingress resource for the HTTP API |
| blobscan-api.ingress.tls | list | `[]` | Ingress TLS |
| blobscan-api.initContainers | list | `[]` | Additional init containers |
| blobscan-api.livenessProbe | object | `{"initialDelaySeconds":60,"periodSeconds":120,"tcpSocket":{"port":"http"}}` | Liveness probe |
| blobscan-api.nodeSelector | object | `{}` | Node selector for pods |
| blobscan-api.podAnnotations | object | `{}` | Pod annotations |
| blobscan-api.podDisruptionBudget | object | `{}` | Define the PodDisruptionBudget spec |
| blobscan-api.podLabels | object | `{}` | Pod labels |
| blobscan-api.priorityClassName | string | `nil` | Pod priority class |
| blobscan-api.readinessProbe | object | `{"initialDelaySeconds":10,"periodSeconds":10,"tcpSocket":{"port":"http"}}` | Readiness probe |
| blobscan-api.replicas | int | `1` | Number of blobscan-api replicas |
| blobscan-api.resources.limits | object | `{"cpu":3,"memory":"1Gi"}` | Resource limits for blobscan-api pods |
| blobscan-api.resources.limits.cpu | int | `3` | CPU limit for blobscan-api |
| blobscan-api.resources.limits.memory | string | `"1Gi"` | Memory limit for blobscan-api |
| blobscan-api.resources.requests | object | `{"cpu":1,"memory":"512Mi"}` | Resource requests for blobscan-api pods |
| blobscan-api.resources.requests.cpu | int | `1` | CPU request for blobscan-api |
| blobscan-api.resources.requests.memory | string | `"512Mi"` | Memory request for blobscan-api |
| blobscan-api.secretEnv | object | `{"DATABASE_URL":"postgresql://postgres:postgres@blobscan-blobscandb:5432/blobscan?pgbouncer=true&sslmode=require","DIRECT_URL":"postgresql://postgres:postgres@blobscan-blobscandb:5432/blobscan?sslmode=require","ETH_PRICE_SYNCER_CHAIN_JSON_RPC_URL":"http://polygon-rpc:8545","GOOGLE_SERVICE_KEY":"","OTLP_AUTH_PASSWORD":"","OTLP_AUTH_USERNAME":"","REDIS_URI":"redis://blobscan-redis-master:6379/1","SECRET_KEY":"supersecret","SENTRY_DSN_API":"","WEAVEVM_API_KEY":""}` | Secret env variables injected via a created secret |
| blobscan-api.secretEnv.DATABASE_URL | string | `"postgresql://postgres:postgres@blobscan-blobscandb:5432/blobscan?pgbouncer=true&sslmode=require"` | PostgreSQL connection string for the main database connection |
| blobscan-api.secretEnv.DIRECT_URL | string | `"postgresql://postgres:postgres@blobscan-blobscandb:5432/blobscan?sslmode=require"` | Direct PostgreSQL connection string, used for Prisma direct database access |
| blobscan-api.secretEnv.ETH_PRICE_SYNCER_CHAIN_JSON_RPC_URL | string | `"http://polygon-rpc:8545"` | RPC endpoint for the chain specified in ETH_PRICE_SYNCER_CHAIN_ID |
| blobscan-api.secretEnv.GOOGLE_SERVICE_KEY | string | `""` | Google Cloud service account key for authentication (JSON format) |
| blobscan-api.secretEnv.OTLP_AUTH_PASSWORD | string | `""` | Password for OpenTelemetry authentication |
| blobscan-api.secretEnv.OTLP_AUTH_USERNAME | string | `""` | Username for OpenTelemetry authentication |
| blobscan-api.secretEnv.REDIS_URI | string | `"redis://blobscan-redis-master:6379/1"` | Redis connection URI for caching and queue management |
| blobscan-api.secretEnv.SECRET_KEY | string | `"supersecret"` | Secret key used for session management and encryption |
| blobscan-api.secretEnv.SENTRY_DSN_API | string | `""` | Sentry DSN for API |
| blobscan-api.secretEnv.WEAVEVM_API_KEY | string | `""` | API key for WeaveVM integration |
| blobscan-api.securityContext | object | `{"fsGroup":1000,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | The security context for pods |
| blobscan-api.service.type | string | `"ClusterIP"` | Service type |
| blobscan-api.serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| blobscan-api.serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| blobscan-api.serviceAccount.name | string | `""` | The name of the service account to use |
| blobscan-api.serviceMonitor.annotations | object | `{}` | Additional ServiceMonitor annotations |
| blobscan-api.serviceMonitor.enabled | bool | `false` | If true, a ServiceMonitor CRD is created for a prometheus operator |
| blobscan-api.serviceMonitor.interval | string | `"15s"` | ServiceMonitor scrape interval |
| blobscan-api.serviceMonitor.labels | object | `{}` | Additional ServiceMonitor labels |
| blobscan-api.serviceMonitor.namespace | string | `nil` | Alternative namespace for ServiceMonitor |
| blobscan-api.serviceMonitor.path | string | `"/metrics"` | Path to scrape |
| blobscan-api.serviceMonitor.relabelings | list | `[]` | ServiceMonitor relabelings |
| blobscan-api.serviceMonitor.scheme | string | `"http"` | ServiceMonitor scheme |
| blobscan-api.serviceMonitor.scrapeTimeout | string | `"30s"` | ServiceMonitor scrape timeout |
| blobscan-api.serviceMonitor.tlsConfig | object | `{}` | ServiceMonitor TLS configuration |
| blobscan-api.terminationGracePeriodSeconds | int | `30` | How long to wait until the pod is forcefully terminated |
| blobscan-api.tolerations | list | `[]` | Tolerations for pods |
| blobscan-indexer | object | `{"config":{"BLOBSCAN_API_ENDPOINT":"http://blobscan-api:3001","DENCUN_FORK_SLOT":"","NETWORK_NAME":"mainnet","RUST_LOG":"blob_indexer=INFO"},"enabled":true,"externalConfigMaps":[],"externalSecrets":[],"image":{"pullPolicy":"IfNotPresent","repository":"blossomlabs/blobscan-indexer","tag":"latest"},"replicas":1,"resources":{"limits":{"cpu":"1000m","memory":"200Mi"},"requests":{"cpu":"500m","memory":"100Mi"}},"secretEnv":{"BEACON_NODE_ENDPOINT":"http://beacon-node:5052","EXECUTION_NODE_ENDPOINT":"http://execution-node:8545","SECRET_KEY":"supersecret","SENTRY_DSN":""}}` | Values for the blobscan-indexer subchart |
| blobscan-indexer.config | object | `{"BLOBSCAN_API_ENDPOINT":"http://blobscan-api:3001","DENCUN_FORK_SLOT":"","NETWORK_NAME":"mainnet","RUST_LOG":"blob_indexer=INFO"}` | Config file |
| blobscan-indexer.config.BLOBSCAN_API_ENDPOINT | string | `"http://blobscan-api:3001"` | Blobscan API service endpoint URL |
| blobscan-indexer.config.DENCUN_FORK_SLOT | string | `""` | Slot number when Dencun fork activated (uncomment and set for testnets) |
| blobscan-indexer.config.NETWORK_NAME | string | `"mainnet"` | Ethereum network name (mainnet, holesky, sepolia, gnosis) |
| blobscan-indexer.config.RUST_LOG | string | `"blob_indexer=INFO"` | Rust logging configuration for the blob indexer |
| blobscan-indexer.enabled | bool | `true` | Enable or disable the blobscan-indexer component |
| blobscan-indexer.externalConfigMaps | list | `[]` | External ConfigMaps to mount as environment variables Example: ["blobscan-indexer-config"] |
| blobscan-indexer.externalSecrets | list | `[]` | External Secrets to mount as environment variables Example: ["blobscan-indexer-secrets"] |
| blobscan-indexer.image.pullPolicy | string | `"IfNotPresent"` | blobscan-indexer container pull policy |
| blobscan-indexer.image.repository | string | `"blossomlabs/blobscan-indexer"` | blobscan-indexer container image repository |
| blobscan-indexer.image.tag | string | `"latest"` | blobscan-indexer container image tag |
| blobscan-indexer.replicas | int | `1` | Number of blobscan-indexer replicas |
| blobscan-indexer.resources.limits | object | `{"cpu":"1000m","memory":"200Mi"}` | Resource limits for blobscan-indexer pods |
| blobscan-indexer.resources.limits.cpu | string | `"1000m"` | CPU limit for blobscan-indexer |
| blobscan-indexer.resources.limits.memory | string | `"200Mi"` | Memory limit for blobscan-indexer |
| blobscan-indexer.resources.requests | object | `{"cpu":"500m","memory":"100Mi"}` | Resource requests for blobscan-indexer pods |
| blobscan-indexer.resources.requests.cpu | string | `"500m"` | CPU request for blobscan-indexer |
| blobscan-indexer.resources.requests.memory | string | `"100Mi"` | Memory request for blobscan-indexer |
| blobscan-indexer.secretEnv | object | `{"BEACON_NODE_ENDPOINT":"http://beacon-node:5052","EXECUTION_NODE_ENDPOINT":"http://execution-node:8545","SECRET_KEY":"supersecret","SENTRY_DSN":""}` | Secret env variables injected via a created secret |
| blobscan-indexer.secretEnv.BEACON_NODE_ENDPOINT | string | `"http://beacon-node:5052"` | Ethereum consensus layer (beacon chain) node endpoint URL |
| blobscan-indexer.secretEnv.EXECUTION_NODE_ENDPOINT | string | `"http://execution-node:8545"` | Ethereum execution layer node endpoint URL |
| blobscan-indexer.secretEnv.SECRET_KEY | string | `"supersecret"` | Secret key used for authentication and encryption |
| blobscan-indexer.secretEnv.SENTRY_DSN | string | `""` | Sentry DSN for error tracking and monitoring |
| blobscan-web | object | `{"config":{"BEE_ENDPOINT":"http://bee-0:1633","BLOBSCAN_API_BASE_URL":"http://blobscan-api:3001","BLOBSCAN_API_PORT":3001,"GOOGLE_STORAGE_BUCKET_NAME":"","GOOGLE_STORAGE_ENABLED":"false","GOOGLE_STORAGE_PROJECT_ID":"","LOG_LEVEL":"info","METRICS_ENABLED":"false","NETWORK_NAME":"mainnet","OTEL_EXPORTER_OTLP_ENDPOINT":"http://localhost:4318","OTEL_EXPORTER_OTLP_PROTOCOL":"http/protobuf","POSTGRES_STORAGE_ENABLED":"true","SWARM_STORAGE_ENABLED":"false","TRACES_ENABLED":"false"},"customArgs":["web"],"enabled":true,"externalConfigMaps":[],"externalSecrets":[],"httpPort":3000,"image":{"pullPolicy":"IfNotPresent","repository":"blossomlabs/blobscan-web","tag":"latest"},"replicas":1,"resources":{"limits":{"cpu":3,"memory":"512Mi"},"requests":{"cpu":1,"memory":"128Mi"}},"secretEnv":{"DATABASE_URL":"postgresql://postgres:postgres@blobscan-blobscandb:5432/blobscan?ssl=false","DIRECT_URL":"","FEEDBACK_WEBHOOK_URL":"","GOOGLE_SERVICE_KEY":"","OTLP_AUTH_PASSWORD":"","OTLP_AUTH_USERNAME":"","REDIS_URI":"redis://redis-master:6379/0","SECRET_KEY":"supersecret"}}` | Values for the blobscan-web subchart |
| blobscan-web.config.BEE_ENDPOINT | string | `"http://bee-0:1633"` | Swarm Bee node endpoint URL for decentralized storage interaction |
| blobscan-web.config.BLOBSCAN_API_BASE_URL | string | `"http://blobscan-api:3001"` | Base URL for the Blobscan API service |
| blobscan-web.config.BLOBSCAN_API_PORT | int | `3001` | Port on which the Blobscan API service listens |
| blobscan-web.config.GOOGLE_STORAGE_BUCKET_NAME | string | `""` | Google Cloud Storage bucket name for blob data storage |
| blobscan-web.config.GOOGLE_STORAGE_ENABLED | string | `"false"` | Enable Google Cloud Storage for blob data |
| blobscan-web.config.GOOGLE_STORAGE_PROJECT_ID | string | `""` | Google Cloud project ID for blob data storage |
| blobscan-web.config.LOG_LEVEL | string | `"info"` | Application logging level (debug, info, warn, error) |
| blobscan-web.config.METRICS_ENABLED | string | `"false"` | Enable metrics collection and reporting |
| blobscan-web.config.NETWORK_NAME | string | `"mainnet"` | Ethereum network name (mainnet, holesky, sepolia, gnosis) |
| blobscan-web.config.OTEL_EXPORTER_OTLP_ENDPOINT | string | `"http://localhost:4318"` | Endpoint URL for OpenTelemetry data export |
| blobscan-web.config.OTEL_EXPORTER_OTLP_PROTOCOL | string | `"http/protobuf"` | Protocol used for OpenTelemetry data export |
| blobscan-web.config.POSTGRES_STORAGE_ENABLED | string | `"true"` | Enable PostgreSQL storage for blob data |
| blobscan-web.config.SWARM_STORAGE_ENABLED | string | `"false"` | Enable Swarm decentralized storage for blob data |
| blobscan-web.config.TRACES_ENABLED | string | `"false"` | Enable distributed tracing |
| blobscan-web.enabled | bool | `true` | Enable or disable the blobscan-web component |
| blobscan-web.externalConfigMaps | list | `[]` | External ConfigMaps to mount as environment variables Example: ["blobscan-web-config"] |
| blobscan-web.externalSecrets | list | `[]` | External Secrets to mount as environment variables Example: ["blobscan-web-secrets"] |
| blobscan-web.image.pullPolicy | string | `"IfNotPresent"` | Docker image pull policy for blobscan-web |
| blobscan-web.image.repository | string | `"blossomlabs/blobscan-web"` | Docker image repository for blobscan-web |
| blobscan-web.image.tag | string | `"latest"` | Docker image tag for blobscan-web |
| blobscan-web.replicas | int | `1` | Number of blobscan-web replicas |
| blobscan-web.resources.limits | object | `{"cpu":3,"memory":"512Mi"}` | Resource limits for blobscan-web pods |
| blobscan-web.resources.limits.cpu | int | `3` | CPU limit for blobscan-web |
| blobscan-web.resources.limits.memory | string | `"512Mi"` | Memory limit for blobscan-web |
| blobscan-web.resources.requests | object | `{"cpu":1,"memory":"128Mi"}` | Resource requests for blobscan-web pods |
| blobscan-web.resources.requests.cpu | int | `1` | CPU request for blobscan-web |
| blobscan-web.resources.requests.memory | string | `"128Mi"` | Memory request for blobscan-web |
| blobscan-web.secretEnv.DATABASE_URL | string | `"postgresql://postgres:postgres@blobscan-blobscandb:5432/blobscan?ssl=false"` | PostgreSQL connection string for the main database connection |
| blobscan-web.secretEnv.DIRECT_URL | string | `""` | Direct PostgreSQL connection string, used for Prisma direct database access |
| blobscan-web.secretEnv.FEEDBACK_WEBHOOK_URL | string | `""` | Discord webhook for feedback form |
| blobscan-web.secretEnv.GOOGLE_SERVICE_KEY | string | `""` | Google Cloud service account key for authentication (JSON format) |
| blobscan-web.secretEnv.OTLP_AUTH_PASSWORD | string | `""` | Password for OpenTelemetry authentication |
| blobscan-web.secretEnv.OTLP_AUTH_USERNAME | string | `""` | Username for OpenTelemetry authentication |
| blobscan-web.secretEnv.REDIS_URI | string | `"redis://redis-master:6379/0"` | Redis connection URI for caching and queue management |
| blobscan-web.secretEnv.SECRET_KEY | string | `"supersecret"` | Secret key used for session management and encryption |
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
| terminationGracePeriodSeconds | int | `30` | How long to wait until the pod is forcefully terminated |
| tolerations | list | `[]` | Tolerations for pods |
| topologySpreadConstraints | list | `[]` | Topology Spread Constraints for pods |
