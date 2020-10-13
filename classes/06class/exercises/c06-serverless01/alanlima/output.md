```bash
$ make kick-n-run
make[1]: Entering directory '/home/alima/projects/github/devops-academy/classes/06class/exercises/c06-serverless01/alanlima'

Initializing the backend...

Initializing provider plugins...
- Using previously-installed hashicorp/aws v3.4.0

Terraform has been successfully initialized!
  adding: main.py (deflated 67%)
data.aws_caller_identity.current: Refreshing state...
aws_iam_policy.apigw: Creating...
aws_api_gateway_api_key.default: Creating...
aws_iam_role.lambda: Creating...
aws_api_gateway_rest_api.this: Creating...
aws_iam_role.apigw: Creating...
aws_ssm_parameter.db_name: Creating...
aws_kms_key.this: Creating...
aws_api_gateway_api_key.default: Creation complete after 1s [id=n1apjpnd4e]
aws_ssm_parameter.api_key: Creating...
aws_api_gateway_rest_api.this: Creation complete after 1s [id=thq85cqumh]
aws_api_gateway_resource.customers: Creating...
aws_kms_key.this: Creation complete after 1s [id=bce4f651-696e-4121-b059-7bdfd51e8d04]
aws_ssm_parameter.db_name: Creation complete after 1s [id=/devops_serverless01/DB_NAME]
aws_dynamodb_table.this: Creating...
aws_api_gateway_resource.customers: Creation complete after 1s [id=nzknhh]
aws_api_gateway_method.customers: Creating...
aws_api_gateway_method.customers: Creation complete after 0s [id=agm-thq85cqumh-nzknhh-ANY]
aws_ssm_parameter.api_key: Creation complete after 1s [id=/devops_serverless01/API_KEY]
aws_iam_role.lambda: Creation complete after 3s [id=devops_serverless01_lambda_role]
aws_iam_role.apigw: Creation complete after 3s [id=devops_serverless01_apigw_lambda_role]
aws_api_gateway_account.default: Creating...
aws_iam_policy.apigw: Creation complete after 4s [id=arn:aws:iam::097922957316:policy/devops_serverless01_apigw_lambda_policy]
aws_iam_role_policy_attachment.apigw: Creating...
aws_iam_role_policy_attachment.apigw: Creation complete after 2s [id=devops_serverless01_apigw_lambda_role-20200901100357099900000001]
aws_dynamodb_table.this: Creation complete after 8s [id=DA_Serverless]
aws_iam_policy.lambda: Creating...
aws_api_gateway_account.default: Still creating... [10s elapsed]
aws_iam_policy.lambda: Creation complete after 5s [id=arn:aws:iam::097922957316:policy/devops_serverless01_lambda_policy]
aws_iam_role_policy_attachment.lambda: Creating...
aws_iam_role_policy_attachment.lambda: Creation complete after 2s [id=devops_serverless01_lambda_role-20200901100406867600000002]
aws_lambda_function.this: Creating...
aws_lambda_function.this: Creation complete after 6s [id=func_customers]
aws_cloudwatch_log_group.lambda: Creating...
aws_api_gateway_integration.lambda: Creating...
aws_lambda_permission.apigw: Creating...
aws_lambda_permission.apigw: Creation complete after 1s [id=AllowAPIGatewayInvoke]
aws_api_gateway_account.default: Still creating... [20s elapsed]
aws_api_gateway_integration.lambda: Creation complete after 1s [id=agi-thq85cqumh-nzknhh-ANY]
aws_api_gateway_deployment.prod: Creating...
aws_cloudwatch_log_group.lambda: Creation complete after 1s [id=/aws/lambda/func_customers]
aws_api_gateway_deployment.prod: Creation complete after 0s [id=do3d50]
aws_api_gateway_usage_plan.standard: Creating...
aws_api_gateway_method_settings.default: Creating...
aws_api_gateway_method_settings.default: Creation complete after 1s [id=thq85cqumh-prod-*/*]
aws_api_gateway_usage_plan.standard: Creation complete after 1s [id=bb9tom]
aws_api_gateway_usage_plan_key.main: Creating...
aws_api_gateway_usage_plan_key.main: Creation complete after 1s [id=n1apjpnd4e]
aws_api_gateway_account.default: Creation complete after 27s [id=api-gateway-account]

Apply complete! Resources: 23 added, 0 changed, 0 destroyed.

Outputs:

api_key = vxXt4Ut1Xt4E2hesGZ0Zn6CawannNh6z67shWlxl
api_url = https://thq85cqumh.execute-api.ap-southeast-2.amazonaws.com/prod
lambda_invoke_arn = arn:aws:apigateway:ap-southeast-2:lambda:path/2015-03-31/functions/arn:aws:lambda:ap-southeast-2:097922957316:function:func_customers/invocations
make[1]: Leaving directory '/home/alima/projects/github/devops-academy/classes/06class/exercises/c06-serverless01/alanlima'
Waiting the provision of all services
Waiting for lambda
Sleep time

Creating new customer... 

make[1]: Entering directory '/home/alima/projects/github/devops-academy/classes/06class/exercises/c06-serverless01/alanlima'
Running cURL command: curl -v -POST -H "X-API-Key: vxXt4Ut1Xt4E2hesGZ0Zn6CawannNh6z67shWlxl" -H "Content-type: application/json" --url "https://thq85cqumh.execute-api.ap-southeast-2.amazonaws.com/prod/customers" -d '{ "firstname": "Linus", "lastname": "Torvalds", "email": "fake@mail.com" }'
*   Trying 13.224.179.88:443...
* Connected to thq85cqumh.execute-api.ap-southeast-2.amazonaws.com (13.224.179.88) port 443 (#0)
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*   CAfile: /home/linuxbrew/.linuxbrew/etc/openssl@1.1/cert.pem
  CApath: /home/linuxbrew/.linuxbrew/etc/openssl@1.1/certs
* TLSv1.3 (OUT), TLS handshake, Client hello (1):
* TLSv1.3 (IN), TLS handshake, Server hello (2):
* TLSv1.2 (IN), TLS handshake, Certificate (11):
* TLSv1.2 (IN), TLS handshake, Server key exchange (12):
* TLSv1.2 (IN), TLS handshake, Server finished (14):
* TLSv1.2 (OUT), TLS handshake, Client key exchange (16):
* TLSv1.2 (OUT), TLS change cipher, Change cipher spec (1):
* TLSv1.2 (OUT), TLS handshake, Finished (20):
* TLSv1.2 (IN), TLS handshake, Finished (20):
* SSL connection using TLSv1.2 / ECDHE-RSA-AES128-GCM-SHA256
* ALPN, server accepted to use http/1.1
* Server certificate:
*  subject: CN=*.execute-api.ap-southeast-2.amazonaws.com
*  start date: Jul  9 00:00:00 2020 GMT
*  expire date: Aug  9 12:00:00 2021 GMT
*  subjectAltName: host "thq85cqumh.execute-api.ap-southeast-2.amazonaws.com" matched cert's "*.execute-api.ap-southeast-2.amazonaws.com"
*  issuer: C=US; O=Amazon; OU=Server CA 1B; CN=Amazon
*  SSL certificate verify ok.
> POST /prod/customers HTTP/1.1
> Host: thq85cqumh.execute-api.ap-southeast-2.amazonaws.com
> User-Agent: curl/7.72.0
> Accept: */*
> X-API-Key: vxXt4Ut1Xt4E2hesGZ0Zn6CawannNh6z67shWlxl
> Content-type: application/json
> Content-Length: 74
> 
* upload completely sent off: 74 out of 74 bytes
* Mark bundle as not supporting multiuse
< HTTP/1.1 201 Created
< Content-Type: application/json
< Content-Length: 0
< Connection: keep-alive
< Date: Tue, 01 Sep 2020 10:09:35 GMT
< x-amzn-RequestId: 189a2737-22d3-4c68-b7e6-f23147c49a23
< x-amz-apigw-id: SLmapFEYSwMF-LQ=
< X-Amzn-Trace-Id: Root=1-5f4e1ddd-6d29844a038b0b5381607a73;Sampled=0
< X-Cache: Miss from cloudfront
< Via: 1.1 e3cb2b95dc77970fa884677fa82b833f.cloudfront.net (CloudFront)
< X-Amz-Cf-Pop: SYD1-C2
< X-Amz-Cf-Id: TzmR-mOivZe232GOo9HPzSVlvUKxStTtqzKnXunEEsTo5p7uQF0lbQ==
< 
* Connection #0 to host thq85cqumh.execute-api.ap-southeast-2.amazonaws.com left intact
make[1]: Leaving directory '/home/alima/projects/github/devops-academy/classes/06class/exercises/c06-serverless01/alanlima'

 Listing table content 

make[1]: Entering directory '/home/alima/projects/github/devops-academy/classes/06class/exercises/c06-serverless01/alanlima'
[
  {
    "id": "95dfbbce-f5ad-43a5-a42c-a820821c5009",
    "firstname": "Linus",
    "lastname": "Torvalds",
    "email": "fake@mail.com",
    "created_at": "2020-09-01T10:09:35.259796Z"
  }
]
make[1]: Leaving directory '/home/alima/projects/github/devops-academy/classes/06class/exercises/c06-serverless01/alanlima'
```