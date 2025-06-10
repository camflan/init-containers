# Metabase config file
# https://www.metabase.com/docs/latest/configuring-metabase/config-file
version: 1

config:
  settings:
    config-from-file-sync-databases: false

  databases:
	# Each DB to be configured starts with DB_ as a base64 JSON string with
	# dbname, host, port, username, password keys
    {{- range $db_name, $config := environment "DB_"}}
	- name: {{- $db_name | trimPrefix "DB_" | lower -}}
	  {{with $decoded := ($config | mustFromJson)}}
	  {{range $key, $value := $decoded}}
      {{- $key }}: {{ $value }}
	  {{end}}
	  {{end}}
    {{end}}
