output "vpc_cidr" {
  value = aws_vpc.devopsvpc.cidr_block
}

output "subnet-public-a-cidr" {
  value = var.public_subnets[0].cidr
}


output "subnet-public-b-cidr" {
  value = var.public_subnets[1].cidr
}

output "subnet-private-a-cidr" {
  value = var.private_subnets[0].cidr
}

output "subnet-private-b-cidr" {
  value = var.private_subnets[1].cidr
}

