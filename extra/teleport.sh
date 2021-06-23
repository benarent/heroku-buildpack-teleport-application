#!/usr/bin/env bash

# Setup Locations
main() {
  run-teleport "$@"
}

run-teleport() {
  declare psmgr=/tmp/teleport-buildpack-wait
  declare -A pids signals

  config-gen

  bash -c "~/vendor/teleport/teleport/teleport start --config=/app/vendor/teleport/teleport.yaml"

}

config-gen() {
  # Generate config files
  at config-gen-start
  source bin/gen-teleport-conf.sh
  at config-gen-end
}