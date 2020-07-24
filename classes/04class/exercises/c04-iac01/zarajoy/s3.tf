resource "aws_s3_bucket" "c04-iac01-bucket" {
  bucket = "c04-iac01-bucket"
  acl    = var.BUCKETACL
}

