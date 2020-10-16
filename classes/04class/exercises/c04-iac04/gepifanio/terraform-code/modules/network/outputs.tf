output "vpc_id" {
    value = aws_vpc.vpc_iac.id
}

output "vpc_cidr" {
    value       = aws_vpc.vpc_iac.cidr_block
}

output public_subnets {
    value = [for subnet in aws_subnet.public : subnet.id]
}

output private_subnets {
    value = [for subnet in aws_subnet.private : subnet.id]
}