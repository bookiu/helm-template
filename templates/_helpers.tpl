{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "selectorLabels" -}}
app.kubernetes.io/name: {{ include "name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "labels" -}}
helm.sh/chart: {{ include "chart" . }}
{{ include "selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Full image uri with tag
*/}}
{{- define "imageUri" -}}
{{- printf "%s/%s/%s:%s" (regexReplaceAll "https?://" .Values.image.registry "") .Values.image.repositoryName .Values.image.name .Values.image.tag }}
{{- end }}

{{/*
App config map name
*/}}
{{- define "appEnvConfigMapName" -}}
{{ include "name" . }}-env
{{- end }}
