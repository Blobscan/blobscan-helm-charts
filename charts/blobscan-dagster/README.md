
# blobscan-dagster

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

Blobscan Dagster orchestration platform for data pipelines and analytics.

**Homepage:** <https://blobscan.com>

## Architecture

This chart deploys three main components:

- **Webserver** — The Dagster UI (dagster-webserver) for monitoring and managing pipeline runs, served on port 3000.
- **Daemon** — The Dagster daemon responsible for scheduling, sensor evaluation, and run queuing.
- **User Code** — A gRPC server that hosts the user-defined Dagster definitions (jobs, assets, schedules), served on port 4000.

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

> **Note:** This will not delete the PostgreSQL PVC. To fully clean up, delete the PVC manually.

## Using an External PostgreSQL

To use an external PostgreSQL instance instead of the bundled subchart:

```yaml
postgresql:
  enabled: false

externalPostgresql:
  host: "my-postgres-host"
  port: 5432
  database: "dagster"
  username: "dagster"

secretEnv:
  DAGSTER_POSTGRES_PASSWORD: "my-secret-password"
```

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
| daemon.image.repository | string | `"blossomlabs/blobscan-dagster"` | Daemon container image repository |
| daemon.image.tag | string | `"latest"` | Daemon container image tag |
| daemon.podAnnotations | object | `{}` | Pod annotations |
| daemon.podLabels | object | `{}` |  |
| daemon.resources | object | `{}` | Resource requests and limits |
| dagsterInstance.maxConcurrentRuns | int | `5` | Run coordinator max concurrent runs |
| externalPostgresql.database | string | `"dagster"` | External PostgreSQL database name |
| externalPostgresql.host | string | `""` | External PostgreSQL hostname |
| externalPostgresql.password | string | `""` | External PostgreSQL password (use secretEnv.DAGSTER_POSTGRES_PASSWORD instead) |
| externalPostgresql.port | int | `5432` | External PostgreSQL port |
| externalPostgresql.username | string | `"dagster"` | External PostgreSQL username |
| extraContainers | list | `[]` |  |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| imagePullSecrets | list | `[]` | Image pull secrets for Docker images |
| initContainers | list | `[]` |  |
| nameOverride | string | `""` | Overrides the chart's name |
| nodeSelector | object | `{}` | Node selector for pods |
| postgresql.auth.database | string | `"dagster"` | PostgreSQL database name |
| postgresql.auth.password | string | `"dagster"` | PostgreSQL password |
| postgresql.auth.username | string | `"dagster"` | PostgreSQL username |
| postgresql.enabled | bool | `true` | Enable the PostgreSQL subchart |
| postgresql.primary.persistence.enabled | bool | `true` | Enable persistence for PostgreSQL |
| postgresql.primary.persistence.size | string | `"8Gi"` | Persistent volume size |
| postgresql.primary.resources | object | `{}` |  |
| postgresql.primary.service.ports.postgresql | int | `5432` |  |
| secretEnv | object | `{}` |  |
| securityContext | object | See `values.yaml` | The security context for pods |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
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
| usercode.image.repository | string | `"blossomlabs/blobscan-dagster-usercode"` | User code container image repository |
| usercode.image.tag | string | `"latest"` | User code container image tag |
| usercode.module | string | `"analytics.definitions"` | The dagster module to load definitions from |
| usercode.podAnnotations | object | `{}` | Pod annotations |
| usercode.podLabels | object | `{}` |  |
| usercode.port | int | `4000` | gRPC server port |
| usercode.replicaCount | int | `1` | Number of user code replicas |
| usercode.resources | object | `{}` | Resource requests and limits |
| usercode.service.port | int | `4000` | Service port |
| usercode.service.type | string | `"ClusterIP"` | Service type |
| webserver.enabled | bool | `true` | Enable the webserver deployment |
| webserver.extraEnv | list | `[]` | Additional env variables |
| webserver.extraVolumeMounts | list | `[]` | Additional volume mounts |
| webserver.extraVolumes | list | `[]` | Additional volumes |
| webserver.image.pullPolicy | string | `"IfNotPresent"` | Webserver container pull policy |
| webserver.image.repository | string | `"blossomlabs/blobscan-dagster"` | Webserver container image repository |
| webserver.image.tag | string | `"latest"` | Webserver container image tag |
| webserver.livenessProbe | object | `{"httpGet":{"path":"/server_info","port":"http"},"initialDelaySeconds":30,"periodSeconds":10}` | Liveness probe configuration |
| webserver.podAnnotations | object | `{}` | Pod annotations |
| webserver.podLabels | object | `{}` |  |
| webserver.port | int | `3000` | Webserver port |
| webserver.readinessProbe | object | `{"httpGet":{"path":"/server_info","port":"http"},"initialDelaySeconds":15,"periodSeconds":10}` | Readiness probe configuration |
| webserver.replicaCount | int | `1` | Number of webserver replicas |
| webserver.resources | object | `{}` | Resource requests and limits |
| webserver.service.port | int | `3000` | Service port |
| webserver.service.type | string | `"ClusterIP"` | Service type |
