resource "aws_s3_bucket" "default" {
  bucket = var.bucket_name
  acl    = "private"
  tags = merge(var.common_tags, {
    "Name" = "Devops Bucket ${var.devops_class}"
  })
}