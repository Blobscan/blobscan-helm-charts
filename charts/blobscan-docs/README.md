
# blobscan-docs

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Helm chart for deploying Blobscan documentation website

**Homepage:** <https://blobscan.com>

## Architecture

The Blobscan documentation website is a static site that provides user and developer documentation for the Blobscan project. It is served on port 3002 by default.

## Installing the Chart

```bash
helm repo add blobscan https://blobscan.github.io/blobscan-helm-charts
helm repo update
helm install blobscan-docs blobscan/blobscan-docs
```

### With custom values

```bash
helm install blobscan-docs blobscan/blobscan-docs -f my-values.yaml
```

## Upgrading

```bash
helm upgrade blobscan-docs blobscan/blobscan-docs
```

## Uninstalling

```bash
helm uninstall blobscan-docs
```

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| PabloCastellano | pablo@anche.no |  |

## Source Code

* <https://github.com/blobscan/blobscan/>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity configuration for pods |
| deploymentAnnotations | object | `{}` | Annotations for the Deployment |
| env | object | `{}` | Environment variables to set in the container |
| envFrom | list | `[]` | Environment variables from secrets or configmaps |
| externalConfigMaps | list | `[]` | External ConfigMaps to mount as environment variables |
| externalSecrets | list | `[]` | External Secrets to mount as environment variables |
| fullnameOverride | string | `""` | Overrides the chart's computed fullname |
| image.pullPolicy | string | `"IfNotPresent"` | Docker image pull policy for blobscan-docs |
| image.repository | string | `"blossomlabs/blobscan-docs"` | Docker image repository for blobscan-docs |
| image.tag | string | `"latest"` | Docker image tag for blobscan-docs |
| imagePullSecrets | list | `[]` | Image pull secrets for Docker images |
| ingress | object | `{"annotations":{},"enabled":false,"hosts":[{"host":"docs.blobscan.local","paths":[{"path":"/","pathType":"Prefix"}]}],"tls":[]}` | Ingress configuration |
| ingress.annotations | object | `{}` | Ingress annotations |
| ingress.enabled | bool | `false` | Enable ingress resource |
| ingress.hosts | list | `[{"host":"docs.blobscan.local","paths":[{"path":"/","pathType":"Prefix"}]}]` | Ingress hosts and paths configuration |
| ingress.tls | list | `[]` | Ingress TLS configuration |
| livenessProbe | object | `{"httpGet":{"path":"/","port":3002},"initialDelaySeconds":30,"periodSeconds":10}` | Liveness probe configuration |
| nameOverride | string | `""` | Overrides the chart's name |
| nodeSelector | object | `{}` | Node selector for pod assignment |
| podAnnotations | object | `{}` | Annotations for the Pod |
| podLabels | object | `{}` | Pod labels |
| readinessProbe | object | `{"httpGet":{"path":"/","port":3002},"initialDelaySeconds":10,"periodSeconds":10}` | Readiness probe configuration |
| replicas | int | `1` | Number of replicas |
| resources.limits | object | `{"cpu":"500m","memory":"256Mi"}` | Resource limits for pods |
| resources.limits.cpu | string | `"500m"` | CPU limit |
| resources.limits.memory | string | `"256Mi"` | Memory limit |
| resources.requests | object | `{"cpu":"100m","memory":"128Mi"}` | Resource requests for pods |
| resources.requests.cpu | string | `"100m"` | CPU request |
| resources.requests.memory | string | `"128Mi"` | Memory request |
| service | object | `{"ports":{"http":{"port":80,"protocol":"TCP","targetPort":3002}},"type":"ClusterIP"}` | Configuration for the service |
| service.ports | object | `{"http":{"port":80,"protocol":"TCP","targetPort":3002}}` | Port configuration for the service |
| service.ports.http | object | `{"port":80,"protocol":"TCP","targetPort":3002}` | HTTP port |
| service.type | string | `"ClusterIP"` | Type of service |
| serviceAccount | object | `{"annotations":{},"create":false,"name":""}` | Service account for the pod |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use |
| tolerations | list | `[]` | Tolerations for pod assignment |
