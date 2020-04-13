data "aws_security_groups" "my_security_groups" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}
