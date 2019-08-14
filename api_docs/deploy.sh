#!/bin/bash

set -e

export BRANCH="master"

if [[ -f .build_auth ]]; then
    source ./.build_auth
fi

curl -X POST \
    -d "{\"branch\":\"${BRANCH}\", \"repo\": \"api-docs\"}" \
    -H 'Content-Type: application/json' \
    -H "Authorization: Basic ${STAGING_BUILD_AUTH}" \
    https://buildserver.procurify-staging.com/build
