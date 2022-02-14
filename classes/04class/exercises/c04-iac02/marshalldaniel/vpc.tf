resource "aws_vpc" "devopsacademy-iac" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "devopsacademy-iac"
  }
}

resource "aws_subnet" "public-subnet01" {
  vpc_id            = aws_vpc.devopsacademy-iac.id
  cidr_block        = var.subnet1_public1_cidr
  tags = {
    Name = var.subnet1_public1_name
  }
}
resource "aws_subnet" "public-subnet02" {
  vpc_id            = aws_vpc.devopsacademy-iac.id
  cidr_block        = var.subnet2_public2_cidr
  tags = {
    Name = var.subnet2_public2_name
  }
}

resource "aws_subnet" "private-subnet01" {
  vpc_id            = aws_vpc.devopsacademy-iac.id
  cidr_block        = var.subnet3_private1_cidr
  tags = {
    Name = var.subnet3_private1_name
  }
}

resource "aws_subnet" "private-subnet02" {
  vpc_id            = aws_vpc.devopsacademy-iac.id
  cidr_block        = var.subnet4_private2_cidr
  tags = {
    Name = var.subnet4_private2_name
  }
}

resource "aws_internet_gateway" "igw-marshalldaniel" {
  vpc_id = aws_vpc.devopsacademy-iac.id
  tags = {
    Name = "igw-marshalldaniel"
  }
}

resource "aws_nat_gateway" "natgw-marshalldaniel" {
  allocation_id = aws_eip.natgw-eip-marshalldaniel.id
  subnet_id     = aws_subnet.public-subnet01.id
  tags = {
    Name = "natgw-marshalldaniel"
  }
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw-marshalldaniel]
}

resource "aws_eip" "natgw-eip-marshalldaniel" {
  vpc      = true
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.devopsacademy-iac.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-marshalldaniel.id
  }
  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public-subnet01.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public-subnet02.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.devopsacademy-iac.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgw-marshalldaniel.id
  }
  tags = {
    Name = "private-rt"
  }
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.private-subnet01.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.private-subnet01.id
  route_table_id = aws_route_table.private_rt.id
}
