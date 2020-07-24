resource "aws_subnet" "class04-subnet" {
  vpc_id = aws_vpc.class04-vpc.id
  cidr_block = "20.0.1.0/24"
  availability_zone = data.aws_availability_zones.class04-az.names[0]

  tags = {
    Name = "class04-subnet"
  }
}
