resource "aws_vpc" "devops_vpc" {
  cidr_block           = var.cidr_block_vpc
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"

  tags = {
    Name = "devopsacademy-iac"
  }
}

resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr_blocks)

  vpc_id            = aws_vpc.devops_vpc.id
  cidr_block        = var.private_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = var.private_subnet_names[count.index]
  }
}

resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr_blocks)

  vpc_id                  = aws_vpc.devops_vpc.id
  cidr_block              = var.public_subnet_cidr_blocks[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet_names[count.index]
  }
}

resource "aws_internet_gateway" "devops_igw" {
  vpc_id = aws_vpc.devops_vpc.id

  tags = {
    Name = "devops-igw"
  }
}

resource "aws_eip" "devops_ngw_ip" {
  vpc = true
}

resource "aws_nat_gateway" "devops_ngw" {
  allocation_id = aws_eip.devops_ngw_ip.id
  subnet_id     = element(aws_subnet.private.*.id, 0)

  tags = {
    Name = "devops-ngw"
  }
}

resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.devops_vpc.id

   tags = {
    Name = "devops-rtb-igw"
  }
}

resource "aws_route" "public_rtb_igw" {
  route_table_id         = aws_route_table.public_rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.devops_igw.id
}

resource "aws_route_table_association" "public_rtb_association" {
  count          = length(var.public_subnet_cidr_blocks)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public_rtb.id
}

resource "aws_route_table" "private_rtb" {
  vpc_id = aws_vpc.devops_vpc.id

   tags = {
    Name = "devops-rtb-ngw"
  }
}

resource "aws_route" "private_rtb_ngw" {
  route_table_id         = aws_route_table.private_rtb.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.devops_ngw.id
}

resource "aws_route_table_association" "private_rtb_association" {
  count          = length(var.private_subnet_cidr_blocks)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.private_rtb.id
}

