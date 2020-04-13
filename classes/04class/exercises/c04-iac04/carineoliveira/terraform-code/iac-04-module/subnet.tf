data "aws_subnet_ids" "my_subnet_ids" {
  vpc_id = var.vpc_id
}

data "aws_subnet" "my_subnets" {
  for_each = data.aws_subnet_ids.my_subnet_ids.ids
  id       = each.value
}
