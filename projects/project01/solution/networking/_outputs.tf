output "vpc_id" {
  value = aws_vpc.default.id
}

output "private_subnet_ids" {
  value = aws_subnet.private.*.id
}

output "db_private_subnet_group" {
  value = aws_db_subnet_group.db_private_subnet.id
}
