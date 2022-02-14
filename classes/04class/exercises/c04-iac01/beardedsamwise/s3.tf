# Generate random string to append to s3 bucket
resource "random_string" "random" {
  length  = 8
  upper   = false
  special = false
}

# Create s3 bucket
resource "aws_s3_bucket" "bucket" {
  bucket = "c04-iac01-${random_string.random.result}"
  acl    = "private"

  tags = {
    Name = "c04-iac01"
  }
}