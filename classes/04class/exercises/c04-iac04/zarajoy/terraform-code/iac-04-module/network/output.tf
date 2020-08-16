output "subnet_public_1" {
  value = [aws_subnet.subnet_public_1.cidr_block]
}
output "subnet_public_2" {
  value = [aws_subnet.subnet_public_2.cidr_block]
}
output "subnet_private_1" {
  value = [aws_subnet.subnet_private_1.cidr_block] 
}

output "subnet_private_2" {
  value = [aws_subnet.subnet_private_2.cidr_block] 
}
output "vpc_block" {
  value = aws_vpc.vpc.cidr_block
}
output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnets_public_1_id" {
  value = aws_subnet.subnet_public_1.id
}
output "subnets_public_2_id" {
  value = aws_subnet.subnet_public_2.id
}


output "subnets_private_1_id" {
  value = aws_subnet.subnet_private_1.id
}
output "subnets_private_2_id" {
  value = aws_subnet.subnet_private_2.id
}
