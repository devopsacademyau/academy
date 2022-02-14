output "vpc_cidr_block" {
  value       = try(aws_vpc.devopsacademy-iac.cidr_block, "")
}

output "public-subnet01_cidr" {
  value       = aws_subnet.public-subnet01.cidr_block
}

output "public-subnet02_cidr" {
  value       = aws_subnet.public-subnet02.cidr_block
}

output "private-subnet01_cidr" {
  value       = aws_subnet.private-subnet01.cidr_block
}

output "private-subnet02_cidr" {
  value       = aws_subnet.private-subnet02.cidr_block
}
