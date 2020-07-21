output "ec2_instance" {
  description = "ec2 instance details"
  value = {
    id        = aws_instance.ec2_default.id
    public_id = aws_instance.ec2_default.public_ip
  }
}

output "s3_bucket" {
  description = "s3 bucket"
  value = {
    id          = aws_s3_bucket.default.id
    domain_name = aws_s3_bucket.default.bucket_domain_name
  }
}