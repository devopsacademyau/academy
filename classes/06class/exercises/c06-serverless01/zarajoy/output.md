# c06-serverless01

## Creating a POST API using API Gateway, Lambda and DynamoDB

- [_provider.tf](_provider.tf)
- [main.tf](main.tf)
- [output.tf](output.tf)
- [Makefile](Makefile)
- [output.md](output.md)

## Command Execution Output
```
z@bacon:~/Desktop/Working (another copy)$ make deploy
make ssm-key
make[1]: Entering directory '/home/z/Desktop/Working (another copy)'
docker-compose run --rm aws ssm put-parameter \
	--name DB_NAME \
	--value DA_Serverless \
	--type SecureString \
	--overwrite \
	--region ap-southeast-2
{
    "Version": 38,
    "Tier": "Standard"
}
make[1]: Leaving directory '/home/z/Desktop/Working (another copy)'
make init
make[1]: Entering directory '/home/z/Desktop/Working (another copy)'
docker-compose run --rm terraform init

Initializing the backend...

Initializing provider plugins...

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
make[1]: Leaving directory '/home/z/Desktop/Working (another copy)'
make plan
make[1]: Entering directory '/home/z/Desktop/Working (another copy)'
docker-compose run --rm terraform plan -out terraform-plan 
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

data.aws_ssm_parameter.DB_NAME: Refreshing state...

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_api_gateway_api_key.key will be created
  + resource "aws_api_gateway_api_key" "key" {
      + arn               = (known after apply)
      + created_date      = (known after apply)
      + description       = "Managed by Terraform"
      + enabled           = true
      + id                = (known after apply)
      + last_updated_date = (known after apply)
      + name              = "c06-serverless01_key"
      + value             = (sensitive value)
    }

  # aws_api_gateway_deployment.serverless will be created
  + resource "aws_api_gateway_deployment" "serverless" {
      + created_date  = (known after apply)
      + execution_arn = (known after apply)
      + id            = (known after apply)
      + invoke_url    = (known after apply)
      + rest_api_id   = (known after apply)
      + stage_name    = "serverless"
    }

  # aws_api_gateway_integration.lambda will be created
  + resource "aws_api_gateway_integration" "lambda" {
      + cache_namespace         = (known after apply)
      + connection_type         = "INTERNET"
      + content_handling        = "CONVERT_TO_TEXT"
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

  # aws_api_gateway_method.customers will be created
  + resource "aws_api_gateway_method" "customers" {
      + api_key_required = true
      + authorization    = "NONE"
      + http_method      = "POST"
      + id               = (known after apply)
      + resource_id      = (known after apply)
      + rest_api_id      = (known after apply)
    }

  # aws_api_gateway_resource.customers will be created
  + resource "aws_api_gateway_resource" "customers" {
      + id          = (known after apply)
      + parent_id   = (known after apply)
      + path        = (known after apply)
      + path_part   = "customers"
      + rest_api_id = (known after apply)
    }

  # aws_api_gateway_rest_api.api will be created
  + resource "aws_api_gateway_rest_api" "api" {
      + api_key_source           = "HEADER"
      + arn                      = (known after apply)
      + binary_media_types       = [
          + "*/*",
        ]
      + created_date             = (known after apply)
      + description              = "Terraform Serverless Application for c06-serverless01"
      + execution_arn            = (known after apply)
      + id                       = (known after apply)
      + minimum_compression_size = -1
      + name                     = "c06-serverless01_api_gateway"
      + root_resource_id         = (known after apply)

      + endpoint_configuration {
          + types            = (known after apply)
          + vpc_endpoint_ids = (known after apply)
        }
    }

  # aws_api_gateway_usage_plan.serverless will be created
  + resource "aws_api_gateway_usage_plan" "serverless" {
      + arn  = (known after apply)
      + id   = (known after apply)
      + name = "c06-serverless01_usage_plan"

      + api_stages {
          + api_id = (known after apply)
          + stage  = "serverless"
        }
    }

  # aws_api_gateway_usage_plan_key.serverless will be created
  + resource "aws_api_gateway_usage_plan_key" "serverless" {
      + id            = (known after apply)
      + key_id        = (known after apply)
      + key_type      = "API_KEY"
      + name          = (known after apply)
      + usage_plan_id = (known after apply)
      + value         = (known after apply)
    }

  # aws_dynamodb_table.DA_Serverless will be created
  + resource "aws_dynamodb_table" "DA_Serverless" {
      + arn              = (known after apply)
      + billing_mode     = "PAY_PER_REQUEST"
      + hash_key         = "id"
      + id               = (known after apply)
      + name             = "DA_Serverless"
      + read_capacity    = 5
      + stream_arn       = (known after apply)
      + stream_label     = (known after apply)
      + stream_view_type = (known after apply)
      + write_capacity   = 5

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

  # aws_iam_role.lambda will be created
  + resource "aws_iam_role" "lambda" {
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
      + name                  = "c06-serverless01_lamda_function"
      + path                  = "/"
      + unique_id             = (known after apply)
    }

  # aws_iam_role_policy.lambda will be created
  + resource "aws_iam_role_policy" "lambda" {
      + id     = (known after apply)
      + name   = "lambda-dynamodb-c06-serverless01"
      + policy = (known after apply)
      + role   = (known after apply)
    }

  # aws_kms_grant.lambda will be created
  + resource "aws_kms_grant" "lambda" {
      + grant_id          = (known after apply)
      + grant_token       = (known after apply)
      + grantee_principal = (known after apply)
      + id                = (known after apply)
      + key_id            = (known after apply)
      + name              = "c06-serverless01_kms_grant"
      + operations        = [
          + "Decrypt",
        ]
      + retire_on_delete  = false
    }

  # aws_kms_key.db_key will be created
  + resource "aws_kms_key" "db_key" {
      + arn                      = (known after apply)
      + customer_master_key_spec = "SYMMETRIC_DEFAULT"
      + deletion_window_in_days  = 14
      + description              = "kms key for c06-serverless01"
      + enable_key_rotation      = false
      + id                       = (known after apply)
      + is_enabled               = true
      + key_id                   = (known after apply)
      + key_usage                = "ENCRYPT_DECRYPT"
      + policy                   = (known after apply)
      + tags                     = {
          + "Name" = "c06-serverless01_db_key"
        }
    }

  # aws_lambda_function.lambda_function will be created
  + resource "aws_lambda_function" "lambda_function" {
      + arn                            = (known after apply)
      + filename                       = "./src/lambda.zip"
      + function_name                  = "c06-serverless01_lambda_function"
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
      + source_code_hash               = (known after apply)
      + source_code_size               = (known after apply)
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

  # aws_lambda_permission.api will be created
  + resource "aws_lambda_permission" "api" {
      + action        = "lambda:InvokeFunction"
      + function_name = "c06-serverless01_lambda_function"
      + id            = (known after apply)
      + principal     = "apigateway.amazonaws.com"
      + source_arn    = (known after apply)
      + statement_id  = "AllowApiInvoke"
    }

  # aws_ssm_parameter.api_key will be created
  + resource "aws_ssm_parameter" "api_key" {
      + arn       = (known after apply)
      + data_type = (known after apply)
      + id        = (known after apply)
      + key_id    = (known after apply)
      + name      = "API_KEY"
      + tier      = "Standard"
      + type      = "SecureString"
      + value     = (sensitive value)
      + version   = (known after apply)
    }

Plan: 16 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

This plan was saved to: terraform-plan

To perform exactly these actions, run the following command to apply:
    terraform apply "terraform-plan"

make[1]: Leaving directory '/home/z/Desktop/Working (another copy)'
make apply
make[1]: Entering directory '/home/z/Desktop/Working (another copy)'
docker-compose run --rm terraform apply "terraform-plan"
aws_api_gateway_api_key.key: Creating...
aws_kms_key.db_key: Creating...
aws_iam_role.lambda: Creating...
aws_api_gateway_rest_api.api: Creating...
aws_api_gateway_api_key.key: Creation complete after 0s [id=xthqswzh92]
aws_ssm_parameter.api_key: Creating...
aws_api_gateway_rest_api.api: Creation complete after 1s [id=g3kzucoeb3]
aws_api_gateway_resource.customers: Creating...
aws_kms_key.db_key: Creation complete after 1s [id=e24b1b14-03a8-47f0-89f0-da7f3e93bbce]
aws_dynamodb_table.DA_Serverless: Creating...
aws_ssm_parameter.api_key: Creation complete after 1s [id=API_KEY]
aws_api_gateway_resource.customers: Creation complete after 0s [id=z5bpk3]
aws_api_gateway_method.customers: Creating...
aws_api_gateway_method.customers: Creation complete after 0s [id=agm-g3kzucoeb3-z5bpk3-POST]
aws_iam_role.lambda: Creation complete after 2s [id=c06-serverless01_lamda_function]
aws_kms_grant.lambda: Creating...
aws_lambda_function.lambda_function: Creating...
aws_dynamodb_table.DA_Serverless: Creation complete after 7s [id=DA_Serverless]
aws_iam_role_policy.lambda: Creating...
aws_iam_role_policy.lambda: Creation complete after 3s [id=c06-serverless01_lamda_function:lambda-dynamodb-c06-serverless01]
aws_kms_grant.lambda: Still creating... [10s elapsed]
aws_lambda_function.lambda_function: Still creating... [10s elapsed]
aws_kms_grant.lambda: Creation complete after 17s [id=e24b1b14-03a8-47f0-89f0-da7f3e93bbce:5cb3a1d66cf788173d882de7c6fa37a311518e3ae661ac0dc9e1e36e1e86e81c]
aws_lambda_function.lambda_function: Still creating... [20s elapsed]
aws_lambda_function.lambda_function: Creation complete after 22s [id=c06-serverless01_lambda_function]
aws_lambda_permission.api: Creating...
aws_api_gateway_integration.lambda: Creating...
aws_lambda_permission.api: Creation complete after 0s [id=AllowApiInvoke]
aws_api_gateway_integration.lambda: Creation complete after 1s [id=agi-g3kzucoeb3-z5bpk3-POST]
aws_api_gateway_deployment.serverless: Creating...
aws_api_gateway_deployment.serverless: Creation complete after 0s [id=3i3vvj]
aws_api_gateway_usage_plan.serverless: Creating...
aws_api_gateway_usage_plan.serverless: Creation complete after 1s [id=er0htb]
aws_api_gateway_usage_plan_key.serverless: Creating...
aws_api_gateway_usage_plan_key.serverless: Creation complete after 0s [id=xthqswzh92]

Apply complete! Resources: 16 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path: ./terraform.tfstate

Outputs:

api_endpoint = https://g3kzucoeb3.execute-api.ap-southeast-2.amazonaws.com/serverless
api_key = YMODdWYUTQ9z5dayE3pzzavBGFHIPfOj5UNH4p5Q
make[1]: Leaving directory '/home/z/Desktop/Working (another copy)'
```
```
z@bacon:~/Desktop/Working (another copy)$ curl -v POST https://g3kzucoeb3.execute-api.ap-southeast-2.amazonaws.com/serverless/customers \
>   -d "{\"firstname\": \"Zara\", \"lastname\": \"Langston\", \"email\": \"zarajoy@outlook.com\"}" \
>   -H "x-api-key: YMODdWYUTQ9z5dayE3pzzavBGFHIPfOj5UNH4p5Q"

* Could not resolve host: POST
* Closing connection 0
curl: (6) Could not resolve host: POST
*   Trying 13.224.179.20:443...
* TCP_NODELAY set
* Connected to g3kzucoeb3.execute-api.ap-southeast-2.amazonaws.com (13.224.179.20) port 443 (#1)
* ALPN, offering h2
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*   CAfile: /etc/ssl/certs/ca-certificates.crt
  CApath: /etc/ssl/certs
* TLSv1.3 (OUT), TLS handshake, Client hello (1):
* TLSv1.3 (IN), TLS handshake, Server hello (2):
* TLSv1.3 (IN), TLS handshake, Encrypted Extensions (8):
* TLSv1.3 (IN), TLS handshake, Certificate (11):
* TLSv1.3 (IN), TLS handshake, CERT verify (15):
* TLSv1.3 (IN), TLS handshake, Finished (20):
* TLSv1.3 (OUT), TLS change cipher, Change cipher spec (1):
* TLSv1.3 (OUT), TLS handshake, Finished (20):
* SSL connection using TLSv1.3 / TLS_AES_128_GCM_SHA256
* ALPN, server accepted to use h2
* Server certificate:
*  subject: CN=*.execute-api.ap-southeast-2.amazonaws.com
*  start date: Jul  9 00:00:00 2020 GMT
*  expire date: Aug  9 12:00:00 2021 GMT
*  subjectAltName: host "g3kzucoeb3.execute-api.ap-southeast-2.amazonaws.com" matched cert's "*.execute-api.ap-southeast-2.amazonaws.com"
*  issuer: C=US; O=Amazon; OU=Server CA 1B; CN=Amazon
*  SSL certificate verify ok.
* Using HTTP2, server supports multi-use
* Connection state changed (HTTP/2 confirmed)
* Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
* Using Stream ID: 1 (easy handle 0x557f3770fdb0)
> POST /serverless/customers HTTP/2
> Host: g3kzucoeb3.execute-api.ap-southeast-2.amazonaws.com
> user-agent: curl/7.68.0
> accept: */*
> x-api-key: YMODdWYUTQ9z5dayE3pzzavBGFHIPfOj5UNH4p5Q
> content-length: 83
> content-type: application/x-www-form-urlencoded
> 
* We are completely uploaded and fine
* Connection state changed (MAX_CONCURRENT_STREAMS == 128)!
< HTTP/2 201 
< content-type: application/json
< content-length: 0
< date: Wed, 09 Sep 2020 03:01:49 GMT
< x-amzn-requestid: cb1b996d-d19b-453f-84ac-7f2a90bd3705
< x-amz-apigw-id: Sk_QWEwEywMFf3g=
< x-amzn-trace-id: Root=1-5f58459b-cf8cda3f339754051179c656;Sampled=0
< x-cache: Miss from cloudfront
< via: 1.1 31efcfadb9bf42888048a4e21662d761.cloudfront.net (CloudFront)
< x-amz-cf-pop: SYD1-C2
< x-amz-cf-id: K54lDb8jpfZC0B34nEnTSievFuoQtyiVZzR8MSnMK3D-rHaU09mmLQ==
< 
* Connection #1 to host g3kzucoeb3.execute-api.ap-southeast-2.amazonaws.com left intact
```
```
z@bacon:~/Desktop/Working (another copy)$ make wipe

docker-compose run --rm terraform destroy -auto-approve
aws_iam_role.lambda: Refreshing state... [id=c06-serverless01_lamda_function]
aws_kms_key.db_key: Refreshing state... [id=e24b1b14-03a8-47f0-89f0-da7f3e93bbce]
aws_api_gateway_api_key.key: Refreshing state... [id=xthqswzh92]
aws_api_gateway_rest_api.api: Refreshing state... [id=g3kzucoeb3]
data.aws_ssm_parameter.DB_NAME: Refreshing state...
aws_ssm_parameter.api_key: Refreshing state... [id=API_KEY]
aws_api_gateway_resource.customers: Refreshing state... [id=z5bpk3]
aws_api_gateway_method.customers: Refreshing state... [id=agm-g3kzucoeb3-z5bpk3-POST]
aws_dynamodb_table.DA_Serverless: Refreshing state... [id=DA_Serverless]
aws_iam_role_policy.lambda: Refreshing state... [id=c06-serverless01_lamda_function:lambda-dynamodb-c06-serverless01]
aws_kms_grant.lambda: Refreshing state... [id=e24b1b14-03a8-47f0-89f0-da7f3e93bbce:5cb3a1d66cf788173d882de7c6fa37a311518e3ae661ac0dc9e1e36e1e86e81c]
aws_lambda_function.lambda_function: Refreshing state... [id=c06-serverless01_lambda_function]
aws_lambda_permission.api: Refreshing state... [id=AllowApiInvoke]
aws_api_gateway_integration.lambda: Refreshing state... [id=agi-g3kzucoeb3-z5bpk3-POST]
aws_api_gateway_deployment.serverless: Refreshing state... [id=3i3vvj]
aws_api_gateway_usage_plan.serverless: Refreshing state... [id=er0htb]
aws_api_gateway_usage_plan_key.serverless: Refreshing state... [id=xthqswzh92]
aws_lambda_permission.api: Destroying... [id=AllowApiInvoke]
aws_api_gateway_usage_plan_key.serverless: Destroying... [id=xthqswzh92]
aws_iam_role_policy.lambda: Destroying... [id=c06-serverless01_lamda_function:lambda-dynamodb-c06-serverless01]
aws_ssm_parameter.api_key: Destroying... [id=API_KEY]
aws_kms_grant.lambda: Destroying... [id=e24b1b14-03a8-47f0-89f0-da7f3e93bbce:5cb3a1d66cf788173d882de7c6fa37a311518e3ae661ac0dc9e1e36e1e86e81c]
aws_ssm_parameter.api_key: Destruction complete after 0s
aws_lambda_permission.api: Destruction complete after 0s
aws_kms_grant.lambda: Destruction complete after 0s
aws_api_gateway_usage_plan_key.serverless: Destruction complete after 0s
aws_api_gateway_api_key.key: Destroying... [id=xthqswzh92]
aws_api_gateway_usage_plan.serverless: Destroying... [id=er0htb]
aws_api_gateway_api_key.key: Destruction complete after 0s
aws_iam_role_policy.lambda: Destruction complete after 1s
aws_dynamodb_table.DA_Serverless: Destroying... [id=DA_Serverless]
aws_api_gateway_usage_plan.serverless: Destruction complete after 1s
aws_api_gateway_deployment.serverless: Destroying... [id=3i3vvj]
aws_api_gateway_deployment.serverless: Destruction complete after 1s
aws_api_gateway_integration.lambda: Destroying... [id=agi-g3kzucoeb3-z5bpk3-POST]
aws_api_gateway_integration.lambda: Destruction complete after 0s
aws_api_gateway_method.customers: Destroying... [id=agm-g3kzucoeb3-z5bpk3-POST]
aws_lambda_function.lambda_function: Destroying... [id=c06-serverless01_lambda_function]
aws_api_gateway_method.customers: Destruction complete after 0s
aws_api_gateway_resource.customers: Destroying... [id=z5bpk3]
aws_api_gateway_resource.customers: Destruction complete after 0s
aws_api_gateway_rest_api.api: Destroying... [id=g3kzucoeb3]
aws_lambda_function.lambda_function: Destruction complete after 0s
aws_iam_role.lambda: Destroying... [id=c06-serverless01_lamda_function]
aws_api_gateway_rest_api.api: Destruction complete after 0s
aws_iam_role.lambda: Destruction complete after 2s
aws_dynamodb_table.DA_Serverless: Destruction complete after 7s
aws_kms_key.db_key: Destroying... [id=e24b1b14-03a8-47f0-89f0-da7f3e93bbce]
aws_kms_key.db_key: Destruction complete after 0s

Destroy complete! Resources: 16 destroyed.

```
<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c06-serverless01](https://github.com/devopsacademyau/academy/blob/cdbf8008dd42eacd5aa6f43f66b152e8f91d0e78/classes/06class/exercises/c06-serverless01/README.md)