resource "aws_vpc" "devopsacademyiac" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "devopsacademy-iac"
  }
}

resource "aws_network_acl" "main" {
  vpc_id = aws_vpc.devopsacademyiac.id

  egress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.0.0.0/16"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "all"
    rule_no    = 200
    action     = "allow"
    cidr_block = "180.150.58.136/32"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "all"
    rule_no    = 300
    action     = "allow"
    cidr_block = "10.0.0.0/16"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "all"
    rule_no    = 400
    action     = "allow"
    cidr_block = "180.150.58.136/32"
    from_port  = 0
    to_port    = 0
  }

}

resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.devopsacademyiac.id
}

resource "aws_subnet" "private_subnet_a" {
  vpc_id            = aws_vpc.devopsacademyiac.id
  cidr_block        = var.subnets.private_subnet_a.cidr
  availability_zone = var.subnets.private_subnet_a.az
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id            = aws_vpc.devopsacademyiac.id
  cidr_block        = var.subnets.private_subnet_b.cidr
  availability_zone = var.subnets.private_subnet_b.az
}

resource "aws_subnet" "public_subnet_a" {
  vpc_id            = aws_vpc.devopsacademyiac.id
  cidr_block        = var.subnets.public_subnet_a.cidr
  availability_zone = var.subnets.public_subnet_a.az
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id            = aws_vpc.devopsacademyiac.id
  cidr_block        = var.subnets.public_subnet_b.cidr
  availability_zone = var.subnets.public_subnet_b.az
}

resource "aws_route_table" "iac_vpc_public_rt" {
  vpc_id = aws_vpc.devopsacademyiac.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gw.id
  }

} 

resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.iac_vpc_public_rt.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.iac_vpc_public_rt.id
}

resource "aws_eip" "nat_ip" {

}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_ip.id
  subnet_id     = aws_subnet.private_subnet_a.id
  depends_on    = [aws_internet_gateway.internet_gw]

}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.devopsacademyiac.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

}

resource "aws_route_table_association" "private_subnet_a" {
  subnet_id      = aws_subnet.private_subnet_a.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "private_subnet_b" {
  subnet_id      = aws_subnet.private_subnet_b.id
  route_table_id = aws_route_table.route_table.id
}