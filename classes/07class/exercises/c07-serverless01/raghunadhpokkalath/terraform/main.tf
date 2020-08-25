resource "aws_kms_key" "encryption" {
}


resource "aws_kms_grant" "this" {
  name              = "lamda-grant"
  key_id            = aws_kms_key.encryption.id
  grantee_principal = aws_iam_role.iam_for_lambda.arn
  operations        = ["Decrypt"]
}


resource "aws_dynamodb_table" "da_serverless" {
  name             = var.db_name
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = "email"
  stream_enabled   = true
  stream_view_type = "NEW_IMAGE"

  attribute {
    name = "email"
    type = "S"
  }

  server_side_encryption {
    enabled     = true
    kms_key_arn = aws_kms_key.encryption.arn
  }


  tags = {
    Name = "${var.project_name}-dynamodb"
  }
}

data "aws_ssm_parameter" "db_name" {
  name = "DB_NAME"
}
resource "aws_ssm_parameter" "db_name" {
  name  = "dbname"
  type  = "String"
  value = "DA_Serverless"

  tags = {
    Name = "${var.project_name}-ssm"
  }
}

resource "aws_ssm_parameter" "api_key" {
  name  = "apikey"
  type  = "String"
  value = aws_api_gateway_api_key.this.value

  tags = {
    Name = "${var.project_name}-ssm"
  }
}

