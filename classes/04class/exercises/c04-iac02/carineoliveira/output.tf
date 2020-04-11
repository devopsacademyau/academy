output "vpc_cidr" {
  value       = aws_vpc.my_vpc.cidr_block
  description = "Value of attribute cidr_block for the created vpc"
}

output "my_subnets" {
  value        = ["${aws_subnet.my_subnets.*.cidr_block}"]
  description = "Value of attribute cidr_block for the created subnet"
}

output "my_internet_gateway" {
  value        = aws_internet_gateway.my_internet_gateway.vpc_id
  description = "Value of attribute vpc_id for the created internet gateway"
}

output "my_nat_internet_gateway" {
  value        = aws_internet_gateway.my_internet_gateway
  description = "Value of created nat gateway"
}

output "my_elastic_IP" {
  value        = aws_eip.my_elastic_IP
  description = "Value of reated elastic ip gateway"
}

output "my_nat_route_table" {
  value        = aws_route_table.my_nat_route_table.vpc_id
  description = "Value of attribute vpc_id for the created route table"
}

output "my_igw_route_table" {
  value        = aws_route_table.my_igw_route_table.vpc_id
  description = "Value of attribute vpc_id for the created route table"
}