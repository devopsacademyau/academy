data "aws_ssm_parameter" "db_name" {
 name  = "DB_NAME"
}


resource "aws_ssm_parameter" "db_name" {
  name  = "dbname"
  type  = "String"
  value = "DA_Serverless"

    tags =  {
      Name = "${var.project_name}-ssm"
  }
}


resource "aws_ssm_parameter" "api_key" {
  name  = "apikey"
  type  = "String"
  value = aws_api_gateway_api_key.this.value

   tags =  {
      Name = "${var.project_name}-ssm"
  }
}
