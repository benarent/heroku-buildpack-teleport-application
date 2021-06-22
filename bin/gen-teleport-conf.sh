#!/usr/bin/env bash

TELEPORT_URL=asteroid-moon.teleport.sh:443
TELEPORT_API=1be2b449659dc89419875b36a53e5757
TELEPORT_HEROKU_URL=https://aap-jwt.herokuapp.com

cat >> /app/vendor/teleport/teleport.yaml << EOF
      teleport:
        nodename: 581f063b-4921-4315-a121-21c8afceb9c8
        data_dir: /app/vendor/teleport/
        log:
            output: stderr
            severity: INFO
        ca_pin: ""
      auth_service:
        enabled: "yes"
        listen_addr: 0.0.0.0:3025
        cluster_name: aap-jwt.herokuapp.com
      ssh_service:
        enabled: "yes"
      proxy_service:
        enabled: "yes"
        listen_addr: 0.0.0.0:3023
        web_listen_addr: :3080
        public_addr: aap-jwt.herokuapp.com:3080
        https_keypairs: []
        acme:
          enabled: "yes"
          email: ben@goteleport.com
EOF

chmod go-rwx /app/vendor/teleport/*