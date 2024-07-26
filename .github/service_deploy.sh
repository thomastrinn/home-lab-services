#!/bin/bash

set -o pipefail

export INFISICAL_DISABLE_UPDATE_CHECK=true
INFISICAL_TOKEN=$(infisical login --method=universal-auth --client-id="$CLIENT_ID" --client-secret="$CLIENT_SECRET" --silent --plain)
export INFISICAL_TOKEN

infisical run \
    --project-config-dir=./ \
    --projectId="$PROJECT_ID" \
    --path="$SECRET_PATH" \
    --env=prod \
    --command='docker compose up -d --pull always --force-recreate --remove-orphans'