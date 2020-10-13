#STEP1: Create API Gateway API
resource "aws_api_gateway_rest_api" "customer" {
   name        = "customer"
   description = "Api gateway for create customer"
 }

#STEP2: Create API Gateway Resource
 resource "aws_api_gateway_resource" "customer" {
   rest_api_id = aws_api_gateway_rest_api.customer.id
   parent_id   = aws_api_gateway_rest_api.customer.root_resource_id
   path_part   = "customers"

 }

#STEP3: Create APi Gateway Method - eg. GET, POST, PUT etc
 resource "aws_api_gateway_method" "customer" {
   rest_api_id      = aws_api_gateway_rest_api.customer.id
   resource_id      = aws_api_gateway_resource.customer.id
   http_method      = "POST"
   authorization    = "NONE"
   api_key_required = true

 }

#STEP4: Integrate API Gateway Resource created above with the Method
 resource "aws_api_gateway_integration" "customer" {
   rest_api_id             = aws_api_gateway_rest_api.customer.id
   resource_id             = aws_api_gateway_resource.customer.id
   http_method             = aws_api_gateway_method.customer.http_method
   integration_http_method = "POST"
   type                    = "AWS_PROXY"
   uri                     = aws_lambda_function.da_create_customer.invoke_arn

 }

#STEP5: Deploy the API Gateway - eg. test, stage, prod etc
 resource "aws_api_gateway_deployment" "customer" {
   depends_on  = [aws_api_gateway_integration.customer]
   rest_api_id = aws_api_gateway_rest_api.customer.id
   stage_name  = "test"
 }

#STEP6: Create API Key, Usage Plan and integrate the API Key with Usage Plan/deployment name
 resource "aws_api_gateway_api_key" "this" {
   name = "customers"
 }

 resource "aws_api_gateway_usage_plan" "this" {
   name = "usage_plan"
   api_stages {
     api_id = aws_api_gateway_rest_api.customer.id
     stage  = aws_api_gateway_deployment.customer.stage_name
   }
 }

 resource "aws_api_gateway_usage_plan_key" "this" {
   key_id        = aws_api_gateway_api_key.this.id
   key_type      = "API_KEY"
   usage_plan_id = aws_api_gateway_usage_plan.this.id
 }
