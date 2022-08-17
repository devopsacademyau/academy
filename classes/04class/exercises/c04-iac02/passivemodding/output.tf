output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}

output "subnet_public_1_cidr" {
  value = aws_subnet.public1.cidr_block
}

output "subnet_public_2_cidr" {
  value = aws_subnet.public2.cidr_block
}

output "subnet_private_1_cidr" {
  value = aws_subnet.private1.cidr_block
}

output "subnet_private_2_cidr" {
  value = aws_subnet.private2.cidr_block
}