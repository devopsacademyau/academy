output "vpc_cidr" {
  value = aws_vpc.devopsacademy_iac_vpc.cidr_block
}

output "public_subnet_1_cidr" {
  value = aws_subnet.public_subnet_1.cidr_block
}

output "public_subnet_2_cidr" {
  value = aws_subnet.public_subnet_2.cidr_block
}

output "private_subnet_1_cidr" {
  value = aws_subnet.private_subnet_1.cidr_block
}

output "private_subnet_2_cidr" {
  value = aws_subnet.private_subnet_2.cidr_block
}