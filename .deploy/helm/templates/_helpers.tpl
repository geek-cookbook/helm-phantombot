{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "PhantomBot.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "PhantomBot.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "PhantomBot.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "PhantomBot.labels" -}}
helm.sh/chart: {{ include "PhantomBot.chart" . }}
{{ include "PhantomBot.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "PhantomBot.selectorLabels" -}}
app.kubernetes.io/name: {{ include "PhantomBot.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}



{{/*
Contains the PhantomBot Logo in ANSI/ASCII form
*/}}
{{- define "PhantomBot.Logo" -}}
[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m 
[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m 
[38;5;000m [38;5;m([38;5;m([38;5;m [38;5;m([38;5;m([38;5;m([38;5;m([38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m&[38;5;m([38;5;m([38;5;m([38;5;m#[38;5;000m 
[38;5;000m [38;5;m([38;5;m([38;5;m#[38;5;m [38;5;000m [38;5;m&[38;5;m([38;5;m([38;5;m([38;5;m([38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m&[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m#[38;5;m([38;5;m([38;5;m([38;5;m([38;5;m&[38;5;m [38;5;m#[38;5;m([38;5;m(
[38;5;000m [38;5;m([38;5;m([38;5;m([38;5;m#[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m&[38;5;m([38;5;m([38;5;m([38;5;m([38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m [38;5;m([38;5;m([38;5;m([38;5;m&[38;5;000m [38;5;m [38;5;m([38;5;m([38;5;m([38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m&[38;5;m([38;5;m([38;5;m([38;5;m([38;5;m%[38;5;m [38;5;000m [38;5;000m [38;5;000m [38;5;m([38;5;m#[38;5;m([38;5;m(
[38;5;000m [38;5;m&[38;5;m([38;5;m([38;5;m([38;5;m#[38;5;000m [38;5;000m [38;5;008m/[38;5;008m([38;5;000m [38;5;000m [38;5;m&[38;5;m([38;5;m([38;5;m([38;5;m([38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m&[38;5;m([38;5;m([38;5;m#[38;5;m&[38;5;000m [38;5;005m([38;5;000m&[38;5;m [38;5;m#[38;5;m([38;5;m([38;5;m#[38;5;000m [38;5;000m [38;5;m([38;5;m([38;5;m([38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m([38;5;m([38;5;m([38;5;m([38;5;m#[38;5;m [38;5;000m [38;5;000m [38;5;008m/[38;5;008m/[38;5;000m [38;5;m [38;5;m#[38;5;m([38;5;m([38;5;m([38;5;000m 
[38;5;000m [38;5;000m [38;5;m#[38;5;m([38;5;m#[38;5;m([38;5;m%[38;5;000m [38;5;000m [38;5;008m/[38;5;005m#[38;5;008m([38;5;008m([38;5;000m [38;5;000m [38;5;m%[38;5;m([38;5;m([38;5;m([38;5;m([38;5;000m [38;5;000m [38;5;000m [38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;000m [38;5;000m [38;5;000m [38;5;m([38;5;m([38;5;m([38;5;m%[38;5;m([38;5;m([38;5;m([38;5;m&[38;5;000m [38;5;005m#[38;5;008m/[38;5;008m/[38;5;005m#[38;5;000m [38;5;m#[38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m#[38;5;m [38;5;m([38;5;m([38;5;m([38;5;000m [38;5;000m [38;5;000m [38;5;m([38;5;m([38;5;m([38;5;m([38;5;m#[38;5;m [38;5;000m [38;5;000m [38;5;008m([38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m/[38;5;000m&[38;5;m [38;5;m#[38;5;m#[38;5;m([38;5;m([38;5;000m [38;5;000m 
[38;5;000m [38;5;000m [38;5;000m [38;5;m [38;5;m([38;5;m([38;5;m([38;5;m&[38;5;000m [38;5;005m#[38;5;008m/[38;5;005m([38;5;005m#[38;5;005m([38;5;008m/[38;5;008m/[38;5;000m [38;5;000m [38;5;m&[38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m [38;5;m [38;5;m([38;5;m([38;5;m([38;5;m([38;5;m%[38;5;m [38;5;m#[38;5;m([38;5;m([38;5;m%[38;5;000m [38;5;000m [38;5;008m/[38;5;008m/[38;5;008m([38;5;008m/[38;5;008m([38;5;000m [38;5;m&[38;5;m([38;5;m([38;5;m([38;5;m#[38;5;m [38;5;000m [38;5;000m [38;5;m#[38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m&[38;5;000m [38;5;000m [38;5;005m#[38;5;008m/[38;5;008m/[38;5;008m/[38;5;005m([38;5;005m([38;5;008m/[38;5;008m/[38;5;000m&[38;5;000m [38;5;m([38;5;m([38;5;m([38;5;m([38;5;m&[38;5;000m [38;5;000m 
[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m%[38;5;m([38;5;m([38;5;m([38;5;m [38;5;000m [38;5;008m([38;5;008m/[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;008m/[38;5;008m/[38;5;008m/[38;5;000m&[38;5;000m [38;5;m [38;5;m([38;5;m([38;5;m([38;5;m [38;5;005m%[38;5;000m [38;5;m [38;5;m([38;5;m [38;5;m [38;5;000m [38;5;m [38;5;m%[38;5;000m [38;5;000m [38;5;008m([38;5;008m/[38;5;008m([38;5;005m#[38;5;005m([38;5;008m/[38;5;008m/[38;5;000m&[38;5;m [38;5;m([38;5;m%[38;5;000m [38;5;004m&[38;5;008m/[38;5;008m([38;5;000m [38;5;m([38;5;m([38;5;m([38;5;m%[38;5;m [38;5;000m [38;5;000m&[38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m/[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;008m/[38;5;008m/[38;5;000m&[38;5;000m [38;5;m#[38;5;m([38;5;m([38;5;m([38;5;000m [38;5;000m [38;5;000m [38;5;000m 
[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m#[38;5;m([38;5;m([38;5;m([38;5;m [38;5;000m [38;5;008m/[38;5;008m/[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;008m([38;5;008m/[38;5;008m/[38;5;008m/[38;5;004m&[38;5;000m [38;5;m [38;5;000m [38;5;005m#[38;5;008m/[38;5;008m([38;5;000m [38;5;000m [38;5;005m%[38;5;008m([38;5;000m [38;5;000m [38;5;008m([38;5;008m/[38;5;008m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m([38;5;008m/[38;5;008m/[38;5;005m#[38;5;000m [38;5;000m [38;5;005m%[38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m([38;5;000m [38;5;m [38;5;000m [38;5;000m [38;5;008m([38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m/[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;008m([38;5;008m/[38;5;004m%[38;5;000m [38;5;m#[38;5;m([38;5;m([38;5;m([38;5;m [38;5;000m [38;5;000m [38;5;000m [38;5;000m 
[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m([38;5;m([38;5;m#[38;5;m([38;5;000m [38;5;000m&[38;5;008m/[38;5;008m/[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m([38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m/[38;5;005m#[38;5;005m([38;5;008m/[38;5;008m([38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m/[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m([38;5;008m/[38;5;008m/[38;5;008m/[38;5;005m#[38;5;008m/[38;5;008m/[38;5;008m([38;5;005m([38;5;008m/[38;5;008m/[38;5;008m([38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m/[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;008m/[38;5;008m/[38;5;005m%[38;5;000m [38;5;m#[38;5;m([38;5;m([38;5;m([38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m 
[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m([38;5;m([38;5;m#[38;5;m([38;5;000m [38;5;005m#[38;5;008m/[38;5;008m/[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;008m([38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m/[38;5;005m([38;5;005m#[38;5;005m([38;5;005m([38;5;005m#[38;5;008m/[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m([38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m/[38;5;005m([38;5;005m#[38;5;005m#[38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m/[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;008m([38;5;008m/[38;5;005m%[38;5;000m [38;5;m#[38;5;m#[38;5;m([38;5;m([38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m 
[38;5;000m [38;5;000m [38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m%[38;5;000m [38;5;008m([38;5;008m/[38;5;008m/[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m([38;5;008m/[38;5;008m/[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;008m([38;5;008m/[38;5;008m/[38;5;008m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;008m([38;5;008m/[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;008m([38;5;008m/[38;5;005m#[38;5;000m [38;5;m#[38;5;m([38;5;m([38;5;m([38;5;m&[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m 
[38;5;000m [38;5;m([38;5;m([38;5;m#[38;5;m%[38;5;000m [38;5;000m [38;5;m [38;5;m [38;5;m%[38;5;m([38;5;m([38;5;m [38;5;000m [38;5;008m/[38;5;008m/[38;5;008m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;008m([38;5;008m/[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;008m([38;5;008m/[38;5;005m#[38;5;000m [38;5;m#[38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m&[38;5;000m [38;5;000m 
[38;5;000m [38;5;m&[38;5;m([38;5;m([38;5;m#[38;5;m#[38;5;m#[38;5;m [38;5;000m [38;5;008m/[38;5;008m([38;5;008m/[38;5;008m/[38;5;005m#[38;5;005m%[38;5;008m/[38;5;008m/[38;5;008m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;008m([38;5;008m/[38;5;005m#[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m%[38;5;m#[38;5;m([38;5;m([38;5;m([38;5;000m [38;5;000m 
[38;5;000m [38;5;000m [38;5;000m [38;5;m [38;5;m([38;5;m([38;5;m([38;5;m#[38;5;m#[38;5;m [38;5;000m [38;5;008m([38;5;008m/[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;008m([38;5;008m/[38;5;008m/[38;5;008m([38;5;005m([38;5;005m#[38;5;008m([38;5;008m([38;5;000m [38;5;000m [38;5;m#[38;5;m([38;5;m#[38;5;m([38;5;m([38;5;m%[38;5;000m [38;5;000m [38;5;000m 
[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m([38;5;m([38;5;m([38;5;m#[38;5;m#[38;5;m [38;5;000m [38;5;005m#[38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m/[38;5;005m([38;5;005m#[38;5;008m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m([38;5;008m/[38;5;005m#[38;5;000m [38;5;m [38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m%[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m 
[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m([38;5;m([38;5;m#[38;5;m#[38;5;m#[38;5;m [38;5;000m [38;5;008m/[38;5;008m/[38;5;008m/[38;5;005m#[38;5;005m#[38;5;005m#[38;5;007m,[38;5;015m [38;5;007m,[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m([38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m/[38;5;000m&[38;5;000m [38;5;m&[38;5;m([38;5;m([38;5;m#[38;5;m([38;5;m([38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m 
[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m%[38;5;m([38;5;m([38;5;m([38;5;m [38;5;005m%[38;5;008m/[38;5;008m/[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;008m*[38;5;015m [38;5;015m [38;5;015m [38;5;007m,[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m([38;5;008m/[38;5;008m/[38;5;008m/[38;5;000m&[38;5;m&[38;5;m#[38;5;m([38;5;m([38;5;m([38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m 
[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m%[38;5;m([38;5;m([38;5;m#[38;5;m [38;5;005m#[38;5;008m/[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m([38;5;015m [38;5;015m [38;5;015m [38;5;015m [38;5;015m [38;5;007m.[38;5;008m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m([38;5;007m,[38;5;007m,[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m([38;5;008m/[38;5;008m/[38;5;004m%[38;5;m [38;5;m([38;5;m#[38;5;m([38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m 
[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m([38;5;m([38;5;m#[38;5;m [38;5;005m#[38;5;008m/[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;007m,[38;5;015m [38;5;015m [38;5;015m [38;5;015m [38;5;015m [38;5;015m [38;5;007m.[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;008m([38;5;015m.[38;5;015m [38;5;015m [38;5;015m [38;5;008m*[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;008m([38;5;008m/[38;5;004m&[38;5;m [38;5;m([38;5;m([38;5;m([38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m 
[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m([38;5;m([38;5;m([38;5;m&[38;5;000m&[38;5;008m/[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;008m/[38;5;015m [38;5;015m [38;5;015m [38;5;015m [38;5;015m [38;5;015m [38;5;015m [38;5;015m.[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m([38;5;005m([38;5;005m([38;5;005m#[38;5;005m#[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m([38;5;007m*[38;5;015m [38;5;015m [38;5;015m [38;5;015m [38;5;015m [38;5;015m [38;5;015m.[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;008m([38;5;008m/[38;5;000m [38;5;m#[38;5;m([38;5;m([38;5;m([38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m 
[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m#[38;5;m([38;5;m([38;5;m#[38;5;m [38;5;005m([38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m([38;5;008m/[38;5;007m,[38;5;015m [38;5;015m [38;5;015m [38;5;015m [38;5;007m,[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m([38;5;007m*[38;5;015m [38;5;015m [38;5;015m [38;5;015m [38;5;015m [38;5;015m [38;5;015m [38;5;007m.[38;5;008m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;008m([38;5;005m%[38;5;m [38;5;m([38;5;m([38;5;m([38;5;m#[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m 
[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m([38;5;m([38;5;m([38;5;m#[38;5;000m [38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;008m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m([38;5;005m#[38;5;m [38;5;m([38;5;m#[38;5;m([38;5;m([38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m 
[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m&[38;5;m([38;5;m([38;5;m([38;5;m([38;5;000m [38;5;005m%[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;008m([38;5;008m/[38;5;008m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m([38;5;008m/[38;5;008m/[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;004m%[38;5;m [38;5;m([38;5;m([38;5;m([38;5;m([38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m 
[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m([38;5;m([38;5;m([38;5;m([38;5;m&[38;5;000m [38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;008m([38;5;008m/[38;5;008m/[38;5;008m/[38;5;005m([38;5;005m#[38;5;008m([38;5;005m([38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m([38;5;005m([38;5;008m([38;5;008m/[38;5;008m/[38;5;005m([38;5;005m#[38;5;008m/[38;5;008m/[38;5;008m/[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;000m [38;5;m%[38;5;m([38;5;m([38;5;m([38;5;m([38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m 
[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m%[38;5;m([38;5;m([38;5;m([38;5;m([38;5;m [38;5;000m [38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;008m([38;5;008m/[38;5;008m/[38;5;005m([38;5;008m([38;5;008m/[38;5;008m([38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m([38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m/[38;5;008m([38;5;008m([38;5;008m/[38;5;008m([38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;000m [38;5;m&[38;5;m([38;5;m#[38;5;m([38;5;m([38;5;m%[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m 
[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m%[38;5;000m [38;5;005m%[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;000m&[38;5;m [38;5;m#[38;5;m([38;5;m#[38;5;m([38;5;m([38;5;m&[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m 
[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m%[38;5;000m [38;5;000m [38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;000m [38;5;m [38;5;m#[38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m 
[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m#[38;5;m&[38;5;000m [38;5;000m [38;5;000m&[38;5;005m#[38;5;005m#[38;5;005m([38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m#[38;5;005m([38;5;005m#[38;5;005m#[38;5;000m [38;5;000m [38;5;000m [38;5;m [38;5;m#[38;5;m([38;5;m([38;5;m([38;5;m#[38;5;m([38;5;m([38;5;m([38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m 
[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m#[38;5;m#[38;5;m#[38;5;m#[38;5;m#[38;5;m#[38;5;m#[38;5;m([38;5;m#[38;5;m([38;5;m#[38;5;m([38;5;m([38;5;m([38;5;m#[38;5;m([38;5;m([38;5;m([38;5;m([38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m 
[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;m#[38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m([38;5;m#[38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m [38;5;000m 
[0m
{{- end -}}