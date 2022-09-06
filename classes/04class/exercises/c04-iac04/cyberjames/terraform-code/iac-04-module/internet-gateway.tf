######################################################################
# Define Internet Gateway for Public Subnets
######################################################################
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = var.internet_gateway_name
  }
}