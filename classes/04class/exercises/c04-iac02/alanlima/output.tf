output "public_subnets" {
  description = "list of public_subnets created"
  value = {
    for subnet in aws_subnet.public :
    subnet.id => {
      name              = subnet.tags.Name
      availability_zone = subnet.availability_zone
      cidr_block        = subnet.cidr_block
    }
  }
}

output "private_subnets" {
  description = "list of private_subnets created"
  value = {
    for subnet in aws_subnet.private :
    subnet.id => {
      name              = subnet.tags.Name
      availability_zone = subnet.availability_zone
      cidr_block        = subnet.cidr_block
    }
  }
}

output "vpc_id" {
  value = aws_vpc.vpc_devops.id
}