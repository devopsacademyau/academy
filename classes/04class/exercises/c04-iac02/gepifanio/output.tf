output "vpc_cidr" {
    value       = aws_vpc.vpc_iac.cidr_block
}

output "subnet_1_private" {
    value        = aws_subnet.subnet_1_private.cidr_block
}

output "subnet_2_private" {
    value        = aws_subnet.subnet_2_private.cidr_block
}

output "subnet_3_public" {
    value        = aws_subnet.subnet_3_public.cidr_block
}

output "subnet_4_public" {
    value        = aws_subnet.subnet_4_public.cidr_block
}