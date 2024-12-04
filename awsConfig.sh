#!/bin/bash

# Configure AWS CLI
aws configure set aws_access_key_id YOUR_ACCESS_KEY
aws configure set aws_secret_access_key YOUR_SECRET_KEY
aws configure set default.region eu-west-1
aws configure set default.output json

# Test configuration
echo "Testing AWS CLI configuration..."

# Test credentials and print identity
if aws sts get-caller-identity > /dev/null 2>&1; then
    echo "✅ AWS credentials verified successfully"
    echo "Account details:"
    aws sts get-caller-identity
else
    echo "❌ AWS credentials verification failed"
    exit 1
fi

# Verify region configuration
CONFIGURED_REGION=$(aws configure get region)
if [ "$CONFIGURED_REGION" = "eu-west-1" ]; then
    echo "✅ Region correctly set to eu-west-1"
else
    echo "❌ Region configuration failed"
fi

# Verify output format
CONFIGURED_OUTPUT=$(aws configure get output)
if [ "$CONFIGURED_OUTPUT" = "json" ]; then
    echo "✅ Output format correctly set to json"
else
    echo "❌ Output format configuration failed"
fi
