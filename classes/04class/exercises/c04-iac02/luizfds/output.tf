output "vpc_id" {
  value = "${aws_vpc.devopsacademy_vpc.id}"
}

output "vpc_cidr_block" {
  value = "${aws_vpc.devopsacademy_vpc.cidr_block}"
}

output "private_subnets" {
  value = {
    for subnet in aws_subnet.private_subnet :
    subnet.id => subnet.cidr_block
  }
}

output "public_subnets" {
  value = {
    for subnet in aws_subnet.public_subnet :
    subnet.id => subnet.cidr_block
  }
}

output "security_group" {
  value = "${aws_security_group.allow_ssl.id}"
}
