data "aws_availability_zones" "available" {}

resource "aws_vpc" "devopsacademy_vpc" {
  cidr_block           = "${var.devopsacademy_vpc.cidr_block}"
  enable_dns_support   = "${var.devopsacademy_vpc.enable_dns_support}"
  enable_dns_hostnames = "${var.devopsacademy_vpc.enable_dns_hostnames}"
  enable_classiclink   = "${var.devopsacademy_vpc.enable_classiclink}"
  instance_tenancy     = "${var.devopsacademy_vpc.instance_tenancy}"

  tags = {
    Name = "${var.devopsacademy_vpc.name}"
  }
}

resource "aws_subnet" "private_subnet" {
  count                   = "${length(data.aws_availability_zones.available.names) - 1}"
  vpc_id                  = "${aws_vpc.devopsacademy_vpc.id}"
  cidr_block              = "${element(var.private_subnets.*.cidr_block, count.index)}"
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"
  map_public_ip_on_launch = false
  tags = {
    Name = "${element(var.private_subnets.*.name, count.index)}"
  }
}

resource "aws_subnet" "public_subnet" {
  count                   = "${length(data.aws_availability_zones.available.names) - 1}"
  vpc_id                  = "${aws_vpc.devopsacademy_vpc.id}"
  cidr_block              = "${element(var.public_subnets.*.cidr_block, count.index)}"
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"
  map_public_ip_on_launch = true
  tags = {
    Name = "${element(var.public_subnets.*.name, count.index)}"
  }
}

resource "aws_internet_gateway" "devopsacademy_igw" {
  vpc_id = "${aws_vpc.devopsacademy_vpc.id}"
  tags = {
    Name = "devopsacademy-igw"
  }
}

resource "aws_route_table" "devopsacademy_public_crt" {
  vpc_id = "${aws_vpc.devopsacademy_vpc.id}"

  route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    //CRT uses this IGW to reach internet
    gateway_id = "${aws_internet_gateway.devopsacademy_igw.id}"
  }

  tags = {
    Name = "devopsacademy-public-crt"
  }
}

resource "aws_route_table_association" "devopsacademy_crta_public_subnets" {
  count          = "${length(aws_subnet.public_subnet)}"
  subnet_id      = "${element(aws_subnet.public_subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.devopsacademy_public_crt.id}"
}

resource "aws_eip" "devopsacademy_nateip" {
  vpc = true
}

resource "aws_nat_gateway" "devopsacademy_ngw" {
  allocation_id = "${aws_eip.devopsacademy_nateip.id}"
  subnet_id     = "${element(aws_subnet.private_subnet.*.id, 0)}"
  tags = {
    Name = "devopsacademy-ngw"
  }
}

resource "aws_route_table" "devopsacademy_ngw_crt" {
  vpc_id = "${aws_vpc.devopsacademy_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.devopsacademy_ngw.id}"
  }
  tags = {
    Name = "devopsacademy-ngw-crt"
  }
}

resource "aws_route_table_association" "devopsacademy_crta_ngw" {
  count          = "${length(aws_subnet.private_subnet)}"
  subnet_id      = "${element(aws_subnet.private_subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.devopsacademy_ngw_crt.id}"
}

resource "aws_security_group" "allow_ssl" {
  name        = "DAC04IaC02-SG"
  description = "DAC04IaC02 Security Group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "DAC04IaC02-SG"
  }
}
