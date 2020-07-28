output "subnet-public-1" {
  value = ["${aws_subnet.subnet-public-1.cidr_block}"]
}
output "subnet-public-2" {
  value = ["${aws_subnet.subnet-public-2.cidr_block}"]
}
output "subnet-private-1" {
  value = ["${aws_subnet.subnet-private-1.cidr_block}"] 
}

output "subnet-private-2" {
  value = ["${aws_subnet.subnet-private-2.cidr_block}"] 
}
output "vpc" {
  value = aws_vpc.vpc.cidr_block
}
