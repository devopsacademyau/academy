##
# Selected VPC
#

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.devopsacademy-iac.cidr_block
}

data "aws_subnet_ids" "all_subnets" {
  vpc_id = aws_vpc.devopsacademy-iac.id

  depends_on = [aws_subnet.private_subnet, aws_subnet.public_subnet]
}

data "aws_subnet" "subnets" {
  count = 4
  id    = tolist(data.aws_subnet_ids.all_subnets.ids)[count.index]

  depends_on = [aws_subnet.private_subnet, aws_subnet.public_subnet]
}

output "subnet_cidr_blocks" {
  value = [for s in data.aws_subnet.subnets : s.cidr_block]

  depends_on = [data.aws_subnet.subnets]
}
