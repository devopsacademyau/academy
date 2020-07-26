resource "aws_s3_bucket" "s3" {
  bucket = "devops-academy-tf-c04-iac01"

  tags = {
    Name = "DevOps Academy TF S3"
  }
}