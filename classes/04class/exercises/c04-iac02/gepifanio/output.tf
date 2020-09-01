output "vpc_cidr" {
    value       = aws_vpc.vpc_iac.cidr_block
}

output "public_subnets" {
    value = {
        for subnet in aws_subnet.public :
        subnet.id => {
            cidr_block        = subnet.cidr_block
        }
    }
}

output "private_subnets" {
    value = {
        for subnet in aws_subnet.private :
        subnet.id => {
            cidr_block        = subnet.cidr_block
        }
    }
}
