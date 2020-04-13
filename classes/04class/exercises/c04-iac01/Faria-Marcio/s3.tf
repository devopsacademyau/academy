resource "random_string" "random" {
  length  = 8
  upper   = false
  special = false
}

resource "aws_s3_bucket" "bucket" {
  bucket = "c04-iac01-s3"
  acl    = "private"

  tags = {
    Name = "DevOpsAcademyBucket"
  }
}
