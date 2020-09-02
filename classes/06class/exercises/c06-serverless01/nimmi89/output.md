$ make ssm-put

```
scripts/ssm-put.sh { "Version": 1, "Tier": "Standard" }
```

$ make deploy

```
terraform init

    Initializing the backend...

    Initializing provider plugins...

    Terraform has been successfully initialized!

    You may now begin working with Terraform. Try running "terraform plan" to see any changes that are required for your infrastructure. All Terraform commands should now work.

    If you ever set or change modules or backend configuration for Terraform, rerun this command to reinitialize your working directory. If you forget, other commands will detect it and remind you to do so if necessary. terraform plan -var-file=c06-serverless.tfvars -out=c06-serverless.tfplan Refreshing Terraform state in-memory prior to plan... The refreshed state will be used to calculate this plan, but will not be persisted to local or remote state storage.

    data.aws_ssm_parameter.tf_db_name: Refreshing state...

    --------------------------------------------------------------------------------

    An execution plan has been generated and is shown below. Resource actions are indicated with the following symbols:

    - create

    Terraform will perform the following actions:

    # aws_api_gateway_api_key.tf-api-key will be created

    - resource "aws_api_gateway_api_key" "tf-api-key" {

    - arn = (known after apply)
    - created_date = (known after apply)
    - description = "Managed by Terraform"
    - enabled = true
    - id = (known after apply)
    - last_updated_date = (known after apply)
    - name = "c06-serverless01-api-key"
    - value = (sensitive value) }

    # aws_api_gateway_deployment.tf-gw-deployment will be created

    - resource "aws_api_gateway_deployment" "tf-gw-deployment" {

    - created_date = (known after apply)
    - execution_arn = (known after apply)
    - id = (known after apply)
    - invoke_url = (known after apply)
    - rest_api_id = (known after apply)
    - stage_name = "v1Serverless" }

    # aws_api_gateway_integration.lambda will be created

    - resource "aws_api_gateway_integration" "lambda" {

    - cache_namespace = (known after apply)
    - connection_type = "INTERNET"
    - content_handling = "CONVERT_TO_TEXT"
    - http_method = "POST"
    - id = (known after apply)
    - integration_http_method = "POST"
    - passthrough_behavior = (known after apply)
    - resource_id = (known after apply)
    - rest_api_id = (known after apply)
    - timeout_milliseconds = 29000
    - type = "AWS_PROXY"
    - uri = (known after apply) }

    # aws_api_gateway_method.users will be created

    - resource "aws_api_gateway_method" "users" {

    - api_key_required = true
    - authorization = "NONE"
    - http_method = "POST"
    - id = (known after apply)
    - resource_id = (known after apply)
    - rest_api_id = (known after apply) }

    # aws_api_gateway_resource.users will be created

    - resource "aws_api_gateway_resource" "users" {

    - id = (known after apply)
    - parent_id = (known after apply)
    - path = (known after apply)
    - path_part = "users"
    - rest_api_id = (known after apply) }

    # aws_api_gateway_rest_api.tf-api-gw will be created

    - resource "aws_api_gateway_rest_api" "tf-api-gw" {

    - api_key_source = "HEADER"
    - arn = (known after apply)
    - binary_media_types = [

        - "_/_", ]

    - created_date = (known after apply)
    - description = "Terraform Serverless Application with DA"
    - execution_arn = (known after apply)
    - id = (known after apply)
    - minimum_compression_size = -1
    - name = "c06-serverless01-api-gw"
    - root_resource_id = (known after apply)
    - tags = {

        - "Name" = "c06-serverless01-api-gw" }

    - endpoint_configuration {

        - types = [

        - "REGIONAL", ] } }

    # aws_api_gateway_usage_plan.tf-gw-usage-plan will be created

    - resource "aws_api_gateway_usage_plan" "tf-gw-usage-plan" {

    - arn = (known after apply)
    - description = "usage plan for version 1.0"
    - id = (known after apply)
    - name = "c06-serverless01-gw-usage-plan"

    - api_stages {

        - api_id = (known after apply)
        - stage = "v1Serverless" } }

    # aws_api_gateway_usage_plan_key.v1 will be created

    - resource "aws_api_gateway_usage_plan_key" "v1" {

    - id = (known after apply)
    - key_id = (known after apply)
    - key_type = "API_KEY"
    - name = (known after apply)
    - usage_plan_id = (known after apply)
    - value = (known after apply) }

    # aws_dynamodb_table.tf-dynamodb-table will be created

    - resource "aws_dynamodb_table" "tf-dynamodb-table" {

    - arn = (known after apply)
    - billing_mode = "PAY_PER_REQUEST"
    - hash_key = "id"
    - id = (known after apply)
    - name = "DA_Serverless"
    - stream_arn = (known after apply)
    - stream_label = (known after apply)
    - stream_view_type = (known after apply)
    - tags = {

        - "Name" = "DA_Serverless" }

    - attribute {

        - name = "id"
        - type = "S" }

    - point_in_time_recovery {

        - enabled = (known after apply) }

    - server_side_encryption {

        - enabled = true
        - kms_key_arn = (known after apply) } }

    # aws_iam_policy.lambda_logging will be created

    - resource "aws_iam_policy" "lambda_logging" {

    - arn = (known after apply)
    - description = "IAM policy for logging from a lambda"
    - id = (known after apply)
    - name = "lambda_logging"
    - path = "/"
    - policy = jsonencode(
```

````
{
    + Statement = [
        + {
            + Action   = [
                + "logs:CreateLogGroup",
                + "logs:CreateLogStream",
                + "logs:PutLogEvents",
                ]
            + Effect   = "Allow"
            + Resource = "arn:aws:logs:*:*:*"
            },
        ]
    + Version   = "2012-10-17"
    }
    ```

    ) }

# aws_iam_role.tf_lambda_role will be created

- resource "aws_iam_role" "tf_lambda_role" {

- arn = (known after apply)
- assume_role_policy = jsonencode(

    ```
    {
    + Statement = [
        + {
            + Action    = "sts:AssumeRole"
            + Effect    = "Allow"
            + Principal = {
                + Service = "lambda.amazonaws.com"
                }
            + Sid       = ""
            },
        ]
    + Version   = "2008-10-17"
    }
    ```

    )
- create_date = (known after apply)
- force_detach_policies = false
- id = (known after apply)
- max_session_duration = 3600
- name = "c06-serverless01-lambda-role"
- path = "/"
- tags = {

    - "Name" = "c06-serverless01_lambda_role" }

- unique_id = (known after apply) }

# aws_iam_role_policy.tf_lambda_policy will be created

- resource "aws_iam_role_policy" "tf_lambda_policy" {

- id = (known after apply)
- name = "c06-serverless01-lambda-policy"
- policy = (known after apply)
- role = (known after apply) }

# aws_iam_role_policy_attachment.lambda_logs will be created

- resource "aws_iam_role_policy_attachment" "lambda_logs" {

- id = (known after apply)
- policy_arn = (known after apply)
- role = (known after apply) }

# aws_kms_grant.tf-kms-grant will be created

- resource "aws_kms_grant" "tf-kms-grant" {

- grant_id = (known after apply)
- grant_token = (known after apply)
- grantee_principal = (known after apply)
- id = (known after apply)
- key_id = (known after apply)
- name = "c06-serverless01-grant"
- operations = [

    - "Decrypt", ]

- retire_on_delete = false }

# aws_kms_key.tf-kms-key will be created

- resource "aws_kms_key" "tf-kms-key" {

- arn = (known after apply)
- customer_master_key_spec = "SYMMETRIC_DEFAULT"
- description = "KMS Keys for Serverless exercise"
- enable_key_rotation = true
- id = (known after apply)
- is_enabled = true
- key_id = (known after apply)
- key_usage = "ENCRYPT_DECRYPT"
- policy = (known after apply)
- tags = {

    - "Name" = "c06-serverless01-kms-key" } }

# aws_lambda_function.tf_lambda_fn will be created

- resource "aws_lambda_function" "tf_lambda_fn" {

- arn = (known after apply)
- function_name = "c06-serverless01-lambda"
- handler = "lambda_handler.lambda_handler"
- id = (known after apply)
- invoke_arn = (known after apply)
- last_modified = (known after apply)
- memory_size = 128
- publish = false
- qualified_arn = (known after apply)
- reserved_concurrent_executions = -1
- role = (known after apply)
- runtime = "python3.8"
- s3_bucket = "c06-serverless01-s3-bucket"
- s3_key = "v1.0/lambda.zip"
- source_code_hash = (known after apply)
- source_code_size = (known after apply)
- tags = {

    - "Name" = "c06-serverless01-lambda" }

- timeout = 3
- version = (known after apply)

- environment {

    - variables = {

    - "DB_NAME" = "DA_Serverless" } }

- tracing_config {

    - mode = (known after apply) } }

# aws_lambda_permission.apigw_lambda will be created

- resource "aws_lambda_permission" "apigw_lambda" {

- action = "lambda:InvokeFunction"
- function_name = "c06-serverless01-lambda"
- id = (known after apply)
- principal = "apigateway.amazonaws.com"
- source_arn = (known after apply)
- statement_id = "AllowExecutionFromAPIGateway" }

# aws_s3_bucket.tf-s3-bucket will be created

- resource "aws_s3_bucket" "tf-s3-bucket" {

- acceleration_status = (known after apply)
- acl = "private"
- arn = (known after apply)
- bucket = "c06-serverless01-s3-bucket"
- bucket_domain_name = (known after apply)
- bucket_regional_domain_name = (known after apply)
- force_destroy = false
- hosted_zone_id = (known after apply)
- id = (known after apply)
- region = (known after apply)
- request_payer = (known after apply)
- tags = {

    - "Name" = "c06-serverless01-s3-bucket" }

- website_domain = (known after apply)
- website_endpoint = (known after apply)

- versioning {

    - enabled = (known after apply)
    - mfa_delete = (known after apply) } }

# aws_s3_bucket_object.tf-bucket_object will be created

- resource "aws_s3_bucket_object" "tf-bucket_object" {

- acl = "private"
- bucket = (known after apply)
- content_type = (known after apply)
- etag = (known after apply)
- force_destroy = false
- id = (known after apply)
- key = "v1.0/lambda.zip"
- server_side_encryption = "AES256"
- source = "~/DA_class6/academy/classes/06class/exercises/c06-serverless01/src/lambda.zip"
- storage_class = (known after apply)
- version_id = (known after apply) }

# aws_ssm_parameter.api_key will be created

- resource "aws_ssm_parameter" "api_key" {

- arn = (known after apply)
- id = (known after apply)
- key_id = (known after apply)
- name = "API_KEY"
- tier = "Standard"
- type = "SecureString"
- value = (sensitive value)
- version = (known after apply) }

Plan: 20 to add, 0 to change, 0 to destroy.

--------------------------------------------------------------------------------

This plan was saved to: c06-serverless.tfplan

To perform exactly these actions, run the following command to apply: terraform apply "c06-serverless.tfplan"


terraform apply c06-serverless.tfplan
aws_api_gateway_api_key.tf-api-key: Creating...
aws_api_gateway_rest_api.tf-api-gw: Creating...
aws_iam_policy.lambda_logging: Creating...
aws_kms_key.tf-kms-key: Creating...
aws_iam_role.tf_lambda_role: Creating...
aws_s3_bucket.tf-s3-bucket: Creating...
aws_api_gateway_api_key.tf-api-key: Creation complete after 1s [id=v5dasyjcl0]
aws_ssm_parameter.api_key: Creating...
aws_api_gateway_rest_api.tf-api-gw: Creation complete after 2s [id=400gk3ery0]
aws_api_gateway_resource.users: Creating...
aws_api_gateway_resource.users: Creation complete after 0s [id=8kfc1a]
aws_api_gateway_method.users: Creating...
aws_ssm_parameter.api_key: Creation complete after 0s [id=API_KEY]
aws_api_gateway_method.users: Creation complete after 0s [id=agm-400gk3ery0-8kfc1a-POST]
aws_iam_role.tf_lambda_role: Creation complete after 3s [id=c06-serverless01-lambda-role]
aws_iam_policy.lambda_logging: Creation complete after 4s [id=arn:aws:iam::438549961569:policy/lambda_logging]
aws_iam_role_policy_attachment.lambda_logs: Creating...
aws_s3_bucket.tf-s3-bucket: Creation complete after 5s [id=c06-serverless01-s3-bucket]
aws_s3_bucket_object.tf-bucket_object: Creating...
aws_s3_bucket_object.tf-bucket_object: Creation complete after 1s [id=v1.0/lambda.zip]
aws_iam_role_policy_attachment.lambda_logs: Creation complete after 2s [id=c06-serverless01-lambda-role-20200902045558223600000001]
aws_lambda_function.tf_lambda_fn: Creating...
aws_kms_key.tf-kms-key: Creation complete after 7s [id=6f74f981-8ddb-400e-bce0-823cf9197d4d]
aws_kms_grant.tf-kms-grant: Creating...
aws_dynamodb_table.tf-dynamodb-table: Creating...
aws_dynamodb_table.tf-dynamodb-table: Creation complete after 7s [id=DA_Serverless]
aws_iam_role_policy.tf_lambda_policy: Creating...
aws_kms_grant.tf-kms-grant: Creation complete after 8s [id=6f74f981-8ddb-400e-bce0-823cf9197d4d:0aedeefd3721289aa29b6b6c3ffa28cadc2bf0a056f1f31ab36865502334ffbf]
aws_lambda_function.tf_lambda_fn: Still creating... [10s elapsed]
aws_iam_role_policy.tf_lambda_policy: Creation complete after 2s [id=c06-serverless01-lambda-role:c06-serverless01-lambda-policy]
aws_lambda_function.tf_lambda_fn: Creation complete after 15s [id=c06-serverless01-lambda]
aws_lambda_permission.apigw_lambda: Creating...
aws_api_gateway_integration.lambda: Creating...
aws_lambda_permission.apigw_lambda: Creation complete after 0s [id=AllowExecutionFromAPIGateway]
aws_api_gateway_integration.lambda: Creation complete after 0s [id=agi-400gk3ery0-8kfc1a-POST]
aws_api_gateway_deployment.tf-gw-deployment: Creating...
aws_api_gateway_deployment.tf-gw-deployment: Creation complete after 1s [id=hrx6q7]
aws_api_gateway_usage_plan.tf-gw-usage-plan: Creating...
aws_api_gateway_usage_plan.tf-gw-usage-plan: Creation complete after 2s [id=9bxo2m]
aws_api_gateway_usage_plan_key.v1: Creating...
aws_api_gateway_usage_plan_key.v1: Creation complete after 1s [id=v5dasyjcl0]

Apply complete! Resources: 20 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path: ./terraform.tfstate

Outputs:

api_endpoint = https://400gk3ery0.execute-api.ap-southeast-2.amazonaws.com/v1Serverless
````

$ make ssm-get

```
echo "Getting your API KEY"
Getting your API KEY
scripts/ssm-get.sh
[
    "7ldK0vA1nK8G2nXPEgyhS8aDPgpGpQ8j9LAPJH5w"
]
```

$ make clean

```
terraform destroy
data.aws_ssm_parameter.tf_db_name: Refreshing state...
aws_iam_policy.lambda_logging: Refreshing state... [id=arn:aws:iam::438549961569:policy/lambda_logging]
aws_kms_key.tf-kms-key: Refreshing state... [id=6f74f981-8ddb-400e-bce0-823cf9197d4d]
aws_iam_role.tf_lambda_role: Refreshing state... [id=c06-serverless01-lambda-role]
aws_api_gateway_api_key.tf-api-key: Refreshing state... [id=v5dasyjcl0]
aws_s3_bucket.tf-s3-bucket: Refreshing state... [id=c06-serverless01-s3-bucket]
aws_api_gateway_rest_api.tf-api-gw: Refreshing state... [id=400gk3ery0]
aws_ssm_parameter.api_key: Refreshing state... [id=API_KEY]
aws_api_gateway_resource.users: Refreshing state... [id=8kfc1a]
aws_api_gateway_method.users: Refreshing state... [id=agm-400gk3ery0-8kfc1a-POST]
aws_dynamodb_table.tf-dynamodb-table: Refreshing state... [id=DA_Serverless]
aws_kms_grant.tf-kms-grant: Refreshing state... [id=6f74f981-8ddb-400e-bce0-823cf9197d4d:0aedeefd3721289aa29b6b6c3ffa28cadc2bf0a056f1f31ab36865502334ffbf]
aws_iam_role_policy.tf_lambda_policy: Refreshing state... [id=c06-serverless01-lambda-role:c06-serverless01-lambda-policy]
aws_iam_role_policy_attachment.lambda_logs: Refreshing state... [id=c06-serverless01-lambda-role-20200902045558223600000001]
aws_s3_bucket_object.tf-bucket_object: Refreshing state... [id=v1.0/lambda.zip]
aws_lambda_function.tf_lambda_fn: Refreshing state... [id=c06-serverless01-lambda]
aws_lambda_permission.apigw_lambda: Refreshing state... [id=AllowExecutionFromAPIGateway]
aws_api_gateway_integration.lambda: Refreshing state... [id=agi-400gk3ery0-8kfc1a-POST]
aws_api_gateway_deployment.tf-gw-deployment: Refreshing state... [id=hrx6q7]
aws_api_gateway_usage_plan.tf-gw-usage-plan: Refreshing state... [id=9bxo2m]
aws_api_gateway_usage_plan_key.v1: Refreshing state... [id=v5dasyjcl0]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_api_gateway_api_key.tf-api-key will be destroyed
  - resource "aws_api_gateway_api_key" "tf-api-key" {
      - arn               = "arn:aws:apigateway:ap-southeast-2::/apikeys/v5dasyjcl0" -> null
      - created_date      = "2020-09-02T04:55:53Z" -> null
      - description       = "Managed by Terraform" -> null
      - enabled           = true -> null
      - id                = "v5dasyjcl0" -> null
      - last_updated_date = "2020-09-02T04:55:53Z" -> null
      - name              = "c06-serverless01-api-key" -> null
      - tags              = {} -> null
      - value             = (sensitive value)
    }

  # aws_api_gateway_deployment.tf-gw-deployment will be destroyed
  - resource "aws_api_gateway_deployment" "tf-gw-deployment" {
      - created_date  = "2020-09-02T04:56:14Z" -> null
      - execution_arn = "arn:aws:execute-api:ap-southeast-2:438549961569:400gk3ery0/v1Serverless" -> null
      - id            = "hrx6q7" -> null
      - invoke_url    = "https://400gk3ery0.execute-api.ap-southeast-2.amazonaws.com/v1Serverless" -> null
      - rest_api_id   = "400gk3ery0" -> null
      - stage_name    = "v1Serverless" -> null
    }

  # aws_api_gateway_integration.lambda will be destroyed
  - resource "aws_api_gateway_integration" "lambda" {
      - cache_key_parameters    = [] -> null
      - cache_namespace         = "8kfc1a" -> null
      - connection_type         = "INTERNET" -> null
      - content_handling        = "CONVERT_TO_TEXT" -> null
      - http_method             = "POST" -> null
      - id                      = "agi-400gk3ery0-8kfc1a-POST" -> null
      - integration_http_method = "POST" -> null
      - passthrough_behavior    = "WHEN_NO_MATCH" -> null
      - request_parameters      = {} -> null
      - request_templates       = {} -> null
      - resource_id             = "8kfc1a" -> null
      - rest_api_id             = "400gk3ery0" -> null
      - timeout_milliseconds    = 29000 -> null
      - type                    = "AWS_PROXY" -> null
      - uri                     = "arn:aws:apigateway:ap-southeast-2:lambda:path/2015-03-31/functions/arn:aws:lambda:ap-southeast-2:438549961569:function:c06-serverless01-lambda/invocations" -> null
    }

  # aws_api_gateway_method.users will be destroyed
  - resource "aws_api_gateway_method" "users" {
      - api_key_required     = true -> null
      - authorization        = "NONE" -> null
      - authorization_scopes = [] -> null
      - http_method          = "POST" -> null
      - id                   = "agm-400gk3ery0-8kfc1a-POST" -> null
      - request_models       = {} -> null
      - request_parameters   = {} -> null
      - resource_id          = "8kfc1a" -> null
      - rest_api_id          = "400gk3ery0" -> null
    }

  # aws_api_gateway_resource.users will be destroyed
  - resource "aws_api_gateway_resource" "users" {
      - id          = "8kfc1a" -> null
      - parent_id   = "dfff54qf15" -> null
      - path        = "/users" -> null
      - path_part   = "users" -> null
      - rest_api_id = "400gk3ery0" -> null
    }

  # aws_api_gateway_rest_api.tf-api-gw will be destroyed
  - resource "aws_api_gateway_rest_api" "tf-api-gw" {
      - api_key_source           = "HEADER" -> null
      - arn                      = "arn:aws:apigateway:ap-southeast-2::/restapis/400gk3ery0" -> null
      - binary_media_types       = [
          - "*/*",
        ] -> null
      - created_date             = "2020-09-02T04:55:53Z" -> null
      - description              = "Terraform Serverless Application with DA" -> null
      - execution_arn            = "arn:aws:execute-api:ap-southeast-2:438549961569:400gk3ery0" -> null
      - id                       = "400gk3ery0" -> null
      - minimum_compression_size = -1 -> null
      - name                     = "c06-serverless01-api-gw" -> null
      - root_resource_id         = "dfff54qf15" -> null
      - tags                     = {
          - "Name" = "c06-serverless01-api-gw"
        } -> null

      - endpoint_configuration {
          - types            = [
              - "REGIONAL",
            ] -> null
          - vpc_endpoint_ids = [] -> null
        }
    }

  # aws_api_gateway_usage_plan.tf-gw-usage-plan will be destroyed
  - resource "aws_api_gateway_usage_plan" "tf-gw-usage-plan" {
      - arn         = "arn:aws:apigateway:ap-southeast-2::/usageplans/9bxo2m" -> null
      - description = "usage plan for version 1.0" -> null
      - id          = "9bxo2m" -> null
      - name        = "c06-serverless01-gw-usage-plan" -> null
      - tags        = {} -> null

      - api_stages {
          - api_id = "400gk3ery0" -> null
          - stage  = "v1Serverless" -> null
        }
    }

  # aws_api_gateway_usage_plan_key.v1 will be destroyed
  - resource "aws_api_gateway_usage_plan_key" "v1" {
      - id            = "v5dasyjcl0" -> null
      - key_id        = "v5dasyjcl0" -> null
      - key_type      = "API_KEY" -> null
      - name          = "c06-serverless01-api-key" -> null
      - usage_plan_id = "9bxo2m" -> null
    }

  # aws_dynamodb_table.tf-dynamodb-table will be destroyed
  - resource "aws_dynamodb_table" "tf-dynamodb-table" {
      - arn            = "arn:aws:dynamodb:ap-southeast-2:438549961569:table/DA_Serverless" -> null
      - billing_mode   = "PAY_PER_REQUEST" -> null
      - hash_key       = "id" -> null
      - id             = "DA_Serverless" -> null
      - name           = "DA_Serverless" -> null
      - read_capacity  = 0 -> null
      - stream_enabled = false -> null
      - tags           = {
          - "Name" = "DA_Serverless"
        } -> null
      - write_capacity = 0 -> null

      - attribute {
          - name = "id" -> null
          - type = "S" -> null
        }

      - point_in_time_recovery {
          - enabled = false -> null
        }

      - server_side_encryption {
          - enabled     = true -> null
          - kms_key_arn = "arn:aws:kms:ap-southeast-2:438549961569:key/6f74f981-8ddb-400e-bce0-823cf9197d4d" -> null
        }

      - ttl {
          - enabled = false -> null
        }
    }

  # aws_iam_policy.lambda_logging will be destroyed
  - resource "aws_iam_policy" "lambda_logging" {
      - arn         = "arn:aws:iam::438549961569:policy/lambda_logging" -> null
      - description = "IAM policy for logging from a lambda" -> null
      - id          = "arn:aws:iam::438549961569:policy/lambda_logging" -> null
      - name        = "lambda_logging" -> null
      - path        = "/" -> null
      - policy      = jsonencode(
            {
              - Statement = [
                  - {
                      - Action   = [
                          - "logs:CreateLogGroup",
                          - "logs:CreateLogStream",
                          - "logs:PutLogEvents",
                        ]
                      - Effect   = "Allow"
                      - Resource = "arn:aws:logs:*:*:*"
                    },
                ]
              - Version   = "2012-10-17"
            }
        ) -> null
    }

  # aws_iam_role.tf_lambda_role will be destroyed
  - resource "aws_iam_role" "tf_lambda_role" {
      - arn                   = "arn:aws:iam::438549961569:role/c06-serverless01-lambda-role" -> null
      - assume_role_policy    = jsonencode(
            {
              - Statement = [
                  - {
                      - Action    = "sts:AssumeRole"
                      - Effect    = "Allow"
                      - Principal = {
                          - Service = "lambda.amazonaws.com"
                        }
                      - Sid       = ""
                    },
                ]
              - Version   = "2008-10-17"
            }
        ) -> null
      - create_date           = "2020-09-02T04:55:54Z" -> null
      - force_detach_policies = false -> null
      - id                    = "c06-serverless01-lambda-role" -> null
      - max_session_duration  = 3600 -> null
      - name                  = "c06-serverless01-lambda-role" -> null
      - path                  = "/" -> null
      - tags                  = {
          - "Name" = "c06-serverless01_lambda_role"
        } -> null
      - unique_id             = "AROAWMG45LNQVVRKAJUWB" -> null
    }

  # aws_iam_role_policy.tf_lambda_policy will be destroyed
  - resource "aws_iam_role_policy" "tf_lambda_policy" {
      - id     = "c06-serverless01-lambda-role:c06-serverless01-lambda-policy" -> null
      - name   = "c06-serverless01-lambda-policy" -> null
      - policy = jsonencode(
            {
              - Statement = [
                  - {
                      - Action   = [
                          - "dynamodb:BatchWriteItem",
                          - "dynamodb:PutItem",
                          - "dynamodb:UpdateItem",
                        ]
                      - Effect   = "Allow"
                      - Resource = "arn:aws:dynamodb:ap-southeast-2:438549961569:table/DA_Serverless"
                    },
                ]
              - Version   = "2012-10-17"
            }
        ) -> null
      - role   = "c06-serverless01-lambda-role" -> null
    }

  # aws_iam_role_policy_attachment.lambda_logs will be destroyed
  - resource "aws_iam_role_policy_attachment" "lambda_logs" {
      - id         = "c06-serverless01-lambda-role-20200902045558223600000001" -> null
      - policy_arn = "arn:aws:iam::438549961569:policy/lambda_logging" -> null
      - role       = "c06-serverless01-lambda-role" -> null
    }

  # aws_kms_grant.tf-kms-grant will be destroyed
  - resource "aws_kms_grant" "tf-kms-grant" {
      - grant_id          = "0aedeefd3721289aa29b6b6c3ffa28cadc2bf0a056f1f31ab36865502334ffbf" -> null
      - grant_token       = "AQpANDcxMTk2YWRjOTU3NTgxYzgwZmM2NDRmMDEzYzkyYjI3YmVlZTg4MDI1MTg0ZDBlYjQ1OTZiZmY3NmJmZGZiZiKlAgEBAgB4RxGWrclXWByA_GRPATySsnvu6IAlGE0OtFlr_3a_378AAAD8MIH5BgkqhkiG9w0BBwaggeswgegCAQAwgeIGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQM8Yn4rO0TVO0gEl_lAgEQgIG0eDxwCErVJNIQ-WQlIYi45M-DVYRXvvkktVXfjdrUQ5vQT3ZYCubqrYJysDeKY6yS1MfbbgVrSdOd7mVcX4qhdZAv2itsbgxZcILhpBHX7sv78Wop88LO5b9kFUiNjDKVJLewJOGdflooRZLkhOifsE15g3T8dG_0-sfxarQ8MS9h74nmVd2cTDnF-GlV5gCzbACQ5CTAZ1KZoitg2hY6buzfQo4o4J_cx5XyqK9wZK-7xue1KiAK7e79NyEomqKba2w_-ijK3CvwoFbx8xqzaGVQIzT_vw" -> null
      - grantee_principal = "arn:aws:iam::438549961569:role/c06-serverless01-lambda-role" -> null
      - id                = "6f74f981-8ddb-400e-bce0-823cf9197d4d:0aedeefd3721289aa29b6b6c3ffa28cadc2bf0a056f1f31ab36865502334ffbf" -> null
      - key_id            = "6f74f981-8ddb-400e-bce0-823cf9197d4d" -> null
      - name              = "c06-serverless01-grant" -> null
      - operations        = [
          - "Decrypt",
        ] -> null
      - retire_on_delete  = false -> null
    }

  # aws_kms_key.tf-kms-key will be destroyed
  - resource "aws_kms_key" "tf-kms-key" {
      - arn                      = "arn:aws:kms:ap-southeast-2:438549961569:key/6f74f981-8ddb-400e-bce0-823cf9197d4d" ->
 null
      - customer_master_key_spec = "SYMMETRIC_DEFAULT" -> null
      - description              = "KMS Keys for Serverless exercise" -> null
      - enable_key_rotation      = true -> null
      - id                       = "6f74f981-8ddb-400e-bce0-823cf9197d4d" -> null
      - is_enabled               = true -> null
      - key_id                   = "6f74f981-8ddb-400e-bce0-823cf9197d4d" -> null
      - key_usage                = "ENCRYPT_DECRYPT" -> null
      - policy                   = jsonencode(
            {
              - Id        = "key-default-1"
              - Statement = [
                  - {
                      - Action    = "kms:*"
                      - Effect    = "Allow"
                      - Principal = {
                          - AWS = "arn:aws:iam::438549961569:root"
                        }
                      - Resource  = "*"
                      - Sid       = "Enable IAM User Permissions"
                    },
                ]
              - Version   = "2012-10-17"
            }
        ) -> null
      - tags                     = {
          - "Name" = "c06-serverless01-kms-key"
        } -> null
    }

  # aws_lambda_function.tf_lambda_fn will be destroyed
  - resource "aws_lambda_function" "tf_lambda_fn" {
      - arn                            = "arn:aws:lambda:ap-southeast-2:438549961569:function:c06-serverless01-lambda" -> null
      - function_name                  = "c06-serverless01-lambda" -> null
      - handler                        = "lambda_handler.lambda_handler" -> null
      - id                             = "c06-serverless01-lambda" -> null
      - invoke_arn                     = "arn:aws:apigateway:ap-southeast-2:lambda:path/2015-03-31/functions/arn:aws:lambda:ap-southeast-2:438549961569:function:c06-serverless01-lambda/invocations" -> null
      - last_modified                  = "2020-09-02T04:56:14.094+0000" -> null
      - layers                         = [] -> null
      - memory_size                    = 128 -> null
      - publish                        = false -> null
      - qualified_arn                  = "arn:aws:lambda:ap-southeast-2:438549961569:function:c06-serverless01-lambda:$LATEST" -> null
      - reserved_concurrent_executions = -1 -> null
      - role                           = "arn:aws:iam::438549961569:role/c06-serverless01-lambda-role" -> null
      - runtime                        = "python3.8" -> null
      - s3_bucket                      = "c06-serverless01-s3-bucket" -> null
      - s3_key                         = "v1.0/lambda.zip" -> null
      - source_code_hash               = "WX7zDuwqjschN/uvlH2t5gTrLFZ4UXjiPuP6lX4EeUg=" -> null
      - source_code_size               = 870 -> null
      - tags                           = {
          - "Name" = "c06-serverless01-lambda"
        } -> null
      - timeout                        = 3 -> null
      - version                        = "$LATEST" -> null

      - environment {
          - variables = {
              - "DB_NAME" = "DA_Serverless"
            } -> null
        }

      - tracing_config {
          - mode = "PassThrough" -> null
        }
    }

  # aws_lambda_permission.apigw_lambda will be destroyed
  - resource "aws_lambda_permission" "apigw_lambda" {
      - action        = "lambda:InvokeFunction" -> null
      - function_name = "c06-serverless01-lambda" -> null
      - id            = "AllowExecutionFromAPIGateway" -> null
      - principal     = "apigateway.amazonaws.com" -> null
      - source_arn    = "arn:aws:execute-api:ap-southeast-2:438549961569:400gk3ery0/*/*" -> null
      - statement_id  = "AllowExecutionFromAPIGateway" -> null
    }

  # aws_s3_bucket.tf-s3-bucket will be destroyed
  - resource "aws_s3_bucket" "tf-s3-bucket" {
      - acl                         = "private" -> null
      - arn                         = "arn:aws:s3:::c06-serverless01-s3-bucket" -> null
      - bucket                      = "c06-serverless01-s3-bucket" -> null
      - bucket_domain_name          = "c06-serverless01-s3-bucket.s3.amazonaws.com" -> null
      - bucket_regional_domain_name = "c06-serverless01-s3-bucket.s3.ap-southeast-2.amazonaws.com" -> null
      - force_destroy               = false -> null
      - hosted_zone_id              = "Z1WCIGYICN2BYD" -> null
      - id                          = "c06-serverless01-s3-bucket" -> null
      - region                      = "ap-southeast-2" -> null
      - request_payer               = "BucketOwner" -> null
      - tags                        = {
          - "Name" = "c06-serverless01-s3-bucket"
        } -> null

      - versioning {
          - enabled    = false -> null
          - mfa_delete = false -> null
        }
    }

  # aws_s3_bucket_object.tf-bucket_object will be destroyed
  - resource "aws_s3_bucket_object" "tf-bucket_object" {
      - acl                    = "private" -> null
      - bucket                 = "c06-serverless01-s3-bucket" -> null
      - content_type           = "binary/octet-stream" -> null
      - etag                   = "f4b7d271d5f1923043dd50b123b5a40b" -> null
      - force_destroy          = false -> null
      - id                     = "v1.0/lambda.zip" -> null
      - key                    = "v1.0/lambda.zip" -> null
      - metadata               = {} -> null
      - server_side_encryption = "AES256" -> null
      - source                 = "~/DA_class6/academy/classes/06class/exercises/c06-serverless01/src/lambda.zip" -> null
      - storage_class          = "STANDARD" -> null
      - tags                   = {} -> null
    }

  # aws_ssm_parameter.api_key will be destroyed
  - resource "aws_ssm_parameter" "api_key" {
      - arn     = "arn:aws:ssm:ap-southeast-2:438549961569:parameter/API_KEY" -> null
      - id      = "API_KEY" -> null
      - key_id  = "alias/aws/ssm" -> null
      - name    = "API_KEY" -> null
      - tags    = {} -> null
      - tier    = "Standard" -> null
      - type    = "SecureString" -> null
      - value   = (sensitive value)
      - version = 1 -> null
    }

Plan: 0 to add, 0 to change, 20 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_ssm_parameter.api_key: Destroying... [id=API_KEY]
aws_api_gateway_usage_plan_key.v1: Destroying... [id=v5dasyjcl0]
aws_kms_grant.tf-kms-grant: Destroying... [id=6f74f981-8ddb-400e-bce0-823cf9197d4d:0aedeefd3721289aa29b6b6c3ffa28cadc2bf0a056f1f31ab36865502334ffbf]
aws_lambda_permission.apigw_lambda: Destroying... [id=AllowExecutionFromAPIGateway]
aws_iam_role_policy.tf_lambda_policy: Destroying... [id=c06-serverless01-lambda-role:c06-serverless01-lambda-policy]
aws_s3_bucket_object.tf-bucket_object: Destroying... [id=v1.0/lambda.zip]
aws_s3_bucket_object.tf-bucket_object: Destruction complete after 0s
aws_ssm_parameter.api_key: Destruction complete after 0s
aws_kms_grant.tf-kms-grant: Destruction complete after 0s
aws_lambda_permission.apigw_lambda: Destruction complete after 0s
aws_api_gateway_usage_plan_key.v1: Destruction complete after 1s
aws_api_gateway_api_key.tf-api-key: Destroying... [id=v5dasyjcl0]
aws_api_gateway_usage_plan.tf-gw-usage-plan: Destroying... [id=9bxo2m]
aws_api_gateway_api_key.tf-api-key: Destruction complete after 0s
aws_iam_role_policy.tf_lambda_policy: Destruction complete after 1s
aws_dynamodb_table.tf-dynamodb-table: Destroying... [id=DA_Serverless]
aws_api_gateway_usage_plan.tf-gw-usage-plan: Destruction complete after 1s
aws_api_gateway_deployment.tf-gw-deployment: Destroying... [id=hrx6q7]
aws_api_gateway_deployment.tf-gw-deployment: Destruction complete after 0s
aws_api_gateway_integration.lambda: Destroying... [id=agi-400gk3ery0-8kfc1a-POST]
aws_api_gateway_integration.lambda: Destruction complete after 1s
aws_api_gateway_method.users: Destroying... [id=agm-400gk3ery0-8kfc1a-POST]
aws_lambda_function.tf_lambda_fn: Destroying... [id=c06-serverless01-lambda]
aws_api_gateway_method.users: Destruction complete after 0s
aws_api_gateway_resource.users: Destroying... [id=8kfc1a]
aws_lambda_function.tf_lambda_fn: Destruction complete after 0s
aws_iam_role_policy_attachment.lambda_logs: Destroying... [id=c06-serverless01-lambda-role-20200902045558223600000001]
aws_s3_bucket.tf-s3-bucket: Destroying... [id=c06-serverless01-s3-bucket]
aws_api_gateway_resource.users: Destruction complete after 0s
aws_api_gateway_rest_api.tf-api-gw: Destroying... [id=400gk3ery0]
aws_api_gateway_rest_api.tf-api-gw: Destruction complete after 0s
aws_s3_bucket.tf-s3-bucket: Destruction complete after 1s
aws_iam_role_policy_attachment.lambda_logs: Destruction complete after 1s
aws_iam_policy.lambda_logging: Destroying... [id=arn:aws:iam::438549961569:policy/lambda_logging]
aws_iam_role.tf_lambda_role: Destroying... [id=c06-serverless01-lambda-role]
aws_iam_policy.lambda_logging: Destruction complete after 2s
aws_iam_role.tf_lambda_role: Destruction complete after 2s
aws_dynamodb_table.tf-dynamodb-table: Destruction complete after 7s
aws_kms_key.tf-kms-key: Destroying... [id=6f74f981-8ddb-400e-bce0-823cf9197d4d]
aws_kms_key.tf-kms-key: Destruction complete after 1s

Destroy complete! Resources: 20 destroyed.
```
