resource "aws_vpc" "vpc_devops" {
  cidr_block = var.vpc_cidr
  tags = merge(var.common_tags, {
    Name = "devopsacademy-iac"
  })
}

resource "aws_subnet" "public" {
  for_each                = var.public_subnets
  vpc_id                  = aws_vpc.vpc_devops.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.zone
  map_public_ip_on_launch = true
  tags = merge(var.common_tags, {
    Name = "devops-subnet-${each.key}"
  })
}

resource "aws_subnet" "private" {
  for_each          = var.private_subnets
  vpc_id            = aws_vpc.vpc_devops.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.zone
  tags = merge(var.common_tags, {
    Name = "devops-subnet-${each.key}"
  })
}

resource "aws_internet_gateway" "igw_devops" {
  vpc_id = aws_vpc.vpc_devops.id
  tags = merge(var.common_tags, {
    Name = "devops-igw"
  })
}

resource "aws_eip" "nat" {
  
}

resource "aws_nat_gateway" "ngw_devops" {
  allocation_id = aws_eip.nat.id
  subnet_id = values(aws_subnet.public)[0].id

  tags = merge(var.common_tags, {
    Name = "devops-ngw"
  })
}

resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.vpc_devops.id
  tags = merge(var.common_tags, {
    Name = "devops-public-rt"
  })

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_devops.id
  }
}

resource "aws_route_table" "rt_private" {
  vpc_id = aws_vpc.vpc_devops.id
  tags = merge(var.common_tags, {
    Name = "devops-private-rt"
  })

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw_devops.id
  }
}

resource "aws_route_table_association" "public_route_link" {
  for_each       = aws_subnet.public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.rt_public.id
}

resource "aws_route_table_association" "private_route_link" {
  for_each       = aws_subnet.private
  subnet_id      = each.value.id
  route_table_id = aws_route_table.rt_private.id
}