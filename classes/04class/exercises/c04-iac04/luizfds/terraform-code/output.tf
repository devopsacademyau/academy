output "website_bucket_arn" {
  description = "ARN of the bucket"
  value       = module.website_s3_bucket.arn
}

output "website_bucket_name" {
  description = "Name (id) of the bucket"
  value       = module.website_s3_bucket.name
}

output "website_endpoint" {
  description = "Domain name of the bucket"
  value       = module.website_s3_bucket.website_endpoint
}

# output "elb_dns_name" {
#   value = "${aws_elb.elb.dns_name}"
# }

# output "alb_dns_name" {
#   value = "${aws_lb.alb.dns_name}"
# }

# output "nlb_dns_name" {
#   value = "${aws_lb.nlb.dns_name}"
# }