### Deploy Serverless infra
> make deploy
docker-compose run --rm shell make _buildzip
mkdir terraform/lamda_zip;cd python;zip ../terraform/lamda_zip/report_photos_count.zip report_photos_count.py;zip ../terraform/lamda_zip/customer_handler.zip customer_handler.py;zip ../terraform/lamda_zip/photo_handler.zip photo_handler.py;
  adding: report_photos_count.py (deflated 55%)
  adding: customer_handler.py (deflated 67%)
  adding: photo_handler.py (deflated 61%)
docker-compose run --rm shell  aws ssm put-parameter \
    --name "DB_NAME" \
    --type "String" \
    --value DA_Serverless \
    --overwrite
{
    "Version": 64,
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

  # aws_cloudwatch_log_group.photo will be created
  + resource "aws_cloudwatch_log_group" "photo" {
      + arn               = (known after apply)
      + id                = (known after apply)
      + name              = "/aws/lambda/da_photo_handler"
      + retention_in_days = 1
    }

  # aws_cloudwatch_log_group.report_count will be created
  + resource "aws_cloudwatch_log_group" "report_count" {
      + arn               = (known after apply)
      + id                = (known after apply)
      + name              = "/aws/lambda/report_photos_count"
      + retention_in_days = 1
    }

  # aws_dynamodb_table.da_serverless will be created
  + resource "aws_dynamodb_table" "da_serverless" {
      + arn              = (known after apply)
      + billing_mode     = "PAY_PER_REQUEST"
      + hash_key         = "email"
      + id               = (known after apply)
      + name             = "DA_Serverless"
      + stream_arn       = (known after apply)
      + stream_enabled   = true
      + stream_label     = (known after apply)
      + stream_view_type = "NEW_IMAGE"
      + tags             = {
          + "Name" = "da_c06_serverless-dynamodb"
        }

      + attribute {
          + name = "email"
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

  # aws_iam_role_policy.dynamodbstream will be created
  + resource "aws_iam_role_policy" "dynamodbstream" {
      + id     = (known after apply)
      + name   = "dynamo_stream_iam"
      + policy = (known after apply)
      + role   = (known after apply)
    }

  # aws_iam_role_policy.ses will be created
  + resource "aws_iam_role_policy" "ses" {
      + id     = (known after apply)
      + name   = "lambda_ses_iam"
      + policy = jsonencode(
            {
              + Statement = [
                  + {
                      + Action   = [
                          + "ses:SendEmail",
                          + "ses:SendRawEmail",
                        ]
                      + Effect   = "Allow"
                      + Resource = "*"
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + role   = (known after apply)
    }

  # aws_iam_role_policy.sns will be created
  + resource "aws_iam_role_policy" "sns" {
      + id     = (known after apply)
      + name   = "lambda_sns_iam"
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

  # aws_lambda_event_source_mapping.this will be created
  + resource "aws_lambda_event_source_mapping" "this" {
      + enabled                       = true
      + event_source_arn              = (known after apply)
      + function_arn                  = (known after apply)
      + function_name                 = (known after apply)
      + id                            = (known after apply)
      + last_modified                 = (known after apply)
      + last_processing_result        = (known after apply)
      + maximum_record_age_in_seconds = (known after apply)
      + maximum_retry_attempts        = (known after apply)
      + parallelization_factor        = (known after apply)
      + starting_position             = "LATEST"
      + state                         = (known after apply)
      + state_transition_reason       = (known after apply)
      + uuid                          = (known after apply)
    }

  # aws_lambda_function.da_create_customer will be created
  + resource "aws_lambda_function" "da_create_customer" {
      + arn                            = (known after apply)
      + filename                       = "lamda_zip/customer_handler.zip"
      + function_name                  = "da_create_customer_function"
      + handler                        = "customer_handler.customer_handler"
      + id                             = (known after apply)
      + invoke_arn                     = (known after apply)
      + last_modified                  = (known after apply)
      + memory_size                    = 128
      + publish                        = false
      + qualified_arn                  = (known after apply)
      + reserved_concurrent_executions = -1
      + role                           = (known after apply)
      + runtime                        = "python3.8"
      + source_code_hash               = "jGd+G+1TFqCv+eVz2DJWmjl5096bKhKRlQ10VdK9zaU="
      + source_code_size               = (known after apply)
      + tags                           = {
          + "Name" = "da_c06_serverless-createcustomer-lamda"
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

  # aws_lambda_function.da_upload_photo will be created
  + resource "aws_lambda_function" "da_upload_photo" {
      + arn                            = (known after apply)
      + filename                       = "lamda_zip/photo_handler.zip"
      + function_name                  = "da_photo_handler"
      + handler                        = "photo_handler.photo_handler"
      + id                             = (known after apply)
      + invoke_arn                     = (known after apply)
      + last_modified                  = (known after apply)
      + memory_size                    = 128
      + publish                        = false
      + qualified_arn                  = (known after apply)
      + reserved_concurrent_executions = -1
      + role                           = (known after apply)
      + runtime                        = "python3.8"
      + source_code_hash               = "2up/Z9fVLc3ME5THTR85G5+KYOr0b8/3jGJ+p6mABog="
      + source_code_size               = (known after apply)
      + tags                           = {
          + "Name" = "da_c06_serverless-photo-handler-lamda"
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

  # aws_lambda_function.report_count_lamda will be created
  + resource "aws_lambda_function" "report_count_lamda" {
      + arn                            = (known after apply)
      + filename                       = "lamda_zip/report_photos_count.zip"
      + function_name                  = "report_photos_count"
      + handler                        = "report_photos_count.report_photos_count"
      + id                             = (known after apply)
      + invoke_arn                     = (known after apply)
      + last_modified                  = (known after apply)
      + memory_size                    = 128
      + publish                        = false
      + qualified_arn                  = (known after apply)
      + reserved_concurrent_executions = -1
      + role                           = (known after apply)
      + runtime                        = "python3.8"
      + source_code_hash               = "VMpB78us5bgtgtTB0syY7oJfwiSve8W7kwezfu9gjnM="
      + source_code_size               = (known after apply)
      + tags                           = {
          + "Name" = "da_c06_serverless-report-count-handler-lamda"
        }
      + timeout                        = 3
      + version                        = (known after apply)

      + environment {
          + variables = (known after apply)
        }

      + tracing_config {
          + mode = (known after apply)
        }
    }

  # aws_lambda_permission.allow_s3_bucket will be created
  + resource "aws_lambda_permission" "allow_s3_bucket" {
      + action        = "lambda:InvokeFunction"
      + function_name = "da_photo_handler"
      + id            = (known after apply)
      + principal     = "s3.amazonaws.com"
      + source_arn    = (known after apply)
      + statement_id  = "AllowExecutionFromS3Bucket"
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

  # aws_s3_bucket.da_photo will be created
  + resource "aws_s3_bucket" "da_photo" {
      + acceleration_status         = (known after apply)
      + acl                         = "private"
      + arn                         = (known after apply)
      + bucket                      = "raghunadhpokkalath-da-photo"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = true
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }
    }

  # aws_s3_bucket_notification.s3_lamda_notifcation will be created
  + resource "aws_s3_bucket_notification" "s3_lamda_notifcation" {
      + bucket = (known after apply)
      + id     = (known after apply)

      + lambda_function {
          + events              = [
              + "s3:ObjectCreated:*",
            ]
          + id                  = (known after apply)
          + lambda_function_arn = (known after apply)
        }
    }

  # aws_ses_email_identity.from will be created
  + resource "aws_ses_email_identity" "from" {
      + arn   = (known after apply)
      + email = "raghunadhpokkalath@gmail.com"
      + id    = (known after apply)
    }

  # aws_ses_email_identity.to will be created
  + resource "aws_ses_email_identity" "to" {
      + arn   = (known after apply)
      + email = "raghunadhp@gmail.com"
      + id    = (known after apply)
    }

  # aws_sns_topic.this will be created
  + resource "aws_sns_topic" "this" {
      + arn    = (known after apply)
      + id     = (known after apply)
      + name   = "ReportCount"
      + policy = (known after apply)
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

Plan: 33 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

This plan was saved to: serverless_06_01

To perform exactly these actions, run the following command to apply:
    terraform apply "serverless_06_01"

docker-compose run --rm shell make _deploy
cd terraform; terraform apply serverless_06_01;
aws_sns_topic.this: Creating...
aws_ses_email_identity.to: Creating...
aws_iam_role.iam_for_lambda: Creating...
aws_ses_email_identity.from: Creating...
aws_api_gateway_api_key.this: Creating...
aws_ssm_parameter.db_name: Creating...
aws_kms_key.encryption: Creating...
aws_api_gateway_rest_api.customer: Creating...
aws_s3_bucket.da_photo: Creating...
aws_ssm_parameter.db_name: Creation complete after 1s [id=dbname]
aws_api_gateway_api_key.this: Creation complete after 1s [id=9ww8ag9vsi]
aws_ssm_parameter.api_key: Creating...
aws_ses_email_identity.to: Creation complete after 1s [id=raghunadhp@gmail.com]
aws_ses_email_identity.from: Creation complete after 1s [id=raghunadhpokkalath@gmail.com]
aws_api_gateway_rest_api.customer: Creation complete after 1s [id=op7mxu1dsd]
aws_api_gateway_resource.customer: Creating...
aws_kms_key.encryption: Creation complete after 1s [id=1056988c-c235-487a-90e1-a05096cec506]
aws_dynamodb_table.da_serverless: Creating...
aws_sns_topic.this: Provisioning with 'local-exec'...
aws_sns_topic.this (local-exec): Executing: ["/bin/sh" "-c" "sh scripts/snssubscribe.sh"]
aws_sns_topic.this (local-exec): raghunadhp@gmail.com
aws_api_gateway_resource.customer: Creation complete after 0s [id=vp3ch0]
aws_api_gateway_method.customer: Creating...
aws_ssm_parameter.api_key: Creation complete after 1s [id=apikey]
aws_api_gateway_method.customer: Creation complete after 1s [id=agm-op7mxu1dsd-vp3ch0-POST]
aws_sns_topic.this (local-exec): {
aws_sns_topic.this (local-exec):     "SubscriptionArn": "pending confirmation"
aws_sns_topic.this (local-exec): }
aws_iam_role.iam_for_lambda: Creation complete after 2s [id=iam_for_lambda]
aws_iam_role_policy.cloudwatch: Creating...
aws_iam_role_policy.ses: Creating...
aws_kms_grant.this: Creating...
aws_lambda_function.da_create_customer: Creating...
aws_lambda_function.da_upload_photo: Creating...
aws_sns_topic.this: Creation complete after 3s [id=arn:aws:sns:ap-southeast-2:230681605246:ReportCount]
aws_iam_role_policy.sns: Creating...
aws_lambda_function.report_count_lamda: Creating...
aws_s3_bucket.da_photo: Creation complete after 4s [id=raghunadhpokkalath-da-photo]
aws_iam_role_policy.cloudwatch: Creation complete after 3s [id=iam_for_lambda:lambda_cloudwatch_iam]
aws_iam_role_policy.sns: Creation complete after 2s [id=iam_for_lambda:lambda_sns_iam]
aws_iam_role_policy.ses: Creation complete after 3s [id=iam_for_lambda:lambda_ses_iam]
aws_dynamodb_table.da_serverless: Creation complete after 8s [id=DA_Serverless]
aws_iam_role_policy.dynamodb: Creating...
aws_iam_role_policy.dynamodbstream: Creating...
aws_kms_grant.this: Creation complete after 8s [id=1056988c-c235-487a-90e1-a05096cec506:3e19cd3f46a4669c8a61b3bf23cb61a8ad6c37129396045d06772f7806bb696d]
aws_iam_role_policy.dynamodbstream: Creation complete after 3s [id=iam_for_lambda:dynamo_stream_iam]
aws_iam_role_policy.dynamodb: Creation complete after 3s [id=iam_for_lambda:dynamo_db_iam]
aws_lambda_function.da_create_customer: Still creating... [9s elapsed]
aws_lambda_function.da_upload_photo: Still creating... [9s elapsed]
aws_lambda_function.report_count_lamda: Still creating... [10s elapsed]
aws_lambda_function.da_create_customer: Still creating... [19s elapsed]
aws_lambda_function.da_upload_photo: Still creating... [20s elapsed]
aws_lambda_function.report_count_lamda: Still creating... [20s elapsed]
aws_lambda_function.da_create_customer: Creation complete after 22s [id=da_create_customer_function]
aws_lambda_permission.customerapigw: Creating...
aws_cloudwatch_log_group.customer: Creating...
aws_api_gateway_integration.customer: Creating...
aws_lambda_permission.customerapigw: Creation complete after 0s [id=AllowAPIGatewayInvoke]
aws_api_gateway_integration.customer: Creation complete after 0s [id=agi-op7mxu1dsd-vp3ch0-POST]
aws_api_gateway_deployment.customer: Creating...
aws_api_gateway_deployment.customer: Creation complete after 2s [id=2zjuy1]
aws_api_gateway_usage_plan.this: Creating...
aws_cloudwatch_log_group.customer: Creation complete after 2s [id=/aws/lambda/da_create_customer_function]
aws_api_gateway_usage_plan.this: Creation complete after 1s [id=nnm50c]
aws_api_gateway_usage_plan_key.this: Creating...
aws_api_gateway_usage_plan_key.this: Creation complete after 1s [id=9ww8ag9vsi]
aws_lambda_function.da_upload_photo: Creation complete after 28s [id=da_photo_handler]
aws_lambda_permission.allow_s3_bucket: Creating...
aws_cloudwatch_log_group.photo: Creating...
aws_s3_bucket_notification.s3_lamda_notifcation: Creating...
aws_lambda_permission.allow_s3_bucket: Creation complete after 0s [id=AllowExecutionFromS3Bucket]
aws_cloudwatch_log_group.photo: Creation complete after 0s [id=/aws/lambda/da_photo_handler]
aws_s3_bucket_notification.s3_lamda_notifcation: Creation complete after 1s [id=raghunadhpokkalath-da-photo]
aws_lambda_function.report_count_lamda: Still creating... [30s elapsed]
aws_lambda_function.report_count_lamda: Creation complete after 34s [id=report_photos_count]
aws_cloudwatch_log_group.report_count: Creating...
aws_lambda_event_source_mapping.this: Creating...
aws_cloudwatch_log_group.report_count: Creation complete after 0s [id=/aws/lambda/report_photos_count]
aws_lambda_event_source_mapping.this: Creation complete after 0s [id=4eaeb089-3b46-4814-88f4-df1f0ccbd75e]

Apply complete! Resources: 33 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path: terraform.tfstate

Outputs:

api_endpoint = https://op7mxu1dsd.execute-api.ap-southeast-2.amazonaws.com/v1
api_key = 83X6hqMoYS7CpVAEjWV3A3FCeZqTWs5HhDh1uHqb