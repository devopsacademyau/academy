######################################################################
# Outputs of Terraform execution
######################################################################
output "VPC_CIDR" {
  value = var.vpc_cidr
}

output "Public_1_Subnet_CIDR" {
  value = var.subnet_pub_1_cidr
}

output "Public_2_Subnet_CIDR" {
  value = var.subnet_pub_2_cidr
}

output "Private_1_Subnet_CIDR" {
  value = var.subnet_prv_1_cidr
}

output "Private_2_Subnet_CIDR" {
  value = var.subnet_prv_2_cidr
}