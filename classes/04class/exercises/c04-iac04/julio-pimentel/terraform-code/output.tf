output "vpc_id" {
  description = "VPC ID"
  value = module.c04_iac04_vpc.vpc_id
}

output "public_subnet_1_id" {
  description = "Public Subnet ID for AZ-a"
  value = module.c04_iac04_vpc.pub_cidr_id_1
}

output "public_subnet_2_id" {
  description = "Public Subnet ID for AZ-b"
  value = module.c04_iac04_vpc.pub_cidr_id_2
}

output "public_subnet_3_id" {
  description = "Public Subnet ID for AZ-c"
  value = module.c04_iac04_vpc.pub_cidr_id_3
}

output "alb_dns_name" {
  description = "ALB DNS name"
  value = module.c04_iac04_alb.alb_dns_name
}