resource "aws_s3_bucket" "bucket_test" {
    bucket = "terraformtestbucket123"
    acl = "private"
  
}
