output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc.id
}

output "pub_cidr_id_a" {
  value = aws_subnet.pub_cidr_a.id
}

output "pub_cidr_id_b" {
  value = aws_subnet.pub_cidr_b.id
}

output "pub_cidr_id_c" {
  value = aws_subnet.pub_cidr_c.id
}