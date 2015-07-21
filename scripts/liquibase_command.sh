#!/bin/bash -e

echo "Setting up liquibase..."
./scripts/liquibase_setup.sh

echo "Processing liquibase tasks ..."
case "$1" in
    "update" )
        echo "Applying changelogs ..."
        ./scripts/liquibase_update.sh
        ;;
esac
