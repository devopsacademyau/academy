
output "vpc_cidr" {
  description = "The VPC Name and cidr_block:"
  value       = aws_vpc.main.cidr_block
}

output "public_subnets" {
  description = "List of public subnets:"

  value = {
      for subnet in aws_subnet.main-public :
      subnet.id => {
        name              = subnet.tags.Name
        cidr_block        = subnet.cidr_block
        availability_zone = subnet.availability_zone
      }
  }
}

output "private_subnets" {
  description = "List of private subnets:"

  value = {
      for subnet in aws_subnet.main-private :
      subnet.id => {
        name              = subnet.tags.Name
        cidr_block        = subnet.cidr_block
        availability_zone = subnet.availability_zone
      }
  }
}

