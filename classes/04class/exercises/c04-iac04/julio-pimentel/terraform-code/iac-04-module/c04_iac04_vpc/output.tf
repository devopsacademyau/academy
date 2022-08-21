output "vpc_id" {
  description = "VPC ID"
  value = aws_vpc.vpc_1.id
}

output "pub_cidr_id_1" {
  value = aws_subnet.pub_sub_1.id
}

output "pub_cidr_id_2" {
  value = aws_subnet.pub_sub_2.id
}

output "pub_cidr_id_3" {
  value = aws_subnet.pub_sub_3.id
}