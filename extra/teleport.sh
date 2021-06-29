#!/usr/bin/env bash

# add vendor binaries to the path
export PATH=$PATH:$HOME/vendor/bin

# set a default LANG if it does not exist in the environment
export LANG=${LANG:-en_US.UTF-8}


# Setup Locations
main() {
  echo "-----> RUN TELEPORT.SH" 
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