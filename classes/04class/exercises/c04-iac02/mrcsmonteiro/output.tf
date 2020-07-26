output "public_subnet_b" {
  value       = aws_subnet.devops_academy_iac_public_subnet_2.cidr_block
  description = "Public Subnet CIDR - b"
}

output "public_subnet_a" {
  value       = aws_subnet.devops_academy_iac_public_subnet_1.cidr_block
  description = "Public Subnet CIDR - a"
}

output "private_subnet_b" {
  value       = aws_subnet.devops_academy_iac_private_subnet_2.cidr_block
  description = "Private Subnet CIDR - b"
}

output "private_subnet_a" {
  value       = aws_subnet.devops_academy_iac_private_subnet_1.cidr_block
  description = "Private Subnet CIDR - a"
}

output "vpc_cidr" {
  value       = aws_vpc.devops_academy_iac_vpc.cidr_block
  description = "VPC CIDR"
}

output "bastion_host_public_ip" {
  value       = aws_instance.bastion.public_ip
  description = "Bastion host public IP"
}

output "private_host_ip" {
  value       = aws_instance.private.private_ip
  description = "Private host IP"
}