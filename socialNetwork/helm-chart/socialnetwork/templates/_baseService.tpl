{{- define "socialnetwork.templates.baseService" }}

apiVersion: v1
kind: Service
metadata:
  name: {{ .Values.name }}
spec:
  type: {{ .Values.type | default .Values.global.serviceType }}
  ports:  
  {{- range .Values.ports }}
  - name: "{{ .port }}"
    port: {{ .port }}
    {{- if .protocol}}
    protocol: {{ .protocol }}
    {{- end}}
    targetPort: {{ .targetPort }}
    {{- if .nodePort }}
    nodePort: {{ .nodePort }}
    {{- end }}
  {{- end}}
  selector:
    service: {{ .Values.name }} 

{{- end }}
