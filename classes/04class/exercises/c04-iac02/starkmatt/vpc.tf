data "aws_availability_zones" "iac-azs" {
    state = "available"
}

resource "aws_vpc" "devopsacademy-iac" {
  cidr_block = "${var.cidr_vpc}"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "devopsacademy-vpc-iac"
  }
}

resource "aws_eip" "devops-iac-eip" {
  vpc=true
}

resource "aws_internet_gateway" "devops-terra-igw" {
  vpc_id = "${aws_vpc.devopsacademy-iac.id}"
  tags = {
    Name ="terra-igw"
  }
}

resource "aws_nat_gateway" "devops-terra-nat" {
  allocation_id           = "${aws_eip.devops-iac-eip.id}"
  subnet_id               = "${aws_subnet.public-iac-a.id}"
  tags = { 
    Name = "devops-iac-nat"
  }
}

resource "aws_subnet" "private-iac-a" {
  vpc_id                  = "${aws_vpc.devopsacademy-iac.id}"
  cidr_block              = "${var.private_subnet-a}"
  availability_zone       = "${data.aws_availability_zones.iac-azs.names[0]}"
  tags = {
    Name = "private-subnet-a"
  }
}

resource "aws_subnet" "private-iac-b" {
  vpc_id                  = "${aws_vpc.devopsacademy-iac.id}"
  cidr_block              = "${var.private_subnet-b}"
  availability_zone       = "${data.aws_availability_zones.iac-azs.names[2]}"
  tags = {
    Name = "private-subnet-b"
  }
}

resource "aws_subnet" "public-iac-a" {
  vpc_id                  = "${aws_vpc.devopsacademy-iac.id}"
  cidr_block              = "${var.public_subnet-a}"
  availability_zone       = "${data.aws_availability_zones.iac-azs.names[1]}"
  tags = {
    Name = "public-subnet-a"
  } 
}

resource "aws_subnet" "public-iac-b" {
  vpc_id                  = "${aws_vpc.devopsacademy-iac.id}"
  cidr_block              = "${var.public_subnet-b}"
  availability_zone       = "${data.aws_availability_zones.iac-azs.names[0]}"
  tags = {
    Name = "public-subnet-b"
  } 
}

resource "aws_route_table" "public-access" {
  vpc_id = "${aws_vpc.devopsacademy-iac.id}"

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.devops-terra-igw.id}"
 }
}

resource "aws_default_route_table" "private-access" {
  default_route_table_id = "${aws_vpc.devopsacademy-iac.default_route_table_id}"
  tags = {
    Name = "devopsa-default-route"
  }
}

resource "aws_route_table_association" "public-access-a-rt" {
  subnet_id      = aws_subnet.public-iac-a.id
  route_table_id = "${aws_route_table.public-access.id}"
}

resource "aws_route_table_association" "public-access-b-rt" {
  subnet_id      = aws_subnet.public-iac-b.id
  route_table_id = "${aws_route_table.public-access.id}"
}

resource "aws_route_table_association" "private-access-a-rt" {
  subnet_id      = aws_subnet.private-iac-a.id
  route_table_id = "${aws_vpc.devopsacademy-iac.default_route_table_id}"
}

resource "aws_route_table_association" "private-access-b-rt" {
  subnet_id      = aws_subnet.private-iac-b.id
  route_table_id = "${aws_vpc.devopsacademy-iac.default_route_table_id}"
}
