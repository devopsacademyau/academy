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
    Name =  var.igw
}
}
