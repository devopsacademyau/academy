######################################################################
# Define Route Tables for Subnets to NAT Gateway and Internet Gateway
######################################################################
resource "aws_route_table" "internet_gateway_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
}

resource "aws_route_table_association" "internet_gateway_rta_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.internet_gateway_rt.id

  depends_on = [
    aws_internet_gateway.internet_gateway
  ]
}

resource "aws_route_table_association" "internet_gateway_rta_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.internet_gateway_rt.id

  depends_on = [
    aws_internet_gateway.internet_gateway
  ]
}