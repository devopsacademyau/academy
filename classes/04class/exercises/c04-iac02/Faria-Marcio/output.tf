output "vpc-cidr" {
  value = var.vpc_cidr
}

output "subnet-private-a" {
  value = var.subnets_private_cidr[0]
}
output "subnet-private-b" {
  value = var.subnets_private_cidr[1]
}

output "subnet-public-a" {
  value = var.subnets_public_cidr[0]
}
output "subnet-public-b" {
  value = var.subnets_public_cidr[1]
}


