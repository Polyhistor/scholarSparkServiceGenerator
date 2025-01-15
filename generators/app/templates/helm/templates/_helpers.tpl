# Path: generators/app/templates/helm/templates/_helpers.tpl
{{/*
Expand the name of the chart.
*/}}
{{- define "<%= serviceName %>.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "<%= serviceName %>.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "<%= serviceName %>.labels" -}}
helm.sh/chart: {{ include "<%= serviceName %>.chart" . }}
{{ include "<%= serviceName %>.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "<%= serviceName %>.selectorLabels" -}}
app.kubernetes.io/name: {{ include "<%= serviceName %>.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}