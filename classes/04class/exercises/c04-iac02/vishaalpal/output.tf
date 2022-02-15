# Define output variables
output "vpc_id" {
  value       = var.set_vpc_cidr_range
  description = "The vpc cidr range."
}

output "subnet_cidrs" {
  value       = { for k, v in var.subnets : k => v.cidr }
  description = "The subnet cidr range."
}

output "subnet_names" {
  value       = { for k, v in var.subnets : k => v.name }
  description = "The names of the subnets."
}

output "subnet_ids" {
  value       = { for k, v in aws_subnet.subnets : k => v.id }
  description = "The subnet ids."
}

/* output "subnet_ids" {
    value = [for subnet in aws_subnet.subnets: subnet.id]
} */
