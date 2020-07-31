output "vpc_id" {
  value = aws_vpc.this.id
}
output "private_subnets" {
  value = [ for subnet in aws_subnet.private : map("name", subnet.tags.Name, "cidr", subnet.cidr_block) ]
}

output "public_subnets" {
  value = [ for subnet in aws_subnet.public : map("name", subnet.tags.Name, "cidr", subnet.cidr_block) ]
}