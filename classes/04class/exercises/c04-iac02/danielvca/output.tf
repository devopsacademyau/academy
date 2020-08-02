output "vpc_cidr_block" {
  value = aws_vpc.devopsacademyiac.cidr_block
}

output "private_subnet_a_cidr_block" {
  value = aws_subnet.private_subnet_a.cidr_block
}

output "private_subnet_b_cidr_block" {
  value = aws_subnet.private_subnet_b.cidr_block
}

output "public_subnet_a_cidr_block" {
  value = aws_subnet.public_subnet_a.cidr_block
}

output "public_subnet_b_cidr_block" {
  value = aws_subnet.public_subnet_b.cidr_block
}
