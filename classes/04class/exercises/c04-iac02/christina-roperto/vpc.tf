resource "aws_vpc" "devops-iac02" {
  cidr_block           = var.cidr_vpc
  enable_dns_hostnames = "true" # provides an internal host name
  tags = {
    Name = "devops-iac02-vpc"
  }
}


data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "public" {
  count = 2

  vpc_id            = aws_vpc.devops-iac02.id
  cidr_block        = cidrsubnet(aws_vpc.devops-iac02.cidr_block, 8, count.index * 2 + 100) # even networks for public subnets
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "public-sub-${data.aws_availability_zones.available.names[count.index]}"
  }
}

resource "aws_subnet" "private" {
  count = 2

  vpc_id            = aws_vpc.devops-iac02.id
  cidr_block        = cidrsubnet(aws_vpc.devops-iac02.cidr_block, 8, count.index * 2 + 101) # odd networks for private subnets
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "private-sub-${data.aws_availability_zones.available.names[count.index]}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.devops-iac02.id
  tags = {
    Name = "devops-iac02-igw"
  }
}

resource "aws_eip" "devops-iac02" {
  vpc                       = true
  associate_with_private_ip = aws_subnet.public[0].id
  depends_on                = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.devops-iac02.id
  subnet_id     = aws_subnet.public[0].id
  tags = {
    Name = "gw NAT"
  }
}

resource "aws_route_table" "iac02-rt-public" {
  vpc_id = aws_vpc.devops-iac02.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "iac02-rt-public"
  }
}

resource "aws_route_table" "iac02-rt-private" {
  vpc_id = aws_vpc.devops-iac02.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }
  tags = {
    Name = "iac02-rt-private"
  }
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.iac02-rt-public.id
}


resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.iac02-rt-private.id
}

# setting the route table to be the main one
resource "aws_main_route_table_association" "public-main" {
  vpc_id         = aws_vpc.devops-iac02.id
  route_table_id = aws_route_table.iac02-rt-public.id
}


