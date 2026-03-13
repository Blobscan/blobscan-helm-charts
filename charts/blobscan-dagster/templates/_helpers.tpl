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
