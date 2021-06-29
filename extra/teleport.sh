#!/usr/bin/env bash

# add vendor binaries to the path
export PATH=$PATH:$HOME/vendor/bin

# set a default LANG if it does not exist in the environment
export LANG=${LANG:-en_US.UTF-8}

echo "-----> Teleport: Generate Teleport.yaml" 
source ~/bin/gen-teleport-conf.sh
echo "-----> Teleport: Start Teleport" 
bash -c "~/vendor/teleport/teleport/teleport start --config=/app/vendor/teleport/teleport.yaml" &
