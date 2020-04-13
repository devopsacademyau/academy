output "vpc_cidr_block" {
  value = aws_vpc.devopsacademy_iac.cidr_block
}

output "public_subnet_cidr_block" {
  value = aws_subnet.public.*.cidr_block
}

output "private_subnet_cidr_block" {
  value = aws_subnet.private.*.cidr_block
}