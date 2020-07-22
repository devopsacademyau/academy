resource "aws_vpc" "vpc_devops" {
  cidr_block           = "172.32.0.0/16"
  enable_dns_hostnames = true
  tags = merge(var.common_tags, {
    "Name" = "devops-vpc"
  })
}

resource "aws_subnet" "subnet_devops" {
  vpc_id                  = aws_vpc.vpc_devops.id
  cidr_block              = "172.32.0.0/24"
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = true
  tags = merge(var.common_tags, {
    "Name" = "devops-subnet"
  })
}

resource "aws_route_table" "rt_devops" {
  vpc_id = aws_vpc.vpc_devops.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_default.id
  }

  tags = merge(var.common_tags, {
    "Name" = "devops-rt"
  })
}

resource "aws_route_table_association" "subnet_route_link" {
  subnet_id      = aws_subnet.subnet_devops.id
  route_table_id = aws_route_table.rt_devops.id
}

resource "aws_internet_gateway" "igw_default" {
  vpc_id = aws_vpc.vpc_devops.id
  tags = merge(var.common_tags, {
    "Name" = "devops-igw"
  })
}