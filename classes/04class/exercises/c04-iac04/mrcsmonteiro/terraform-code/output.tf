output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_a_id" {
  description = "Public Subnet ID for AZ-a"
  value       = module.vpc.pub_cidr_id_a
}

output "public_subnet_b_id" {
  description = "Public Subnet ID for AZ-b"
  value       = module.vpc.pub_cidr_id_b
}

output "public_subnet_c_id" {
  description = "Public Subnet ID for AZ-c"
  value       = module.vpc.pub_cidr_id_c
}

output "alb_dns_name" {
  description = "ALB DNS name"
  value       = module.alb.alb_dns_name
}