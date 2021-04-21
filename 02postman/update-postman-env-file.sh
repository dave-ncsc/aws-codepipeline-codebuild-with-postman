#!/usr/bin/env bash

#This shell script updates Postman environment file with the API Gateway URL created
# via the api gateway deployment

echo "Running update-postman-env-file.sh"

api_gateway_url=https://65cc5k2rf6.execute-api.eu-west-2.amazonaws.com/prod

echo "API Gateway URL:" ${api_gateway_url}

jq -e --arg apigwurl "$api_gateway_url" '(.values[] | select(.key=="apigw-root") | .value) = $apigwurl' \
  PetStoreAPIEnvironment.postman_environment.json > PetStoreAPIEnvironment.postman_environment.json.tmp \
  && cp PetStoreAPIEnvironment.postman_environment.json.tmp PetStoreAPIEnvironment.postman_environment.json \
  && rm PetStoreAPIEnvironment.postman_environment.json.tmp

echo "Updated PetStoreAPIEnvironment.postman_environment.json"

cat PetStoreAPIEnvironment.postman_environment.json