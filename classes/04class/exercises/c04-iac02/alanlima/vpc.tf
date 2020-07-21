resource "aws_vpc" "vpc_devops" {
  cidr_block = "10.0.0.0/16"
  tags = merge(var.common_tags, {
    Name = "devopsacademy-iac"
  })
}

resource "aws_subnet" "subnet_public_1" {
  vpc_id                  = aws_vpc.vpc_devops.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = true
  tags = merge(var.common_tags, {
    Name = "devops-subnet-public-1"
  })
}

resource "aws_subnet" "subnet_public_2" {
  vpc_id                  = aws_vpc.vpc_devops.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = var.availability_zones[1]
  map_public_ip_on_launch = true
  tags = merge(var.common_tags, {
    Name = "devops-subnet-public-2"
  })
}

resource "aws_subnet" "subnet_private_1" {
  vpc_id            = aws_vpc.vpc_devops.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = var.availability_zones[0]
  tags = merge(var.common_tags, {
    Name = "devops-subnet-private-1"
  })
}

resource "aws_subnet" "subnet_private_2" {
  vpc_id            = aws_vpc.vpc_devops.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = var.availability_zones[1]
  tags = merge(var.common_tags, {
    Name = "devops-subnet-private-2"
  })
}

resource "aws_internet_gateway" "igw_devops" {
  vpc_id = aws_vpc.vpc_devops.id
  tags = merge(var.common_tags, {
    Name = "devops-igw"
  })
}

resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.vpc_devops.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_devops.id
  }

  tags = merge(var.common_tags, {
    Name = "devops-public-rt"
  })
}

resource "aws_route_table" "rt_private" {
  vpc_id = aws_vpc.vpc_devops.id

  tags = merge(var.common_tags, {
    Name = "devops-private-rt"
  })
}

resource "aws_route_table_association" "public_subnet1_route_link" {
  subnet_id      = aws_subnet.subnet_public_1.id
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_route_table_association" "public_subnet2_route_link" {
  subnet_id      = aws_subnet.subnet_public_2.id
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_route_table_association" "private_subnet1_route_link" {
  subnet_id      = aws_subnet.subnet_private_1.id
  route_table_id = aws_route_table.rt_private.id
}

resource "aws_route_table_association" "private_subnet2_route_link" {
  subnet_id      = aws_subnet.subnet_private_2.id
  route_table_id = aws_route_table.rt_private.id
}