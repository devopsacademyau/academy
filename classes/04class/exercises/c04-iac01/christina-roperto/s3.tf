resource "aws_s3_bucket" "Devops_iac01" {
  bucket = "devops-iac01"
  acl    = "private"

  tags = {
    Name   = "Devops_iac01"
  }
}