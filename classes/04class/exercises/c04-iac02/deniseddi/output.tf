output "vpc_cidr" {
  value = aws_vpc.devopsacademy-iac.cidr_block
}

output "public_subnets_cidr" {
  value = aws_subnet.public.*.cidr_block
}

output "private_subnets_cidr" {
  value = aws_subnet.private.*.cidr_block
}
