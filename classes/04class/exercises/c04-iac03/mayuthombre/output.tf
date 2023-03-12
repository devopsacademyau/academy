# Output values of VPC CIDR
output "vpcCIDRblock" {
  value = aws_vpc.tf-vpc.cidr_block
}

#Output values of subnets CIDR
output "public_subnet1" {
  value = aws_subnet.public[0].cidr_block
}

output "public_subnet2" {
  value = aws_subnet.public[1].cidr_block
}

output "private_subnet1" {
  value = aws_subnet.private[0].cidr_block
}

output "private_subnet2" {
  value = aws_subnet.private[1].cidr_block
}