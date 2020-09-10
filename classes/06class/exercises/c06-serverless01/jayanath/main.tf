resource "aws_ssm_parameter" "db_name_param" {
  name  = var.db_name_param
  type  = "String"
  value = var.db_name
  overwrite = true
}

resource "aws_dynamodb_table" "basic_dynamodb_table" {
  name           = aws_ssm_parameter.db_name_param.value
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }
}