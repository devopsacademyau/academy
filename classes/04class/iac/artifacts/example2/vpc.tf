resource "aws_vpc" "devops_academy" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "DevopsAcademy"
  }
}
resource "aws_subnet" "subnet_private_a" {
  vpc_id     = "${aws_vpc.devops_academy.id}"
  cidr_block = "192.168.10.0/24"
  availability_zone = "ap-southeast-2a"
  tags = {
    Name = "private-a"
  }
}
resource "aws_subnet" "subnet_private_b" {
  vpc_id     = "${aws_vpc.devops_academy.id}"
  cidr_block = "192.168.20.0/24"
  availability_zone = "ap-southeast-2b"
  tags = {
    Name = "private-b"
  }
}
resource "aws_subnet" "subnet_public_a" {
  vpc_id     = "${aws_vpc.devops_academy.id}"
  cidr_block = "192.168.100.0/24"
  availability_zone = "ap-southeast-2a"
  tags = {
    Name = "public-a"
  }
}
resource "aws_subnet" "subnet_public_b" {
  vpc_id     = "${aws_vpc.devops_academy.id}"
  cidr_block = "192.168.200.0/24"
  availability_zone = "ap-southeast-2b"
  tags = {
    Name = "public-b"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.devops_academy.id}"
  tags = {
    Name = "DevOpsAcademy-IGW"
  }
}
resource "aws_route_table" "route_table_public" {
  vpc_id = "${aws_vpc.devops_academy.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
  tags = {
    Name = "PublicRoutingTable"
  }
}
resource "aws_route_table_association" "route_public_a" {
  subnet_id      = "${aws_subnet.subnet_public_a.id}"
  route_table_id = "${aws_route_table.route_table_public.id}"
}

resource "aws_route_table_association" "route_public_b" {
  subnet_id      = "${aws_subnet.subnet_public_b.id}"
  route_table_id = "${aws_route_table.route_table_public.id}"
}

resource "aws_eip" "natgw_a" {
  vpc = true
}

resource "aws_nat_gateway" "gw_a" {
  allocation_id = "${aws_eip.natgw_a.id}"
  subnet_id     = "${aws_subnet.subnet_public_a.id}"
  tags = {
    Name = "NATGW-A"
  }
}
resource "aws_route_table" "route_table_private" {
  vpc_id = "${aws_vpc.devops_academy.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.gw_a.id}"
  }
  tags = {
    Name = "PrivateRoutingTable"
  }
}
resource "aws_route_table_association" "route_private_a" {
  subnet_id      = "${aws_subnet.subnet_private_a.id}"
  route_table_id = "${aws_route_table.route_table_private.id}"
}
resource "aws_route_table_association" "route_private_b" {
  subnet_id      = "${aws_subnet.subnet_private_b.id}"
  route_table_id = "${aws_route_table.route_table_private.id}"
}