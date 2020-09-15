# Below are the steps to create Serverless Infrastructure

      1. Make sure the .env file has proper ACCESS_KEY_ID and SECRET_ACCESS_KEY values

      2. Run below commands to bring the application.
         make deploy
         cd terraform; terraform init; terraform plan -out c06_serverless_01.tfplan 		

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
        + stage_name    = "test"
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
            + stage  = "test"
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
            + "Name" = "serverless_06-dynamodb"
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
        + filename                       = "lambda.zip"
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
        + source_code_hash               = "FSC40nvosJuIdh+6pQCPfW3w1kF3Um8c8+gxNbuitTQ="
        + source_code_size               = (known after apply)
        + tags                           = {
            + "Name" = "serverless_06-lamda"
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
           + "Name" = "serverless_06-ssm"
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
            + "Name" = "serverless_06-ssm"
          }
        + tier    = "Standard"
        + type    = "String"
        + value   = (sensitive value)
        + version = (known after apply)
      }

    Plan: 19 to add, 0 to change, 0 to destroy.

    ------------------------------------------------------------------------
  
    This plan was saved to: c06_serverless_01.tfplan
    
    To perform exactly these actions, run the following command to apply:
        terraform apply "c06_serverless_01.tfplan"
  
    cd terraform; terraform apply c06_serverless_01.tfplan;
    aws_api_gateway_api_key.this: Creating...
    aws_kms_key.encryption: Creating...
    aws_ssm_parameter.db_name: Creating...
    aws_iam_role.iam_for_lambda: Creating...
    aws_api_gateway_rest_api.customer: Creating...
    aws_api_gateway_api_key.this: Creation complete after 0s [id=gsgowaqmg3]
    aws_ssm_parameter.api_key: Creating...
    aws_api_gateway_rest_api.customer: Creation complete after 0s [id=33ndu4ee8k]
    aws_api_gateway_resource.customer: Creating...
    aws_ssm_parameter.db_name: Creation complete after 1s [id=dbname]
    aws_api_gateway_resource.customer: Creation complete after 1s [id=2ov4fq]
    aws_api_gateway_method.customer: Creating...
    aws_kms_key.encryption: Creation complete after 1s [id=e9f6b2af-7a0b-46c8-b21c-4d6e31fc3869]
    aws_dynamodb_table.da_serverless: Creating...
    aws_api_gateway_method.customer: Creation complete after 0s [id=agm-33ndu4ee8k-2ov4fq-POST]
    aws_ssm_parameter.api_key: Creation complete after 1s [id=apikey]
    aws_iam_role.iam_for_lambda: Creation complete after 2s [id=iam_for_lambda]
    aws_iam_role_policy.cloudwatch: Creating...
    aws_kms_grant.this: Creating...
    aws_lambda_function.da_create_customer: Creating...
    aws_iam_role_policy.cloudwatch: Creation complete after 2s [id=iam_for_lambda:lambda_cloudwatch_iam]
    aws_dynamodb_table.da_serverless: Creation complete after 8s [id=DA_Serverless]
    aws_iam_role_policy.dynamodb: Creating...
    aws_kms_grant.this: Creation complete after 9s [id=e9f6b2af-7a0b-46c8-b21c-4d6e31fc3869:de99cfd3443d841d719d4c7248d88506c3ebbad1dd1e8f289600b2b8aac8ab5e]
    aws_iam_role_policy.dynamodb: Creation complete after 2s [id=iam_for_lambda:dynamo_db_iam]
    aws_lambda_function.da_create_customer: Still creating... [10s elapsed]
    aws_lambda_function.da_create_customer: Still creating... [20s elapsed]
    aws_lambda_function.da_create_customer: Creation complete after 23s [id=da_create_customer_function]
    aws_lambda_permission.customerapigw: Creating...
    aws_api_gateway_integration.customer: Creating...
    aws_cloudwatch_log_group.customer: Creating...
    aws_lambda_permission.customerapigw: Creation complete after 0s [id=AllowAPIGatewayInvoke]
    aws_api_gateway_integration.customer: Creation complete after 0s [id=agi-33ndu4ee8k-2ov4fq-POST]
    aws_api_gateway_deployment.customer: Creating...
    aws_api_gateway_deployment.customer: Creation complete after 1s [id=8rkjgz]
    aws_api_gateway_usage_plan.this: Creating...
    aws_api_gateway_usage_plan.this: Creation complete after 1s [id=ike1sm]
    aws_api_gateway_usage_plan_key.this: Creating...
    aws_cloudwatch_log_group.customer: Creation complete after 2s [id=/aws/lambda/da_create_customer_function]
    aws_api_gateway_usage_plan_key.this: Creation complete after 1s [id=gsgowaqmg3]

    Apply complete! Resources: 19 added, 0 changed, 0 destroyed.

    The state of your infrastructure has been saved to the path
    below. This state is required to modify and destroy your
    infrastructure, so keep it safe. To inspect the complete state
    use the `terraform show` command.

    State path: terraform.tfstate

    Outputs:
        api_endpoint = https://33ndu4ee8k.execute-api.ap-southeast-2.amazonaws.com/test
        api_key = 8L0ySKj1yI82LDDMPQzPlshOyGmNZeh7Ffb7uaW3
        api_path = /customers
     
    3. Verify Application built by adding an item to DynamoDB through API Gateway
       curl -v --request POST 'https://kxvan3zgik.execute-api.ap-southeast-2.amazonaws.com/test/customers' --header 'Content-Type: application/json' --header "x-api-key: Jf65mYBKen2IKoNckN2323QdEOwr6JvZ1eFXXJWG" --data-raw '{"firstname": "Maya", "lastname": "Vj", "email": "mayavj@y.com"}'
 
     Note: Unnecessary use of -X or --request, POST is already inferred.
     *   Trying 13.35.145.58...
     * TCP_NODELAY set
     * Connected to kxvan3zgik.execute-api.ap-southeast-2.amazonaws.com (13.35.145.58) port 443 (#0)
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
     *  subjectAltName: host "kxvan3zgik.execute-api.ap-southeast-2.amazonaws.com" matched cert's "*.execute-api.ap-southeast-2.amazonaws.com"
     *  issuer: C=US; O=Amazon; OU=Server CA 1B; CN=Amazon
     *  SSL certificate verify ok.
     * Using HTTP2, server supports multi-use
     * Connection state changed (HTTP/2 confirmed)
     * Copying HTTP/2 data in stream buffer to connection buffer after upgrade: len=0
     * Using Stream ID: 1 (easy handle 0x7fd333809800)
     > POST /test/customers HTTP/2
     > Host: kxvan3zgik.execute-api.ap-southeast-2.amazonaws.com
     > User-Agent: curl/7.64.1
     > Accept: */*
     > Content-Type: application/json
     > x-api-key: Jf65mYBKen2IKoNckN2323QdEOwr6JvZ1eFXXJWG
     > Content-Length: 64
     > 
     * Connection state changed (MAX_CONCURRENT_STREAMS == 128)!
     * We are completely uploaded and fine
     < HTTP/2 201 
     < content-type: application/json
     < content-length: 0
     < date: Tue, 15 Sep 2020 01:57:09 GMT
     < x-amzn-requestid: 04f98234-9c7b-41e9-aba8-feb140942b9f
     < x-amz-apigw-id: S4naIHfqywMFttQ=
     < x-amzn-trace-id: Root=1-5f601f73-14cb08c29b10b23d6bdcd221;Sampled=0
     < x-cache: Miss from cloudfront
     < via: 1.1 49a6e32d0e77764a9e697970808fdae9.cloudfront.net (CloudFront)
     < x-amz-cf-pop: SYD1-C1
     < x-amz-cf-id: Ep9_y229k1lBW_QR5jk-EevRR0spoHtWwOpPpfX_QlfpgkjKMYWN4A==
     < 
     * Connection #0 to host kxvan3zgik.execute-api.ap-southeast-2.amazonaws.com left intact
     * Closing connection 0 

    4. Once the application verification is done, cleanup the application by executing
       make clean
       cd terraform; terraform destroy -auto-approve;
       aws_api_gateway_api_key.this: Refreshing state... [id=gsgowaqmg3]
       aws_iam_role.iam_for_lambda: Refreshing state... [id=iam_for_lambda]
       aws_kms_key.encryption: Refreshing state... [id=e9f6b2af-7a0b-46c8-b21c-4d6e31fc3869]
       data.aws_ssm_parameter.db_name: Refreshing state...
       aws_ssm_parameter.db_name: Refreshing state... [id=dbname]
       aws_api_gateway_rest_api.customer: Refreshing state... [id=33ndu4ee8k]
       aws_ssm_parameter.api_key: Refreshing state... [id=apikey]
       aws_api_gateway_resource.customer: Refreshing state... [id=2ov4fq]
       aws_api_gateway_method.customer: Refreshing state... [id=agm-33ndu4ee8k-2ov4fq-POST]
       aws_dynamodb_table.da_serverless: Refreshing state... [id=DA_Serverless]
       aws_iam_role_policy.cloudwatch: Refreshing state... [id=iam_for_lambda:lambda_cloudwatch_iam]
       aws_kms_grant.this: Refreshing state... [id=e9f6b2af-7a0b-46c8-b21c-4d6e31fc3869:de99cfd3443d841d719d4c7248d88506c3ebbad1dd1e8f289600b2b8aac8ab5e]
       aws_lambda_function.da_create_customer: Refreshing state... [id=da_create_customer_function]
       aws_cloudwatch_log_group.customer: Refreshing state... [id=/aws/lambda/da_create_customer_function]
       aws_lambda_permission.customerapigw: Refreshing state... [id=AllowAPIGatewayInvoke]
       aws_api_gateway_integration.customer: Refreshing state... [id=agi-33ndu4ee8k-2ov4fq-POST]
       aws_api_gateway_deployment.customer: Refreshing state... [id=8rkjgz]
       aws_iam_role_policy.dynamodb: Refreshing state... [id=iam_for_lambda:dynamo_db_iam]
       aws_api_gateway_usage_plan.this: Refreshing state... [id=ike1sm]
       aws_api_gateway_usage_plan_key.this: Refreshing state... [id=gsgowaqmg3]
       aws_iam_role_policy.dynamodb: Destroying... [id=iam_for_lambda:dynamo_db_iam]
       aws_cloudwatch_log_group.customer: Destroying... [id=/aws/lambda/da_create_customer_function]
       aws_api_gateway_usage_plan_key.this: Destroying... [id=gsgowaqmg3]
       aws_iam_role_policy.cloudwatch: Destroying... [id=iam_for_lambda:lambda_cloudwatch_iam]
       aws_lambda_permission.customerapigw: Destroying... [id=AllowAPIGatewayInvoke]
       aws_ssm_parameter.api_key: Destroying... [id=apikey]
       aws_kms_grant.this: Destroying... [id=e9f6b2af-7a0b-46c8-b21c-4d6e31fc3869:de99cfd3443d841d719d4c7248d88506c3ebbad1dd1e8f289600b2b8aac8ab5e]
       aws_ssm_parameter.db_name: Destroying... [id=dbname]
       aws_cloudwatch_log_group.customer: Destruction complete after 0s
       aws_ssm_parameter.api_key: Destruction complete after 0s
       aws_ssm_parameter.db_name: Destruction complete after 0s
       aws_kms_grant.this: Destruction complete after 0s
       aws_lambda_permission.customerapigw: Destruction complete after 0s
       aws_api_gateway_usage_plan_key.this: Destruction complete after 0s
       aws_api_gateway_api_key.this: Destroying... [id=gsgowaqmg3]
       aws_api_gateway_usage_plan.this: Destroying... [id=ike1sm]
       aws_api_gateway_api_key.this: Destruction complete after 1s
       aws_iam_role_policy.cloudwatch: Destruction complete after 1s
       aws_iam_role_policy.dynamodb: Destruction complete after 1s
       aws_dynamodb_table.da_serverless: Destroying... [id=DA_Serverless]
       aws_api_gateway_usage_plan.this: Destruction complete after 1s
       aws_api_gateway_deployment.customer: Destroying... [id=8rkjgz]
       aws_api_gateway_deployment.customer: Destruction complete after 1s
       aws_api_gateway_integration.customer: Destroying... [id=agi-33ndu4ee8k-2ov4fq-POST]
       aws_api_gateway_integration.customer: Destruction complete after 0s
       aws_api_gateway_method.customer: Destroying... [id=agm-33ndu4ee8k-2ov4fq-POST]
       aws_lambda_function.da_create_customer: Destroying... [id=da_create_customer_function]
       aws_api_gateway_method.customer: Destruction complete after 0s
       aws_api_gateway_resource.customer: Destroying... [id=2ov4fq]
       aws_lambda_function.da_create_customer: Destruction complete after 0s
       aws_iam_role.iam_for_lambda: Destroying... [id=iam_for_lambda]
       aws_api_gateway_resource.customer: Destruction complete after 0s
       aws_api_gateway_rest_api.customer: Destroying... [id=33ndu4ee8k]
       aws_api_gateway_rest_api.customer: Destruction complete after 1s
       aws_iam_role.iam_for_lambda: Destruction complete after 2s
       aws_dynamodb_table.da_serverless: Destruction complete after 7s
       aws_kms_key.encryption: Destroying... [id=e9f6b2af-7a0b-46c8-b21c-4d6e31fc3869]
        aws_kms_key.encryption: Destruction complete after 0s
