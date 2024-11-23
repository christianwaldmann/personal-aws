# personal-aws

For deployments on Hetzner, some basic infrastructure is required. This repo creates:

- S3 bucket and DynamoDB table for storing terraform state
- SSM parameters
- IAM user to provide access

Note: This repo's state file is not managed in a remote location.

## Usage

1. Create resources: `./scripts/terraform.sh apply`
2. Copy access key id and secret: `./scripts/terraform.sh output -json`

## TODO

- add more detailed docs
