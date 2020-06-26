output "vpc_cidr_block" {
  value = aws_vpc.devopsacademy-vpc-iac.cidr_block
}

output "public_subnets_cidr_block" {
  value = ["${aws_subnet.public-subnet-iac.*.cidr_block}"]
}

output "private_subnets_cidr_block" {
  value = ["${aws_subnet.private-subnet-iac.*.cidr_block}"]
}
