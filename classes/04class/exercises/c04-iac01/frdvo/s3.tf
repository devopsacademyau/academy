resource "aws_s3_bucket" "first_s3" {
  bucket = "devops-academy-terraform-bucket"
  acl    = "private"

  tags = {
    Name        = "DevOps Academy Terraform Bucket"
  }
}