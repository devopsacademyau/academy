# Tried to do automatic vpc outputs, but only works if it is already applied.
# data "aws_subnets" "vpc_subnets" {
#   filter {
#     name   = "vpc-id"
#     values = [aws_vpc.vpc.id]
#   }
# }

# data "aws_subnet" "vpc_subnet" {
#   for_each = toset(data.aws_subnets.vpc_subnets.ids)
#   id       = each.value
# }

# output "vpc_subnets_cidr" {
#   value = [for s in data.aws_subnet.vpc_subnet : s.cidr_block]
# }

output "vpc_cidr" {
  value = aws_vpc.vpc.cidr_block
}

output "vpc_subnets" {
  value = [var.subnet1_private_cidr, var.subnet1_public_cidr, var.subnet2_private_cidr, var.subnet2_public_cidr]
}