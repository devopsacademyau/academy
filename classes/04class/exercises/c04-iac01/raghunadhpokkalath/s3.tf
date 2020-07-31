resource aws_s3_bucket this {
  bucket = "devops-academy-terraform"
  acl    = "private"

  tags = {
    Name = "Devops S3 Bucket-Terraform"

  }
}