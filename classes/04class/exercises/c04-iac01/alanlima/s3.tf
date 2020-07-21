resource "aws_s3_bucket" "default" {
  bucket = var.bucket_name
  acl    = "private"
  tags = merge(local.common_tags, {
    "Name" = "Devops Bucket ${var.devops_class}"
  })
}