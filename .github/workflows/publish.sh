#!/bin/sh

BRANCH=$(git rev-parse --abbrev-ref HEAD)

echo """
PACT_BROKER_BASE_URL: $PACT_BROKER_BASE_URL
PACT_BROKER_TOKEN: $PACT_BROKER_TOKEN
APPLICATION_NAME: $APPLICATION_NAME
BRANCH: $BRANCH
VERSION: $VERSION
OAS_FILE: $OAS_FILE
RESULTS_FILE: $RESULTS_FILE
"""

docker run \
  --platform linux/amd64 \
  --rm \
  -w ${PWD} \
  -v ${PWD}:${PWD} \
  -e PACT_BROKER_BASE_URL=$PACT_BROKER_BASE_URL \
  -e PACT_BROKER_TOKEN=$PACT_BROKER_TOKEN \
  pactfoundation/pact-cli:latest \
  pactflow publish-provider-contract \
  $OAS_FILE \
  --provider $APPLICATION_NAME \
  --provider-app-version $VERSION \
  --branch $BRANCH \
  --content-type application/yaml \
  --verification-exit-code=0 \
  --verification-results $RESULTS_FILE \
  --verification-results-content-type application/yaml \
  --verifier "github-actions"