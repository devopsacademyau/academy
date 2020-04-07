resource "random_string" "random" {
  length  = 8
  upper   = false
  special = false
}

resource "aws_s3_bucket" "bucket" {
  bucket = "c04-iac01-${random_string.random.result}"
  acl    = "private"

  tags = {
    Name = "DAC04IaC01-BCKT"
  }
}