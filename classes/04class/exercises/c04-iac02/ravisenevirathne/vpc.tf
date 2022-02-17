resource "aws_vpc" "this" {
  cidr_block       = var.vpc.cidr
  instance_tenancy = "default"

  tags = {
    Name = var.vpc.name
  }
}

resource "aws_subnet" "public_1" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_subnet_1.cidr

  tags = {
    Name = var.public_subnet_1.name
  }
}


resource "aws_subnet" "public_2" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_subnet_2.cidr

  tags = {
    Name = var.public_subnet_2.name
  }
}

resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet_1.cidr

  tags = {
    Name = var.private_subnet_1.name
  }
}


resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet_2.cidr

  tags = {
    Name = var.private_subnet_2.name
  }
}


resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = var.igw
  }
}

resource "aws_eip" "this" {
  vpc = true
}

resource "aws_nat_gateway" "this" {
  subnet_id     = aws_subnet.public_1.id
  allocation_id = aws_eip.this.id

  depends_on = [aws_internet_gateway.this]

  tags = {
    "Name" = var.nat_gw
  }

}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    "Name" = var.rt_public
  }
}


resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.this.id
  }

  tags = {
    "Name" = var.rt_private
  }
}

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}


resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private.id
}


resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private.id
}