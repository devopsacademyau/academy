# Creating S3 buckets in AWS using full 3 Muskeeters approach (c05-3m02)

In this exercise you are going to apply 3 Musketeers for running AWS commands. You will need to follow the [4 patterns](../../3musketeers/README.md#Patterns_In_3M) presented in class.

Consider that the developer does not have AWS installed in his machine.

1. Create `docker-compose.yaml` with a service that builds based on a Dockerfile:
   1. Use the `Dockerfile` provided [here](resources/Dockerfile), it contains `make` and `aws` installed.
2. Create a `Makefile` with the following Make targets:
   1. `create_bucket`: it will create a S3 bucket
   2. `delete_bucket`: it will list objects for a bucket
   3. This `Makefile` will have a variable for the bucket name `export BUCKET_NAME ?= test`
3. Create the scripts for the AWS commands:
   1. `scripts/create_bucket.sh` - will create a bucket with name in the variable BUCKET_NAME - `aws s3 mb s3://${BUCKET_NAME}`
   1. `scripts/delete_bucket.sh` - will list objects in the bucket - `aws s3 rb s3://${BUCKET_NAME}`
4. Create a `.env` file and pass the attribute `env_file` in your docker-compose.yaml service. This .env file will have:
   - AWS_ACCESS_KEY_ID
   - AWS_SECRET_ACCESS_KEY
   - AWS_REGION=ap-southeast-2
   - BUCKET_NAME
5. Also, remember that the Docker container will try to run a make target so the local code needs to be visible inside the container (map a volume for it in your docker-compose.yaml)
5. Configure AWS credentials for the CLI using environment variables
6. Call the Make target `make create_bucket` passing the BUCKET_NAME variable
7. Call the Make target `make delete_bucket` passing the BUCKET_NAME

You should be able to create and delete buckets using the full 3 Musketeers approach.

## References:
- [This documentation might help](https://3musketeers.io/docs/environment-variables.html#aws-environment-variables-and-aws)

## Submit a PR with the following files:

- **README.md**: based on the [ANSWER.md file](ANSWER.md) with a link to the following files from your answer:
  - Dockerfile (copied from [here](resources/Dockerfile))
      - with the instructions to build your docker image
  - scripts/create_bucket.sh
  - scripts/delete_bucket.sh
  - .env
  - Makefile
      - with the three targets mentioned above, updated with the 4 patterns from 3 Musketeers seen in class. 
  - output.md
      - with the execution and outputs of the following command: `make create_bucket`, `make delete_bucket`
