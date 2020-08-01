# Create the VPC first
resource "aws_vpc" "doa_iac_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "devopsacademy-iac"
  }
}

# A NACL for our new VPC
# The from_port and to_port values will be ignored as the protocol value is set to all
resource "aws_network_acl" "main" {
  vpc_id = aws_vpc.doa_iac_vpc.id

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
    cidr_block = "121.200.5.90/32"
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
    cidr_block = "121.200.5.90/32"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "iac-vpc-nacl"
  }
}

# Create IGW and attach to the VPC
resource "aws_internet_gateway" "iac_vpc_gw" {
  vpc_id = aws_vpc.doa_iac_vpc.id

  tags = {
    Name = "iac-vpc-igw"
  }
}

# Create subnets
resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.doa_iac_vpc.id
  cidr_block        = var.subnets.private_subnet_a.cidr
  availability_zone = var.subnets.private_subnet_a.az
  tags = {
    Name = var.subnets.private_subnet_a.name
  }
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.doa_iac_vpc.id
  cidr_block        = var.subnets.private_subnet_b.cidr
  availability_zone = var.subnets.private_subnet_b.az
  tags = {
    Name = var.subnets.private_subnet_b.name
  }
}

resource "aws_subnet" "public_a" {
  vpc_id            = aws_vpc.doa_iac_vpc.id
  cidr_block        = var.subnets.public_subnet_a.cidr
  availability_zone = var.subnets.public_subnet_a.az
  tags = {
    Name = var.subnets.public_subnet_a.name
  }
}

resource "aws_subnet" "public_b" {
  vpc_id            = aws_vpc.doa_iac_vpc.id
  cidr_block        = var.subnets.public_subnet_b.cidr
  availability_zone = var.subnets.public_subnet_b.az
  tags = {
    Name = var.subnets.public_subnet_b.name
  }
}

# Route table for public subnets
resource "aws_route_table" "iac_vpc_public_rt" {
  vpc_id = aws_vpc.doa_iac_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.iac_vpc_gw.id
  }

  tags = {
    Name = "iac-vpc-public-rt"
  }
}

# Associate public subnets with the public RT
resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.iac_vpc_public_rt.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.iac_vpc_public_rt.id
}

# Create Elastic IP for the NAT GW
resource "aws_eip" "iac_nat_eip" {

}

# Create a NAT Gateway in public subnet-a
resource "aws_nat_gateway" "iac_vpc_nat_gw" {
  allocation_id = aws_eip.iac_nat_eip.id
  subnet_id     = aws_subnet.private_a.id
  depends_on    = [aws_internet_gateway.iac_vpc_gw]
  tags = {
    Name = "iac-vpc-nat-gw"
  }
}

# Route table for private subnets
resource "aws_route_table" "iac_vpc_private_rt" {
  vpc_id = aws_vpc.doa_iac_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.iac_vpc_nat_gw.id
  }
  tags = {
    Name = "iac-vpc-private-rt"
  }
}

# Associate private subnets with the private RT
resource "aws_route_table_association" "private_a" {
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.iac_vpc_private_rt.id
}

resource "aws_route_table_association" "private_b" {
  subnet_id      = aws_subnet.private_b.id
  route_table_id = aws_route_table.iac_vpc_private_rt.id
}