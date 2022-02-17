output "VPC_CIDR" {
  value = aws_vpc.this.cidr_block
}

output "Public_Subnet_1_CIDR" {
  value = aws_subnet.public_1.cidr_block
}

output "Public_Subnet_2_CIDR" {
  value = aws_subnet.public_2.cidr_block
}

output "Private_Subnet_1_CIDR" {
  value = aws_subnet.private_1.cidr_block
}

output "Private_Subnet_2_CIDR" {
  value = aws_subnet.private_2.cidr_block
}