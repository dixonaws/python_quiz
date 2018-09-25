#!/usr/bin/env bash

# update the lambda function code
aws lambda update-function-configuration --cli-input-json fileb://lambda-update-function-configuration.json
