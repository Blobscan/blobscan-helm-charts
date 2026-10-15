{{/*
Expand the name of the chart.
*/}}
{{- define "blobscan-dagster.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "blobscan-dagster.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "blobscan-dagster.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "blobscan-dagster.labels" -}}
helm.sh/chart: {{ include "blobscan-dagster.chart" . }}
{{ include "blobscan-dagster.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "blobscan-dagster.selectorLabels" -}}
app.kubernetes.io/name: {{ include "blobscan-dagster.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Webserver labels
*/}}
{{- define "blobscan-dagster.webserver.labels" -}}
{{ include "blobscan-dagster.labels" . }}
app.kubernetes.io/component: webserver
{{- end }}

{{/*
Webserver selector labels
*/}}
{{- define "blobscan-dagster.webserver.selectorLabels" -}}
{{ include "blobscan-dagster.selectorLabels" . }}
app.kubernetes.io/component: webserver
{{- end }}

{{/*
Daemon labels
*/}}
{{- define "blobscan-dagster.daemon.labels" -}}
{{ include "blobscan-dagster.labels" . }}
app.kubernetes.io/component: daemon
{{- end }}

{{/*
Daemon selector labels
*/}}
{{- define "blobscan-dagster.daemon.selectorLabels" -}}
{{ include "blobscan-dagster.selectorLabels" . }}
app.kubernetes.io/component: daemon
{{- end }}

{{/*
User code labels
*/}}
{{- define "blobscan-dagster.usercode.labels" -}}
{{ include "blobscan-dagster.labels" . }}
app.kubernetes.io/component: usercode
{{- end }}

{{/*
User code selector labels
*/}}
{{- define "blobscan-dagster.usercode.selectorLabels" -}}
{{ include "blobscan-dagster.selectorLabels" . }}
app.kubernetes.io/component: usercode
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "blobscan-dagster.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "blobscan-dagster.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
PostgreSQL hostname
*/}}
{{- define "blobscan-dagster.postgresqlHost" -}}
{{- if .Values.postgresql.enabled }}
{{- printf "%s-postgresql" (include "blobscan-dagster.fullname" .) }}
{{- else }}
{{- .Values.externalPostgresql.host }}
{{- end }}
{{- end }}

{{/*
PostgreSQL port
*/}}
{{- define "blobscan-dagster.postgresqlPort" -}}
{{- if .Values.postgresql.enabled }}
{{- .Values.postgresql.primary.service.ports.postgresql | default 5432 }}
{{- else }}
{{- .Values.externalPostgresql.port | default 5432 }}
{{- end }}
{{- end }}

{{/*
PostgreSQL database
*/}}
{{- define "blobscan-dagster.postgresqlDatabase" -}}
{{- if .Values.postgresql.enabled }}
{{- .Values.postgresql.auth.database }}
{{- else }}
{{- .Values.externalPostgresql.database }}
{{- end }}
{{- end }}

{{/*
PostgreSQL username
*/}}
{{- define "blobscan-dagster.postgresqlUsername" -}}
{{- if .Values.postgresql.enabled }}
{{- .Values.postgresql.auth.username }}
{{- else }}
{{- .Values.externalPostgresql.username }}
{{- end }}
{{- end }}

{{/*
User code image. Also the image the K8sRunLauncher runs each run in: the
launcher takes it from DAGSTER_CURRENT_IMAGE on the code server.
*/}}
{{- define "blobscan-dagster.usercodeImage" -}}
{{- printf "%s:%s" .Values.usercode.image.repository .Values.usercode.image.tag }}
{{- end }}

{{/*
The DAGSTER_POSTGRES_* variables dagster.yaml reads its storage settings from.
Every process that opens the instance needs them: webserver, daemon, code
server and each launched run.
*/}}
{{- define "blobscan-dagster.postgresEnv" -}}
- name: DAGSTER_POSTGRES_HOST
  value: {{ include "blobscan-dagster.postgresqlHost" . | quote }}
- name: DAGSTER_POSTGRES_PORT
  value: {{ include "blobscan-dagster.postgresqlPort" . | quote }}
- name: DAGSTER_POSTGRES_DB
  value: {{ include "blobscan-dagster.postgresqlDatabase" . | quote }}
- name: DAGSTER_POSTGRES_USER
  value: {{ include "blobscan-dagster.postgresqlUsername" . | quote }}
- name: DAGSTER_POSTGRES_PASSWORD
  valueFrom:
    secretKeyRef:
      {{- if .Values.postgresql.enabled }}
      name: {{ include "blobscan-dagster.fullname" . }}-postgresql
      key: password
      {{- else if .Values.externalPostgresql.existingSecret }}
      name: {{ .Values.externalPostgresql.existingSecret }}
      key: {{ .Values.externalPostgresql.existingSecretKey }}
      {{- else }}
      name: {{ include "blobscan-dagster.fullname" . }}-env
      key: DAGSTER_POSTGRES_PASSWORD
      {{- end }}
{{- end }}

{{/*
secretEnv entries, as references into the chart's -env Secret.
DAGSTER_POSTGRES_PASSWORD is skipped: postgresEnv already sets it.
*/}}
{{- define "blobscan-dagster.secretEnvRefs" -}}
{{- range $key, $value := .Values.secretEnv }}
{{- if ne $key "DAGSTER_POSTGRES_PASSWORD" }}
- name: {{ $key }}
  valueFrom:
    secretKeyRef:
      name: {{ include "blobscan-dagster.fullname" $ }}-env
      key: {{ $key }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Init container that waits for the user code server to answer gRPC. Without it
the webserver can start first, fail to reach the code server, and keep that
error: a location that fails its first load is not retried, so the UI shows no
assets until someone reloads the location by hand. Takes the component's
image values (it only needs the dagster CLI) and the root context.
*/}}
{{- define "blobscan-dagster.waitForUsercode" -}}
{{- $image := index . 0 }}
{{- $ := index . 1 -}}
- name: wait-for-usercode
  image: "{{ $image.repository }}:{{ $image.tag }}"
  imagePullPolicy: {{ $image.pullPolicy }}
  command:
    - sh
    - -c
    - |
      until dagster api grpc-health-check --host {{ include "blobscan-dagster.fullname" $ }}-usercode -p {{ $.Values.usercode.port }}; do
        echo "waiting for the user code server"; sleep 2
      done
  securityContext:
    {{- toYaml $.Values.containerSecurityContext | nindent 4 }}
{{- end }}
