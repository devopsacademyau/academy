data "aws_ssm_parameter" "db_name" {
  name = var.param_db_name
}

resource "aws_dynamodb_table" "basic_dynamodb_table" {
  name           = data.aws_ssm_parameter.db_name.value
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }
}