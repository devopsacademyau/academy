resource "aws_route_table" "class04-routetable" {
  vpc_id = aws_vpc.class04-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.class04-igw.id
  }

tags = {
    Name = "class04-routetable"
  }
}

resource "aws_main_route_table_association" "class04-rt-association" {
  vpc_id         = aws_vpc.class04-vpc.id
  route_table_id = aws_route_table.class04-routetable.id
}
