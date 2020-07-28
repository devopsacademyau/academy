output "vpc_id" {
  value = aws_vpc.devops_vpc.id
}

output "cidr_block_vpc" {
  value = aws_vpc.devops_vpc.cidr_block
}

output "private" {
  value = {
    for subnet in aws_subnet.private :
    subnet.id => subnet.cidr_block
  }
}

output "public" {
  value = {
    for subnet in aws_subnet.public :
    subnet.id => subnet.cidr_block
  }
}
