resource "aws_internet_gateway" "class04-igw" {
  vpc_id = aws_vpc.class04-vpc.id

  tags = {
    Name = "class04-igw"
  }
}
