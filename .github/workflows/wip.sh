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
  --provider my-provider \
  --provider-app-version 1.0.0 \
  --branch my-branch \
  --content-type application/yaml \
  --verification-exit-code=0 \
  --verification-results results/report.md \
  --verification-results-content-type application/yaml \
  --verifier "github-actions"