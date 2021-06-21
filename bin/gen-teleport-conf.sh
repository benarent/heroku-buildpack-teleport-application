#!/usr/bin/env bash

TELEPORT_URL=asteroid-moon.teleport.sh:443
TELEPORT_API=1be2b449659dc89419875b36a53e5757
TELEPORT_HEROKU_URL=https://aap-jwt.herokuapp.com

cat >> /app/vendor/teleport/teleport.yaml << EOFEOF
teleport:
  data_dir: /app/vendor/teleport/
  auth_token: ${TELEPORT_API}
  auth_servers:
  - ${TELEPORT_URL}
  log:
    output: stderr
    severity: DEBUG
auth_service:
  enabled: no
ssh_service:
  enabled: no
  labels:
    cloud: heroku
proxy_service:
  enabled: no
app_service:
  enabled: yes
  debug_app: true
  apps:
  - name: "herokutest3"
    uri: "${TELEPORT_HEROKU_URL}"
EOFEOF

chmod go-rwx /app/vendor/teleport/*
