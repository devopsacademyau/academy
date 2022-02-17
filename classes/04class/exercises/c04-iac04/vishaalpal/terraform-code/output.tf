###############################################################################
# VPC outputs
###############################################################################
output "vpc_name" {
  description = "Description: The name of the VPC specified as argument to this module."
  value       = module.vpc.name
}

output "vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc.vpc_id
}

output "vpc_cidr" {
  description = "The CIDR block of the VPC."
  value       = module.vpc.vpc_cidr_block
}

output "vpc_tenancy" {
  description = "Tenancy of instances spin up within VPC."
  value       = module.vpc.vpc_instance_tenancy
}

output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support."
  value       = module.vpc.vpc_enable_dns_support
}

output "private_subnets" {
  description = "List of IDs of private subnets."
  value       = module.vpc.private_subnets
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets."
  value       = module.vpc.private_subnets_cidr_blocks
}

output "public_subnets" {
  description = "List of IDs of public subnets."
  value       = module.vpc.public_subnets
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets."
  value       = module.vpc.public_subnets_cidr_blocks
}

output "igw_id" {
  description = "The ID of the Internet Gateway."
  value       = module.vpc.igw_id
}

output "private_route_table_ids" {
  description = "List of IDs of private route tables."
  value       = module.vpc.private_route_table_ids
}

output "public_route_table_ids" {
  description = "List of IDs of public route tables."
  value       = module.vpc.public_route_table_ids
}

###############################################################################
# Security group outputs
###############################################################################
output "alb_sg_id" {
  description = "List of IDs of security groups associated with the ALB."
  value       = module.webservers.alb_sg_id
}

output "private_instance_sg_id" {
  description = "List of IDs of security groups associated with instances in private subnets."
  value       = module.webservers.private_instance_sg_id
}

###############################################################################
# Autoscaling group outputs
###############################################################################
output "asg_name" {
  description = "The name of the Auto Scaling Group."
  value       = module.webservers.asg_name
}

output "asg_min_size" {
  description = "The minimum size of the Auto Scaling Group."
  value       = module.webservers.asg_min_size
}

output "asg_max_size" {
  description = "The maximum size of the Auto Scaling Group."
  value       = module.webservers.asg_max_size
}

output "asg_desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group."
  value       = module.webservers.asg_desired_capacity
}

###############################################################################
# Application load balancer outputs
###############################################################################
output "alb_dns_name" {
  description = "FQDN of the ALB."
  value       = module.webservers.alb_dns_name
}

###############################################################################
# Other outputs
###############################################################################
output "ec2_key_pair" {
  description = "The key pair name."
  value       = module.webservers.ec2_key_pair
}

