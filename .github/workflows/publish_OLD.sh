#!/usr/bin/env bash


EXIT_CODE=${EXIT_CODE:-0}
REPORT_FILE_CONTENT_TYPE=${REPORT_FILE_CONTENT_TYPE:-'text/plain'}
VERIFIER_TOOL=${VERIFIER_TOOL:-'github-actions'}
BRANCH=${BRANCH}

echo """
PACT_BROKER_BASE_URL: $PACT_BROKER_BASE_URL
PACT_BROKER_TOKEN : $PACT_BROKER_TOKEN
oas_file: $oas_file
results_file: $results_file
EXIT_CODE: $EXIT_CODE
BRANCH: $BRANCH
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
  oas/openapi.yaml \
  --provider pact-demo-api1 \
  --provider-app-version 1.0.0 \
  --branch add-github-workflow \
  --content-type application/json \
  --verification-exit-code=0 \
  --verification-results result/report.md \
  --verification-results-content-type application/yaml \
  --verifier "github-actions"