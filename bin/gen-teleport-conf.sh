#!/usr/bin/env bash

TELEPORT_URL=asteroid-moon.teleport.sh:443
TELEPORT_API=1be2b449659dc89419875b36a53e5757
TELEPORT_HEROKU_URL=https://aap-jwt.herokuapp.com

cat >> /app/vendor/teleport/teleport.yaml << EOF
      teleport:
        auth_token: a3bfe499e06a7c425560011211d4fa8d
        auth_servers:
            - asteroid-moon.teleport.sh:443
        data_dir: /app/vendor/teleport/
        log:
            output: stderr
            severity: INFO
        ca_pin: ""
      auth_service:
        enabled: "no"
      ssh_service:
        enabled: "yes"
      app_service:
        enabled: "yes"
        apps:
        - name: "demo-app"
          uri: "https://aap-jwt.herokuapp.com
EOF

chmod go-rwx /app/vendor/teleport/*