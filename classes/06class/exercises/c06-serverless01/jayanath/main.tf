resource "aws_ssm_parameter" "db_name_param" {
  name  = var.db_name_param
  type  = "String"
  value = var.db_name
  overwrite = true
}

resource "aws_kms_key" "doa_kms_key" {
  description             = "Main KMS key"
  deletion_window_in_days = 7
}

resource "aws_dynamodb_table" "doa_dynamodb_table" {
  name           = aws_ssm_parameter.db_name_param.value
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }
  server_side_encryption {
    enabled     = true
    kms_key_arn = aws_kms_key.doa_kms_key.arn
  }
}

# S3 bucket to host lambda code
resource "aws_s3_bucket" "doa_lambda_bucket" {
  bucket = "doa.jay.c06.lambda.host.com"
  acl    = "private"
}

# Upload lambda code to the bucket
resource "aws_s3_bucket_object" "doa_lambda_zip" {
  key                    = "jay/doa_lambda_zip"
  bucket                 = aws_s3_bucket.doa_lambda_bucket.id
  source                 = "src/lambda.zip"
  server_side_encryption = "AES256"
}

resource "aws_lambda_function" "doa_customer_api_lambda" {
   function_name = "doa-lambda"
   s3_bucket = aws_s3_bucket.doa_lambda_bucket.id
   s3_key    = "jay/doa_lambda_zip"
   handler = "lambda_handler.lambda_handler"
   runtime = "python3.8"

   role = aws_iam_role.lambda_exec.arn

  environment {
    variables = {
      DB_NAME = aws_ssm_parameter.db_name_param.value
    }
  }
}

resource "aws_iam_role" "lambda_exec" {
   assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_kms_grant" "kms_access_grant" {
  key_id            = aws_kms_key.doa_kms_key.key_id
  grantee_principal = aws_iam_role.lambda_exec.arn
  operations        = ["Decrypt"]
}

resource "aws_iam_policy" "logging_access_policy" {
  path        = "/"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:logs:*:*:*"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "logging-policy-attach" {
  name       = "logging-policy-attachment"
  roles      = [aws_iam_role.lambda_exec.name]
  policy_arn = aws_iam_policy.logging_access_policy.arn
}

resource "aws_iam_policy" "db_access_policy" {
  path        = "/"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
				"dynamodb:PutItem",
				"dynamodb:UpdateItem"
      ],
      "Effect": "Allow",
      "Resource": "${aws_dynamodb_table.doa_dynamodb_table.arn}"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "db-access-policy-attach" {
  name       = "db-access-policy-attachment"
  roles      = [aws_iam_role.lambda_exec.name]
  policy_arn = aws_iam_policy.db_access_policy.arn
}
