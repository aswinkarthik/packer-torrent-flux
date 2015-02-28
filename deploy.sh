#!/usr/bin/env bash

set -e 

PACKER_JSON=${1-build.json}

echo "Loading config files..."
source ./config.sh

echo "Validating packer json file $PACKER_JSON"
packer validate $PACKER_JSON

echo "Building packer json file $PACKER_JSON"
packer build $PACKER_JSON
