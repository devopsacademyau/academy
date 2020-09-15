resource "aws_dynamodb_table" "da_serverless" {
  name         = var.db_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  server_side_encryption {
    enabled     = true
    kms_key_arn = aws_kms_key.encryption.arn
  }

    tags =  {
      Name = "${var.project_name}-dynamodb"
  }
}
