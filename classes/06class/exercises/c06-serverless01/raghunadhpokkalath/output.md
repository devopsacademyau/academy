### Deploy Serverless infra
> make deploy
docker-compose run --rm shell  aws ssm put-parameter \
    --name "DB_NAME" \
    --type "String" \
    --value DA_Serverless \
    --overwrite
{
    "Version": 4,
    "Tier": "Standard"
}
docker-compose run --rm shell make _plan
cd terraform;terraform init;terraform plan -var db_name=DA_Serverless -out serverless_06_01

Initializing the backend...

Initializing provider plugins...

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

data.aws_ssm_parameter.db_name: Refreshing state...

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_api_gateway_api_key.this will be created
  + resource "aws_api_gateway_api_key" "this" {
      + arn               = (known after apply)
      + created_date      = (known after apply)
      + description       = "Managed by Terraform"
      + enabled           = true
      + id                = (known after apply)
      + last_updated_date = (known after apply)
      + name              = "customers"
      + value             = (sensitive value)
    }

  # aws_api_gateway_deployment.customer will be created
  + resource "aws_api_gateway_deployment" "customer" {
      + created_date  = (known after apply)
      + execution_arn = (known after apply)
      + id            = (known after apply)
      + invoke_url    = (known after apply)
      + rest_api_id   = (known after apply)
      + stage_name    = "v1"
    }

  # aws_api_gateway_integration.customer will be created
  + resource "aws_api_gateway_integration" "customer" {
      + cache_namespace         = (known after apply)
      + connection_type         = "INTERNET"
      + http_method             = "POST"
      + id                      = (known after apply)
      + integration_http_method = "POST"
      + passthrough_behavior    = (known after apply)
      + resource_id             = (known after apply)
      + rest_api_id             = (known after apply)
      + timeout_milliseconds    = 29000
      + type                    = "AWS_PROXY"
      + uri                     = (known after apply)
    }

  # aws_api_gateway_method.customer will be created
  + resource "aws_api_gateway_method" "customer" {
      + api_key_required = true
      + authorization    = "NONE"
      + http_method      = "POST"
      + id               = (known after apply)
      + resource_id      = (known after apply)
      + rest_api_id      = (known after apply)
    }

  # aws_api_gateway_resource.customer will be created
  + resource "aws_api_gateway_resource" "customer" {
      + id          = (known after apply)
      + parent_id   = (known after apply)
      + path        = (known after apply)
      + path_part   = "customers"
      + rest_api_id = (known after apply)
    }

  # aws_api_gateway_rest_api.customer will be created
  + resource "aws_api_gateway_rest_api" "customer" {
      + api_key_source           = "HEADER"
      + arn                      = (known after apply)
      + created_date             = (known after apply)
      + description              = "Api gateway for create customer"
      + execution_arn            = (known after apply)
      + id                       = (known after apply)
      + minimum_compression_size = -1
      + name                     = "customer"
      + root_resource_id         = (known after apply)

      + endpoint_configuration {
          + types            = (known after apply)
          + vpc_endpoint_ids = (known after apply)
        }
    }

  # aws_api_gateway_usage_plan.this will be created
  + resource "aws_api_gateway_usage_plan" "this" {
      + arn  = (known after apply)
      + id   = (known after apply)
      + name = "usage_plan"

      + api_stages {
          + api_id = (known after apply)
          + stage  = "v1"
        }
    }

  # aws_api_gateway_usage_plan_key.this will be created
  + resource "aws_api_gateway_usage_plan_key" "this" {
      + id            = (known after apply)
      + key_id        = (known after apply)
      + key_type      = "API_KEY"
      + name          = (known after apply)
      + usage_plan_id = (known after apply)
      + value         = (known after apply)
    }

  # aws_cloudwatch_log_group.customer will be created
  + resource "aws_cloudwatch_log_group" "customer" {
      + arn               = (known after apply)
      + id                = (known after apply)
      + name              = "/aws/lambda/da_create_customer_function"
      + retention_in_days = 1
    }

  # aws_dynamodb_table.da_serverless will be created
  + resource "aws_dynamodb_table" "da_serverless" {
      + arn              = (known after apply)
      + billing_mode     = "PAY_PER_REQUEST"
      + hash_key         = "id"
      + id               = (known after apply)
      + name             = "DA_Serverless"
      + stream_arn       = (known after apply)
      + stream_label     = (known after apply)
      + stream_view_type = (known after apply)
      + tags             = {
          + "Name" = "da_c06_serverless-dynamodb"
        }

      + attribute {
          + name = "id"
          + type = "S"
        }

      + point_in_time_recovery {
          + enabled = (known after apply)
        }

      + server_side_encryption {
          + enabled     = true
          + kms_key_arn = (known after apply)
        }
    }

  # aws_iam_role.iam_for_lambda will be created
  + resource "aws_iam_role" "iam_for_lambda" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
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
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + max_session_duration  = 3600
      + name                  = "iam_for_lambda"
      + path                  = "/"
      + unique_id             = (known after apply)
    }

  # aws_iam_role_policy.cloudwatch will be created
  + resource "aws_iam_role_policy" "cloudwatch" {
      + id     = (known after apply)
      + name   = "lambda_cloudwatch_iam"
      + policy = jsonencode(
            {
              + Statement = [
                  + {
                      + Action   = [
                          + "logs:CreateLogStream",
                          + "logs:PutLogEvents",
                        ]
                      + Effect   = "Allow"
                      + Resource = "arn:aws:logs:*:*:*"
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + role   = (known after apply)
    }

  # aws_iam_role_policy.dynamodb will be created
  + resource "aws_iam_role_policy" "dynamodb" {
      + id     = (known after apply)
      + name   = "dynamo_db_iam"
      + policy = (known after apply)
      + role   = (known after apply)
    }

  # aws_kms_grant.this will be created
  + resource "aws_kms_grant" "this" {
      + grant_id          = (known after apply)
      + grant_token       = (known after apply)
      + grantee_principal = (known after apply)
      + id                = (known after apply)
      + key_id            = (known after apply)
      + name              = "lamda-grant"
      + operations        = [
          + "Decrypt",
        ]
      + retire_on_delete  = false
    }

  # aws_kms_key.encryption will be created
  + resource "aws_kms_key" "encryption" {
      + arn                      = (known after apply)
      + customer_master_key_spec = "SYMMETRIC_DEFAULT"
      + description              = (known after apply)
      + enable_key_rotation      = false
      + id                       = (known after apply)
      + is_enabled               = true
      + key_id                   = (known after apply)
      + key_usage                = "ENCRYPT_DECRYPT"
      + policy                   = (known after apply)
    }

  # aws_lambda_function.da_create_customer will be created
  + resource "aws_lambda_function" "da_create_customer" {
      + arn                            = (known after apply)
      + filename                       = "lambda_da.zip"
      + function_name                  = "da_create_customer_function"
      + handler                        = "lambda_handler.lambda_handler"
      + id                             = (known after apply)
      + invoke_arn                     = (known after apply)
      + last_modified                  = (known after apply)
      + memory_size                    = 128
      + publish                        = false
      + qualified_arn                  = (known after apply)
      + reserved_concurrent_executions = -1
      + role                           = (known after apply)
      + runtime                        = "python3.8"
      + source_code_hash               = "D1b4L8dAbS0+/3YkkynnE6B6Y5f9lwGVujI2opFDcY8="
      + source_code_size               = (known after apply)
      + tags                           = {
          + "Name" = "da_c06_serverless-lamda"
        }
      + timeout                        = 3
      + version                        = (known after apply)

      + environment {
          + variables = {
              + "DB_NAME" = "DA_Serverless"
            }
        }

      + tracing_config {
          + mode = (known after apply)
        }
    }

  # aws_lambda_permission.customerapigw will be created
  + resource "aws_lambda_permission" "customerapigw" {
      + action        = "lambda:InvokeFunction"
      + function_name = "da_create_customer_function"
      + id            = (known after apply)
      + principal     = "apigateway.amazonaws.com"
      + source_arn    = (known after apply)
      + statement_id  = "AllowAPIGatewayInvoke"
    }

  # aws_ssm_parameter.api_key will be created
  + resource "aws_ssm_parameter" "api_key" {
      + arn     = (known after apply)
      + id      = (known after apply)
      + key_id  = (known after apply)
      + name    = "apikey"
      + tags    = {
          + "Name" = "da_c06_serverless-ssm"
        }
      + tier    = "Standard"
      + type    = "String"
      + value   = (sensitive value)
      + version = (known after apply)
    }

  # aws_ssm_parameter.db_name will be created
  + resource "aws_ssm_parameter" "db_name" {
      + arn     = (known after apply)
      + id      = (known after apply)
      + key_id  = (known after apply)
      + name    = "dbname"
      + tags    = {
          + "Name" = "da_c06_serverless-ssm"
        }
      + tier    = "Standard"
      + type    = "String"
      + value   = (sensitive value)
      + version = (known after apply)
    }

Plan: 19 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

This plan was saved to: serverless_06_01

To perform exactly these actions, run the following command to apply:
    terraform apply "serverless_06_01"

docker-compose run --rm shell make _deploy
cd terraform; terraform apply serverless_06_01;
aws_kms_key.encryption: Creating...
aws_api_gateway_rest_api.customer: Creating...
aws_iam_role.iam_for_lambda: Creating...
aws_api_gateway_api_key.this: Creating...
aws_ssm_parameter.db_name: Creating...
aws_api_gateway_api_key.this: Creation complete after 0s [id=umr62c0066]
aws_ssm_parameter.api_key: Creating...
aws_api_gateway_rest_api.customer: Creation complete after 1s [id=5hcfgez98d]
aws_api_gateway_resource.customer: Creating...
aws_ssm_parameter.db_name: Creation complete after 1s [id=dbname]
aws_api_gateway_resource.customer: Creation complete after 0s [id=lcup8b]
aws_kms_key.encryption: Creation complete after 1s [id=8a3b9aaa-2a2d-44a9-9b60-37a91aff442e]
aws_api_gateway_method.customer: Creating...
aws_dynamodb_table.da_serverless: Creating...
aws_api_gateway_method.customer: Creation complete after 0s [id=agm-5hcfgez98d-lcup8b-POST]
aws_ssm_parameter.api_key: Creation complete after 1s [id=apikey]
aws_iam_role.iam_for_lambda: Creation complete after 2s [id=iam_for_lambda]
aws_iam_role_policy.cloudwatch: Creating...
aws_kms_grant.this: Creating...
aws_lambda_function.da_create_customer: Creating...
aws_iam_role_policy.cloudwatch: Creation complete after 2s [id=iam_for_lambda:lambda_cloudwatch_iam]
aws_dynamodb_table.da_serverless: Creation complete after 8s [id=DA_Serverless]
aws_iam_role_policy.dynamodb: Creating...
aws_iam_role_policy.dynamodb: Creation complete after 2s [id=iam_for_lambda:dynamo_db_iam]
aws_kms_grant.this: Still creating... [10s elapsed]
aws_lambda_function.da_create_customer: Still creating... [10s elapsed]
aws_kms_grant.this: Creation complete after 17s [id=8a3b9aaa-2a2d-44a9-9b60-37a91aff442e:6a5f4ce14d85b3306b287367c9038a818c8d1e3438ce84f9bc7e396e8e2f2b40]
aws_lambda_function.da_create_customer: Still creating... [20s elapsed]
aws_lambda_function.da_create_customer: Creation complete after 23s [id=da_create_customer_function]
aws_cloudwatch_log_group.customer: Creating...
aws_lambda_permission.customerapigw: Creating...
aws_api_gateway_integration.customer: Creating...
aws_lambda_permission.customerapigw: Creation complete after 0s [id=AllowAPIGatewayInvoke]
aws_api_gateway_integration.customer: Creation complete after 0s [id=agi-5hcfgez98d-lcup8b-POST]
aws_api_gateway_deployment.customer: Creating...
aws_cloudwatch_log_group.customer: Creation complete after 0s [id=/aws/lambda/da_create_customer_function]
aws_api_gateway_deployment.customer: Creation complete after 1s [id=1k2clk]
aws_api_gateway_usage_plan.this: Creating...
aws_api_gateway_usage_plan.this: Creation complete after 0s [id=8kn0kv]
aws_api_gateway_usage_plan_key.this: Creating...
aws_api_gateway_usage_plan_key.this: Creation complete after 1s [id=umr62c0066]

Apply complete! Resources: 19 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path: terraform.tfstate

Outputs:

api_endpoint = https://5hcfgez98d.execute-api.ap-southeast-2.amazonaws.com/v1
api_key = pm29mVTkaK99v2AXEg8KH2uHWuIlNK4L9KkW2FpT


### Test create customer  application using api key

> curl -v --location --request POST 'https://5hcfgez98d.execute-api.ap-southeast-2.amazonaws.com/v1/customers' \
--header 'Content-Type: application/json' \
--header 'x-api-key: pm29mVTkaK99v2AXEg8KH2uHWuIlNK4L9KkW2FpT' \
--data-raw '{
    "firstname": "Raghunadh",
    "lastname": "Pokkalath",
    "email": "test@gmail.com"
}'

Note: Unnecessary use of -X or --request, POST is already inferred.
*   Trying 13.224.179.89...
* TCP_NODELAY set
* Connected to 5hcfgez98d.execute-api.ap-southeast-2.amazonaws.com (13.224.179.89) port 443 (#0)
* ALPN, offering h2
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*   CAfile: /etc/ssl/cert.pem
  CApath: none
* TLSv1.2 (OUT), TLS handshake, Client hello (1):
* TLSv1.2 (IN), TLS handshake, Server hello (2):
* TLSv1.2 (IN), TLS handshake, Certificate (11):
* TLSv1.2 (IN), TLS handshake, Server key exchange (12):
* TLSv1.2 (IN), TLS handshake, Server finished (14):
* TLSv1.2 (OUT), TLS handshake, Client key exchange (16):
* TLSv1.2 (OUT), TLS change cipher, Change cipher spec (1):
* TLSv1.2 (OUT), TLS handshake, Finished (20):
* TLSv1.2 (IN), TLS change cipher, Change cipher spec (1):
* TLSv1.2 (IN), TLS handshake, Finished (20):
* SSL connection using TLSv1.2 / ECDHE-RSA-AES128-GCM-SHA256
* ALPN, server accepted to use h2
* Server certificate:
*  subject: CN=*.execute-api.ap-southeast-2.amazonaws.com
*  start date: Jul  9 00:00:00 2020 GMT
*  expire date: Aug  9 12:00:00 2021 GMT
*  subjectAltName: host "5hcfgez98d.execute-api.ap-southeast-2.amazonaws.com" matched cert's "*.execute-api.ap-southeast-2.amazonaws.com"
*  issuer: C=US; O=Amazon; OU=Server CA 1B; CN=Amazon
*  SSL certificate verify ok.
* Using HTTP2, server supports multi-use
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* Using Stream ID: 1 (easy handle 0x7f952f00f600)
> POST /v1/customers HTTP/2
> Host: 5hcfgez98d.execute-api.ap-southeast-2.amazonaws.com
> User-Agent: curl/7.64.1
> Accept: */*
> Content-Type: application/json
> x-api-key: pm29mVTkaK99v2AXEg8KH2uHWuIlNK4L9KkW2FpT
> Content-Length: 92
> 
* Connection state changed (MAX_CONCURRENT_STREAMS == 128)!
* We are completely uploaded and fine
< HTTP/2 201 
< content-type: application/json
< content-length: 0
< date: Thu, 03 Sep 2020 14:19:04 GMT
< x-amzn-requestid: 69c338e6-a6ab-4f9b-9ead-a6e9a2c5013d
< x-amz-apigw-id: SSw1zG7dSwMFwcg=
< x-amzn-trace-id: Root=1-5f50fb58-e120e7925c1f648b4ec13dd2;Sampled=0
< x-cache: Miss from cloudfront
< via: 1.1 88f40be442aecae39e92819a37969961.cloudfront.net (CloudFront)
< x-amz-cf-pop: SYD1-C2
< x-amz-cf-id: 1sjAMllDVJUkMuZQM30uwy53R-Uf0w2sBmFCcCh_w2v1MlEPtttyUw==
< 
* Connection #0 to host 5hcfgez98d.execute-api.ap-southeast-2.amazonaws.com left intact
* Closing connection 0


### Delete the Lamda
make clean

docker-compose run --rm shell make _clean
cd terraform;terraform destroy;
data.aws_ssm_parameter.db_name: Refreshing state...
aws_iam_role.iam_for_lambda: Refreshing state... [id=iam_for_lambda]
aws_api_gateway_api_key.this: Refreshing state... [id=umr62c0066]
aws_api_gateway_rest_api.customer: Refreshing state... [id=5hcfgez98d]
aws_kms_key.encryption: Refreshing state... [id=8a3b9aaa-2a2d-44a9-9b60-37a91aff442e]
aws_ssm_parameter.db_name: Refreshing state... [id=dbname]
aws_ssm_parameter.api_key: Refreshing state... [id=apikey]
aws_api_gateway_resource.customer: Refreshing state... [id=lcup8b]
aws_api_gateway_method.customer: Refreshing state... [id=agm-5hcfgez98d-lcup8b-POST]
aws_dynamodb_table.da_serverless: Refreshing state... [id=DA_Serverless]
aws_lambda_function.da_create_customer: Refreshing state... [id=da_create_customer_function]
aws_kms_grant.this: Refreshing state... [id=8a3b9aaa-2a2d-44a9-9b60-37a91aff442e:6a5f4ce14d85b3306b287367c9038a818c8d1e3438ce84f9bc7e396e8e2f2b40]
aws_iam_role_policy.cloudwatch: Refreshing state... [id=iam_for_lambda:lambda_cloudwatch_iam]
aws_iam_role_policy.dynamodb: Refreshing state... [id=iam_for_lambda:dynamo_db_iam]
aws_cloudwatch_log_group.customer: Refreshing state... [id=/aws/lambda/da_create_customer_function]
aws_lambda_permission.customerapigw: Refreshing state... [id=AllowAPIGatewayInvoke]
aws_api_gateway_integration.customer: Refreshing state... [id=agi-5hcfgez98d-lcup8b-POST]
aws_api_gateway_deployment.customer: Refreshing state... [id=1k2clk]
aws_api_gateway_usage_plan.this: Refreshing state... [id=8kn0kv]
aws_api_gateway_usage_plan_key.this: Refreshing state... [id=umr62c0066]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_api_gateway_api_key.this will be destroyed
  - resource "aws_api_gateway_api_key" "this" {
      - arn               = "arn:aws:apigateway:ap-southeast-2::/apikeys/umr62c0066" -> null
      - created_date      = "2020-09-03T14:12:25Z" -> null
      - description       = "Managed by Terraform" -> null
      - enabled           = true -> null
      - id                = "umr62c0066" -> null
      - last_updated_date = "2020-09-03T14:12:25Z" -> null
      - name              = "customers" -> null
      - tags              = {} -> null
      - value             = (sensitive value)
    }

  # aws_api_gateway_deployment.customer will be destroyed
  - resource "aws_api_gateway_deployment" "customer" {
      - created_date  = "2020-09-03T14:12:50Z" -> null
      - execution_arn = "arn:aws:execute-api:ap-southeast-2:230681605246:5hcfgez98d/v1" -> null
      - id            = "1k2clk" -> null
      - invoke_url    = "https://5hcfgez98d.execute-api.ap-southeast-2.amazonaws.com/v1" -> null
      - rest_api_id   = "5hcfgez98d" -> null
      - stage_name    = "v1" -> null
    }

  # aws_api_gateway_integration.customer will be destroyed
  - resource "aws_api_gateway_integration" "customer" {
      - cache_key_parameters    = [] -> null
      - cache_namespace         = "lcup8b" -> null
      - connection_type         = "INTERNET" -> null
      - http_method             = "POST" -> null
      - id                      = "agi-5hcfgez98d-lcup8b-POST" -> null
      - integration_http_method = "POST" -> null
      - passthrough_behavior    = "WHEN_NO_MATCH" -> null
      - request_parameters      = {} -> null
      - request_templates       = {} -> null
      - resource_id             = "lcup8b" -> null
      - rest_api_id             = "5hcfgez98d" -> null
      - timeout_milliseconds    = 29000 -> null
      - type                    = "AWS_PROXY" -> null
      - uri                     = "arn:aws:apigateway:ap-southeast-2:lambda:path/2015-03-31/functions/arn:aws:lambda:ap-southeast-2:230681605246:function:da_create_customer_function/invocations" -> null
    }

  # aws_api_gateway_method.customer will be destroyed
  - resource "aws_api_gateway_method" "customer" {
      - api_key_required     = true -> null
      - authorization        = "NONE" -> null
      - authorization_scopes = [] -> null
      - http_method          = "POST" -> null
      - id                   = "agm-5hcfgez98d-lcup8b-POST" -> null
      - request_models       = {} -> null
      - request_parameters   = {} -> null
      - resource_id          = "lcup8b" -> null
      - rest_api_id          = "5hcfgez98d" -> null
    }

  # aws_api_gateway_resource.customer will be destroyed
  - resource "aws_api_gateway_resource" "customer" {
      - id          = "lcup8b" -> null
      - parent_id   = "o91wuaok3g" -> null
      - path        = "/customers" -> null
      - path_part   = "customers" -> null
      - rest_api_id = "5hcfgez98d" -> null
    }

  # aws_api_gateway_rest_api.customer will be destroyed
  - resource "aws_api_gateway_rest_api" "customer" {
      - api_key_source           = "HEADER" -> null
      - arn                      = "arn:aws:apigateway:ap-southeast-2::/restapis/5hcfgez98d" -> null
      - binary_media_types       = [] -> null
      - created_date             = "2020-09-03T14:12:25Z" -> null
      - description              = "Api gateway for create customer" -> null
      - execution_arn            = "arn:aws:execute-api:ap-southeast-2:230681605246:5hcfgez98d" -> null
      - id                       = "5hcfgez98d" -> null
      - minimum_compression_size = -1 -> null
      - name                     = "customer" -> null
      - root_resource_id         = "o91wuaok3g" -> null
      - tags                     = {} -> null

      - endpoint_configuration {
          - types            = [
              - "EDGE",
            ] -> null
          - vpc_endpoint_ids = [] -> null
        }
    }

  # aws_api_gateway_usage_plan.this will be destroyed
  - resource "aws_api_gateway_usage_plan" "this" {
      - arn  = "arn:aws:apigateway:ap-southeast-2::/usageplans/8kn0kv" -> null
      - id   = "8kn0kv" -> null
      - name = "usage_plan" -> null
      - tags = {} -> null

      - api_stages {
          - api_id = "5hcfgez98d" -> null
          - stage  = "v1" -> null
        }
    }

  # aws_api_gateway_usage_plan_key.this will be destroyed
  - resource "aws_api_gateway_usage_plan_key" "this" {
      - id            = "umr62c0066" -> null
      - key_id        = "umr62c0066" -> null
      - key_type      = "API_KEY" -> null
      - name          = "customers" -> null
      - usage_plan_id = "8kn0kv" -> null
    }

  # aws_cloudwatch_log_group.customer will be destroyed
  - resource "aws_cloudwatch_log_group" "customer" {
      - arn               = "arn:aws:logs:ap-southeast-2:230681605246:log-group:/aws/lambda/da_create_customer_function:*" -> null
      - id                = "/aws/lambda/da_create_customer_function" -> null
      - name              = "/aws/lambda/da_create_customer_function" -> null
      - retention_in_days = 1 -> null
      - tags              = {} -> null
    }

  # aws_dynamodb_table.da_serverless will be destroyed
  - resource "aws_dynamodb_table" "da_serverless" {
      - arn            = "arn:aws:dynamodb:ap-southeast-2:230681605246:table/DA_Serverless" -> null
      - billing_mode   = "PAY_PER_REQUEST" -> null
      - hash_key       = "id" -> null
      - id             = "DA_Serverless" -> null
      - name           = "DA_Serverless" -> null
      - read_capacity  = 0 -> null
      - stream_enabled = false -> null
      - tags           = {
          - "Name" = "da_c06_serverless-dynamodb"
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
          - kms_key_arn = "arn:aws:kms:ap-southeast-2:230681605246:key/8a3b9aaa-2a2d-44a9-9b60-37a91aff442e" -> null
        }

      - ttl {
          - enabled = false -> null
        }
    }

  # aws_iam_role.iam_for_lambda will be destroyed
  - resource "aws_iam_role" "iam_for_lambda" {
      - arn                   = "arn:aws:iam::230681605246:role/iam_for_lambda" -> null
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
              - Version   = "2012-10-17"
            }
        ) -> null
      - create_date           = "2020-09-03T14:12:26Z" -> null
      - force_detach_policies = false -> null
      - id                    = "iam_for_lambda" -> null
      - max_session_duration  = 3600 -> null
      - name                  = "iam_for_lambda" -> null
      - path                  = "/" -> null
      - tags                  = {} -> null
      - unique_id             = "AROATLNNR6R7NSJTI3P4H" -> null
    }

  # aws_iam_role_policy.cloudwatch will be destroyed
  - resource "aws_iam_role_policy" "cloudwatch" {
      - id     = "iam_for_lambda:lambda_cloudwatch_iam" -> null
      - name   = "lambda_cloudwatch_iam" -> null
      - policy = jsonencode(
            {
              - Statement = [
                  - {
                      - Action   = [
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
      - role   = "iam_for_lambda" -> null
    }

  # aws_iam_role_policy.dynamodb will be destroyed
  - resource "aws_iam_role_policy" "dynamodb" {
      - id     = "iam_for_lambda:dynamo_db_iam" -> null
      - name   = "dynamo_db_iam" -> null
      - policy = jsonencode(
            {
              - Statement = [
                  - {
                      - Action   = [
                          - "dynamodb:PutItem",
                        ]
                      - Effect   = "Allow"
                      - Resource = "arn:aws:dynamodb:ap-southeast-2:230681605246:table/DA_Serverless"
                    },
                ]
              - Version   = "2012-10-17"
            }
        ) -> null
      - role   = "iam_for_lambda" -> null
    }

  # aws_kms_grant.this will be destroyed
  - resource "aws_kms_grant" "this" {
      - grant_id          = "6a5f4ce14d85b3306b287367c9038a818c8d1e3438ce84f9bc7e396e8e2f2b40" -> null
      - grant_token       = "AQpANDcxMTk2YWRjOTU3NTgxYzgwZmM2NDRmMDEzYzkyYjI3YmVlZTg4MDI1MTg0ZDBlYjQ1OTZiZmY3NmJmZGZiZiKaAgEBAgB4RxGWrclXWByA_GRPATySsnvu6IAlGE0OtFlr_3a_378AAADxMIHuBgkqhkiG9w0BBwaggeAwgd0CAQAwgdcGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMypxuBzYZIkyM5PQ-AgEQgIGpSSrlklKzzwPny6h0J2m8G9xDd7JyVRo-ZiaxFj5d04TLdQLIIVmcGbfdlFot0X_v2VK8XHncMAhK9mfwZTP3XSTzUfMxAfIUhG7Cl-tZXd6ZVDl-1DrU39VR9OSv5Zz7dE2UsvmmnbRg6DmQrtiuYRdkrTJJZe2GJEByzjtJ5dASjgNAzQbeaRbcxq2LfeTiUAiPtsOso1_Gy4gfAqDTXzMYveam0LV4yiogal9M4U2FszBrKHNnyQOKgYyNHjQ4zoT5vH45bo4vK0A" -> null
      - grantee_principal = "arn:aws:iam::230681605246:role/iam_for_lambda" -> null
      - id                = "8a3b9aaa-2a2d-44a9-9b60-37a91aff442e:6a5f4ce14d85b3306b287367c9038a818c8d1e3438ce84f9bc7e396e8e2f2b40" -> null
      - key_id            = "8a3b9aaa-2a2d-44a9-9b60-37a91aff442e" -> null
      - name              = "lamda-grant" -> null
      - operations        = [
          - "Decrypt",
        ] -> null
      - retire_on_delete  = false -> null
    }

  # aws_kms_key.encryption will be destroyed
  - resource "aws_kms_key" "encryption" {
      - arn                      = "arn:aws:kms:ap-southeast-2:230681605246:key/8a3b9aaa-2a2d-44a9-9b60-37a91aff442e" -> null
      - customer_master_key_spec = "SYMMETRIC_DEFAULT" -> null
      - enable_key_rotation      = false -> null
      - id                       = "8a3b9aaa-2a2d-44a9-9b60-37a91aff442e" -> null
      - is_enabled               = true -> null
      - key_id                   = "8a3b9aaa-2a2d-44a9-9b60-37a91aff442e" -> null
      - key_usage                = "ENCRYPT_DECRYPT" -> null
      - policy                   = jsonencode(
            {
              - Id        = "key-default-1"
              - Statement = [
                  - {
                      - Action    = "kms:*"
                      - Effect    = "Allow"
                      - Principal = {
                          - AWS = "arn:aws:iam::230681605246:root"
                        }
                      - Resource  = "*"
                      - Sid       = "Enable IAM User Permissions"
                    },
                ]
              - Version   = "2012-10-17"
            }
        ) -> null
      - tags                     = {} -> null
    }

  # aws_lambda_function.da_create_customer will be destroyed
  - resource "aws_lambda_function" "da_create_customer" {
      - arn                            = "arn:aws:lambda:ap-southeast-2:230681605246:function:da_create_customer_function" -> null
      - filename                       = "lambda_da.zip" -> null
      - function_name                  = "da_create_customer_function" -> null
      - handler                        = "lambda_handler.lambda_handler" -> null
      - id                             = "da_create_customer_function" -> null
      - invoke_arn                     = "arn:aws:apigateway:ap-southeast-2:lambda:path/2015-03-31/functions/arn:aws:lambda:ap-southeast-2:230681605246:function:da_create_customer_function/invocations" -> null
      - last_modified                  = "2020-09-03T14:12:49.787+0000" -> null
      - layers                         = [] -> null
      - memory_size                    = 128 -> null
      - publish                        = false -> null
      - qualified_arn                  = "arn:aws:lambda:ap-southeast-2:230681605246:function:da_create_customer_function:$LATEST" -> null
      - reserved_concurrent_executions = -1 -> null
      - role                           = "arn:aws:iam::230681605246:role/iam_for_lambda" -> null
      - runtime                        = "python3.8" -> null
      - source_code_hash               = "D1b4L8dAbS0+/3YkkynnE6B6Y5f9lwGVujI2opFDcY8=" -> null
      - source_code_size               = 1204 -> null
      - tags                           = {
          - "Name" = "da_c06_serverless-lamda"
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

  # aws_lambda_permission.customerapigw will be destroyed
  - resource "aws_lambda_permission" "customerapigw" {
      - action        = "lambda:InvokeFunction" -> null
      - function_name = "da_create_customer_function" -> null
      - id            = "AllowAPIGatewayInvoke" -> null
      - principal     = "apigateway.amazonaws.com" -> null
      - source_arn    = "arn:aws:execute-api:ap-southeast-2:230681605246:5hcfgez98d/*/*" -> null
      - statement_id  = "AllowAPIGatewayInvoke" -> null
    }

  # aws_ssm_parameter.api_key will be destroyed
  - resource "aws_ssm_parameter" "api_key" {
      - arn     = "arn:aws:ssm:ap-southeast-2:230681605246:parameter/apikey" -> null
      - id      = "apikey" -> null
      - name    = "apikey" -> null
      - tags    = {
          - "Name" = "da_c06_serverless-ssm"
        } -> null
      - tier    = "Standard" -> null
      - type    = "String" -> null
      - value   = (sensitive value)
      - version = 1 -> null
    }

  # aws_ssm_parameter.db_name will be destroyed
  - resource "aws_ssm_parameter" "db_name" {
      - arn     = "arn:aws:ssm:ap-southeast-2:230681605246:parameter/dbname" -> null
      - id      = "dbname" -> null
      - name    = "dbname" -> null
      - tags    = {
          - "Name" = "da_c06_serverless-ssm"
        } -> null
      - tier    = "Standard" -> null
      - type    = "String" -> null
      - value   = (sensitive value)
      - version = 1 -> null
    }

Plan: 0 to add, 0 to change, 19 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_iam_role_policy.dynamodb: Destroying... [id=iam_for_lambda:dynamo_db_iam]
aws_iam_role_policy.cloudwatch: Destroying... [id=iam_for_lambda:lambda_cloudwatch_iam]
aws_lambda_permission.customerapigw: Destroying... [id=AllowAPIGatewayInvoke]
aws_cloudwatch_log_group.customer: Destroying... [id=/aws/lambda/da_create_customer_function]
aws_kms_grant.this: Destroying... [id=8a3b9aaa-2a2d-44a9-9b60-37a91aff442e:6a5f4ce14d85b3306b287367c9038a818c8d1e3438ce84f9bc7e396e8e2f2b40]
aws_ssm_parameter.db_name: Destroying... [id=dbname]
aws_api_gateway_usage_plan_key.this: Destroying... [id=umr62c0066]
aws_ssm_parameter.api_key: Destroying... [id=apikey]
aws_cloudwatch_log_group.customer: Destruction complete after 0s
aws_ssm_parameter.api_key: Destruction complete after 0s
aws_ssm_parameter.db_name: Destruction complete after 0s
aws_lambda_permission.customerapigw: Destruction complete after 0s
aws_kms_grant.this: Destruction complete after 0s
aws_api_gateway_usage_plan_key.this: Destruction complete after 0s
aws_api_gateway_api_key.this: Destroying... [id=umr62c0066]
aws_api_gateway_usage_plan.this: Destroying... [id=8kn0kv]
aws_api_gateway_api_key.this: Destruction complete after 1s
aws_iam_role_policy.dynamodb: Destruction complete after 1s
aws_iam_role_policy.cloudwatch: Destruction complete after 1s
aws_dynamodb_table.da_serverless: Destroying... [id=DA_Serverless]
aws_api_gateway_usage_plan.this: Destruction complete after 1s
aws_api_gateway_deployment.customer: Destroying... [id=1k2clk]
aws_api_gateway_deployment.customer: Destruction complete after 1s
aws_api_gateway_integration.customer: Destroying... [id=agi-5hcfgez98d-lcup8b-POST]
aws_api_gateway_integration.customer: Destruction complete after 0s
aws_api_gateway_method.customer: Destroying... [id=agm-5hcfgez98d-lcup8b-POST]
aws_lambda_function.da_create_customer: Destroying... [id=da_create_customer_function]
aws_api_gateway_method.customer: Destruction complete after 0s
aws_api_gateway_resource.customer: Destroying... [id=lcup8b]
aws_lambda_function.da_create_customer: Destruction complete after 0s
aws_iam_role.iam_for_lambda: Destroying... [id=iam_for_lambda]
aws_api_gateway_resource.customer: Destruction complete after 0s
aws_api_gateway_rest_api.customer: Destroying... [id=5hcfgez98d]
aws_api_gateway_rest_api.customer: Destruction complete after 1s
aws_iam_role.iam_for_lambda: Destruction complete after 2s
aws_dynamodb_table.da_serverless: Destruction complete after 7s
aws_kms_key.encryption: Destroying... [id=8a3b9aaa-2a2d-44a9-9b60-37a91aff442e]
aws_kms_key.encryption: Destruction complete after 0s

Destroy complete! Resources: 19 destroyed.