
# blobscan-dagster

![Version: 0.2.7](https://img.shields.io/badge/Version-0.2.7-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.13.26](https://img.shields.io/badge/AppVersion-1.13.26-informational?style=flat-square)

Blobscan Dagster orchestration platform for data pipelines and analytics.

**Homepage:** <https://blobscan.com>

## Architecture

This chart deploys three main components:

- **Webserver** — The Dagster UI (dagster-webserver) for monitoring and managing pipeline runs, served on port 3000.
- **Daemon** — The Dagster daemon responsible for scheduling, sensor evaluation, and run queuing.
- **User Code** — A gRPC server that hosts the user-defined Dagster definitions (jobs, assets, schedules), served on port 4000. Its image is also the image every run executes in.

All components share a PostgreSQL database for run storage, event log storage, and schedule storage.

## Installing the Chart

```bash
helm repo add blobscan https://blobscan.github.io/blobscan-helm-charts
helm repo update
helm install blobscan-dagster blobscan/blobscan-dagster
```

### With custom values

```bash
helm install blobscan-dagster blobscan/blobscan-dagster -f my-values.yaml
```

## Upgrading

```bash
helm upgrade blobscan-dagster blobscan/blobscan-dagster
```

## Uninstalling

```bash
helm uninstall blobscan-dagster
```

## PostgreSQL

The bundled Bitnami subchart is disabled by default (Bitnami stopped publishing
its free images in 2025). Point the chart at an existing PostgreSQL instead:

```yaml
externalPostgresql:
  host: "my-postgres-host"
  port: 5432
  database: "dagster"
  username: "dagster"
  # An existing Secret holding the password, e.g. a CloudNativePG role secret.
  existingSecret: "my-postgres-secret"
  existingSecretKey: "password"
```

Without `existingSecret`, the password is read from
`secretEnv.DAGSTER_POSTGRES_PASSWORD`.

## Runs

Runs are launched by the `K8sRunLauncher`: each run is a Kubernetes Job in the
user code image, with the same environment as the user code server. The chart
creates the ServiceAccount, Role and RoleBinding this needs (`serviceAccount.create`,
`rbac.create`).

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| PabloCastellano | pablo@anche.no |  |

## Source Code

* <https://github.com/blobscan/blobscan>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 16.4.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| annotations | object | `{}` | Annotations for the Deployments |
| containerSecurityContext | object | See `values.yaml` | The security context for containers |
| daemon.enabled | bool | `true` | Enable the daemon deployment |
| daemon.extraEnv | list | `[]` | Additional env variables |
| daemon.extraVolumeMounts | list | `[]` | Additional volume mounts |
| daemon.extraVolumes | list | `[]` | Additional volumes |
| daemon.image.pullPolicy | string | `"IfNotPresent"` | Daemon container pull policy |
| daemon.image.repository | string | `"dagster/dagster-k8s"` | Daemon container image repository. The official image: it ships dagster-webserver, dagster-daemon, dagster-postgres and dagster-k8s. |
| daemon.image.tag | string | `""` | Daemon container image tag. Empty means the chart's appVersion, the dagster version the user code image is locked to. |
| daemon.podAnnotations | object | `{}` | Pod annotations |
| daemon.podLabels | object | `{}` |  |
| daemon.resources | object | `{}` | Resource requests and limits |
| dagsterInstance.maxConcurrentRuns | int | `5` | Run coordinator max concurrent runs |
| dagsterInstance.poolDefaultLimit | int | `1` | Default limit of every concurrency pool (`concurrency.pools.default_limit`). Each metrics asset runs in its own pool (`metrics/<table>`), so 1 means at most one run writes a metrics table at a time, whether scheduled, automation or backfill. Without it Dagster leaves pools unlimited. Set to null to drop it. |
| dagsterInstance.tagConcurrencyLimits | list | See `values.yaml` | Run coordinator tag concurrency limits. The default is the one in apps/dagster/dagster.yaml: at most 3 backfill runs, leaving room for the scheduled ones while a backfill is in progress. |
| externalPostgresql.database | string | `"dagster"` | External PostgreSQL database name |
| externalPostgresql.existingSecret | string | `""` | Existing Secret holding the password, e.g. the basic-auth Secret of a CloudNativePG managed role. When empty, the password is read from `secretEnv.DAGSTER_POSTGRES_PASSWORD`. |
| externalPostgresql.existingSecretKey | string | `"password"` | Key in `existingSecret` that holds the password |
| externalPostgresql.host | string | `""` | External PostgreSQL hostname |
| externalPostgresql.port | int | `5432` | External PostgreSQL port |
| externalPostgresql.username | string | `"dagster"` | External PostgreSQL username |
| extraContainers | list | `[]` |  |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| imagePullSecrets | list | `[]` | Image pull secrets for Docker images |
| initContainers | list | `[]` | Additional init containers (webserver and daemon) |
| nameOverride | string | `""` | Overrides the chart's name |
| nodeSelector | object | `{}` | Node selector for pods |
| postgresql.auth.database | string | `"dagster"` | PostgreSQL database name |
| postgresql.auth.password | string | `"dagster"` | PostgreSQL password |
| postgresql.auth.username | string | `"dagster"` | PostgreSQL username |
| postgresql.enabled | bool | `false` | Enable the PostgreSQL subchart. Off by default: Bitnami stopped publishing its free images in 2025, so the subchart no longer pulls without an image override. Use `externalPostgresql`. |
| postgresql.primary.persistence.enabled | bool | `true` | Enable persistence for PostgreSQL |
| postgresql.primary.persistence.size | string | `"8Gi"` | Persistent volume size |
| postgresql.primary.resources | object | `{}` |  |
| postgresql.primary.service.ports.postgresql | int | `5432` |  |
| rbac.create | bool | `true` | Create the Role and RoleBinding the K8sRunLauncher needs to create run Jobs and follow their pods. Without it every launched run fails. |
| runLauncher.jobSpecConfig | object | `{}` | Extra fields for the run Job spec, e.g. ttlSecondsAfterFinished or backoffLimit. Dagster deletes finished Jobs after a day by default. |
| runLauncher.podLabels | object | `{}` | Labels added to run pods |
| runLauncher.resources | object | `{}` | Resource requests and limits for run pods |
| secretEnv | object | `{}` |  |
| securityContext | object | See `values.yaml` | The security context for pods |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created. The K8sRunLauncher creates Jobs as this account, see `rbac.create`. |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| terminationGracePeriodSeconds | int | `30` |  |
| tolerations | list | `[]` | Tolerations for pods |
| topologySpreadConstraints | list | `[]` | Topology Spread Constraints for pods |
| usercode.enabled | bool | `true` | Enable the user code deployment |
| usercode.extraEnv | list | `[]` | Additional env variables |
| usercode.extraVolumeMounts | list | `[]` | Additional volume mounts |
| usercode.extraVolumes | list | `[]` | Additional volumes |
| usercode.healthCheck | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":10,"periodSeconds":10,"timeoutSeconds":3}` | Health check configuration |
| usercode.image.pullPolicy | string | `"IfNotPresent"` | User code container pull policy |
| usercode.image.repository | string | `"blossomlabs/blobscan-dagster"` | User code container image repository |
| usercode.image.tag | string | `"latest"` | User code container image tag |
| usercode.module | string | `"analytics.definitions"` | The dagster module to load definitions from |
| usercode.podAnnotations | object | `{}` | Pod annotations |
| usercode.podLabels | object | `{}` |  |
| usercode.port | int | `4000` | gRPC server port |
| usercode.replicaCount | int | `1` | Number of user code replicas |
| usercode.resources | object | `{}` | Resource requests and limits |
| usercode.service.port | int | `4000` | Service port |
| usercode.service.type | string | `"ClusterIP"` | Service type |
| waitForUsercode | bool | `true` |  |
| webserver.enabled | bool | `true` | Enable the webserver deployment |
| webserver.extraEnv | list | `[]` | Additional env variables |
| webserver.extraVolumeMounts | list | `[]` | Additional volume mounts |
| webserver.extraVolumes | list | `[]` | Additional volumes |
| webserver.image.pullPolicy | string | `"IfNotPresent"` | Webserver container pull policy |
| webserver.image.repository | string | `"dagster/dagster-k8s"` | Webserver container image repository. The official image: it ships dagster-webserver, dagster-daemon, dagster-postgres and dagster-k8s. |
| webserver.image.tag | string | `""` | Webserver container image tag. Empty means the chart's appVersion, the dagster version the user code image is locked to. |
| webserver.livenessProbe | object | `{"httpGet":{"path":"/server_info","port":"http"},"initialDelaySeconds":30,"periodSeconds":10}` | Liveness probe configuration |
| webserver.locationReloader.enabled | bool | `true` | Run a sidecar that reloads any code location the webserver holds in an error state. The webserver does not retry a location that failed to load, e.g. when it reached the code server while a rollout was replacing it, and then lists no assets until someone presses Reload. |
| webserver.locationReloader.intervalSeconds | int | `30` | How often to check the code locations |
| webserver.podAnnotations | object | `{}` | Pod annotations |
| webserver.podLabels | object | `{}` |  |
| webserver.port | int | `3000` | Webserver port |
| webserver.readinessProbe | object | `{"httpGet":{"path":"/server_info","port":"http"},"initialDelaySeconds":15,"periodSeconds":10}` | Readiness probe configuration |
| webserver.replicaCount | int | `1` | Number of webserver replicas |
| webserver.resources | object | `{}` | Resource requests and limits |
| webserver.service.port | int | `3000` | Service port |
| webserver.service.type | string | `"ClusterIP"` | Service type |
