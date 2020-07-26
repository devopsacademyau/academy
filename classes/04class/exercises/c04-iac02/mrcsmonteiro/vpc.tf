resource "aws_vpc" "devops_academy_iac_vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "devops_academy_iac_public_subnet_1" {
  vpc_id                  = aws_vpc.devops_academy_iac_vpc.id
  availability_zone       = "ap-southeast-2a"
  map_public_ip_on_launch = "true"
  cidr_block              = var.subnet_cidr_public_a

  tags = {
    Name = var.subnet_name_public_a
  }
}

resource "aws_subnet" "devops_academy_iac_public_subnet_2" {
  vpc_id                  = aws_vpc.devops_academy_iac_vpc.id
  availability_zone       = "ap-southeast-2b"
  map_public_ip_on_launch = "true"
  cidr_block              = var.subnet_cidr_public_b

  tags = {
    Name = var.subnet_name_public_b
  }
}

resource "aws_subnet" "devops_academy_iac_private_subnet_1" {
  vpc_id            = aws_vpc.devops_academy_iac_vpc.id
  availability_zone = "ap-southeast-2a"
  cidr_block        = var.subnet_cidr_private_a

  tags = {
    Name = var.subnet_name_private_a
  }
}

resource "aws_subnet" "devops_academy_iac_private_subnet_2" {
  vpc_id            = aws_vpc.devops_academy_iac_vpc.id
  availability_zone = "ap-southeast-2a"
  cidr_block        = var.subnet_cidr_private_b

  tags = {
    Name = var.subnet_name_private_b
  }
}

resource "aws_internet_gateway" "devopsacademy_iac_igw" {
  vpc_id = aws_vpc.devops_academy_iac_vpc.id

  tags = {
    Name = "devopsacademy-iac-igw"
  }
}

resource "aws_eip" "devopsacademy_iac_eip" {
  vpc = true
}

resource "aws_nat_gateway" "devopsacademy_iac_nat_gw" {
  allocation_id = aws_eip.devopsacademy_iac_eip.id
  subnet_id     = aws_subnet.devops_academy_iac_public_subnet_1.id
  depends_on    = [aws_internet_gateway.devopsacademy_iac_igw]

  tags = {
    Name = "devopsacademy-iac-nat-gw"
  }
}

resource "aws_route_table" "devopsacademy_iac_public_rt" {
  vpc_id = aws_vpc.devops_academy_iac_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devopsacademy_iac_igw.id
  }

  tags = {
    Name = "devopsacademy-iac-public-rt"
  }
}

resource "aws_route_table" "devopsacademy_iac_private_rt" {
  vpc_id = aws_vpc.devops_academy_iac_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.devopsacademy_iac_nat_gw.id
  }

  tags = {
    Name = "devopsacademy-iac-private-rt"
  }
}

resource "aws_route_table_association" "devopsacademy-iac-public-rt-assoc-1" {
  subnet_id      = aws_subnet.devops_academy_iac_public_subnet_1.id
  route_table_id = aws_route_table.devopsacademy_iac_public_rt.id
}

resource "aws_route_table_association" "devopsacademy-iac-public-rt-assoc-2" {
  subnet_id      = aws_subnet.devops_academy_iac_public_subnet_2.id
  route_table_id = aws_route_table.devopsacademy_iac_public_rt.id
}

resource "aws_route_table_association" "devopsacademy-iac-private-rt-assoc-1" {
  subnet_id      = aws_subnet.devops_academy_iac_private_subnet_1.id
  route_table_id = aws_route_table.devopsacademy_iac_private_rt.id
}

resource "aws_route_table_association" "devopsacademy-iac-private-rt-assoc-2" {
  subnet_id      = aws_subnet.devops_academy_iac_private_subnet_2.id
  route_table_id = aws_route_table.devopsacademy_iac_private_rt.id
}