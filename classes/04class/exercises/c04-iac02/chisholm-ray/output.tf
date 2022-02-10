output "ccr_vpc_cidr"{
    value = var.vpc_cidr
}
output "subnet_cidrs"{
    value = toset([
        aws_subnet.private_1.cidr_block,
        aws_subnet.private_2.cidr_block,
        aws_subnet.public_1.cidr_block,
        aws_subnet.public_2.cidr_block
    ])
}