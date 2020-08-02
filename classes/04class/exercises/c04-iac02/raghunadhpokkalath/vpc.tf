resource "aws_vpc" "this" {
  cidr_block       = var.vpc.cidr
  instance_tenancy = "default"

  tags = {
    Name = var.vpc.name
  }
}

resource "aws_subnet" "public_a" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_subnet_a.cidr
  availability_zone = var.availability_zones[0]

  tags = {
    Name = var.public_subnet_a.name
  }
}


resource "aws_subnet" "public_b" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_subnet_b.cidr
  availability_zone = var.availability_zones[1]

  tags = {
    Name = var.public_subnet_b.name
  }
}

resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet_a.cidr
  availability_zone = var.availability_zones[0]

  tags = {
    Name = var.private_subnet_a.name
  }
}


resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet_b.cidr
  availability_zone = var.availability_zones[1]

  tags = {
    Name = var.private_subnet_b.name
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
  subnet_id     = aws_subnet.public_a.id
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

resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public.id
}


resource "aws_route_table_association" "private_a" {
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.private.id
}


resource "aws_route_table_association" "private_b" {
  subnet_id      = aws_subnet.private_b.id
  route_table_id = aws_route_table.private.id
}