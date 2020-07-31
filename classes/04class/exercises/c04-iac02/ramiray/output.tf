output "id" {
  value       = aws_vpc.da_iac02_vpc.id
  description = "VPC ID"
}

output "public_subnet_ids" {
  value       = aws_subnet.public.*.id
  description = "List of public subnet IDs"
}

output "private_subnet_ids" {
  value       = aws_subnet.private.*.id
  description = "List of private subnet IDs"
}


output "cidr_block" {
  value       = var.cidr_block
  description = "The CIDR block associated with the VPC"
}

