resource "random_string" "random" {
  length  = 5
  upper   = false
  special = false
}

resource "aws_s3_bucket" "first_terraform_bucket" {
  bucket = "bucket-terraform-dev-${random_string.random.result}"
  acl    = "private"

  tags = {
    Name = "DevOps-Terraform-bucket"
  }
}

