resource "random_string" "random" {
  length  = 8
  upper   = false
  special = false
}

resource "aws_s3_bucket" "bucket" {
  bucket = "devopsacademy-${random_string.random.result}"
  acl    = "private"

  tags = {
    Name = "DevOpsAcademyBucket"
  }
}

