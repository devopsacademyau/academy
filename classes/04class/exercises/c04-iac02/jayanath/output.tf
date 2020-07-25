output "vpc_cidr_block" {
  value = aws_vpc.doa_iac_vpc.cidr_block
}

output "private_subnet_a_cidr_block" {
  value = aws_subnet.private_a.cidr_block
}

output "private_subnet_b_cidr_block" {
  value = aws_subnet.private_b.cidr_block
}

output "public_subnet_a_cidr_block" {
  value = aws_subnet.public_a.cidr_block
}

output "public_subnet_b_cidr_block" {
  value = aws_subnet.public_b.cidr_block
}
