resource "aws_s3_bucket" "s3-bucket" {
    bucket = "ec2-s3-bucket-test"
    region = var.region
    acl    = "private"

    tags = {
        Name        = "Testing ec2 with s3 bucket"
        Environment = "Dev"
    }
}