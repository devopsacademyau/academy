resource "aws_vpc" "devopsacademy-iac" {
  cidr_block           = "${var.aws_ip_cidr_range}"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "devopsacademy-iac"
  }
}

resource "aws_internet_gateway" "da-igw" {
  vpc_id = "${aws_vpc.devopsacademy-iac.id}"

  tags = {
    Name = "devopsacademy-igw-iac"
  }
}

resource "aws_subnet" "subnet1" {
  cidr_block              = "${var.subnet-cidr["subnet1"]}"
  vpc_id                  = "${aws_vpc.devopsacademy-iac.id}"
  availability_zone       = "ap-southeast-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.subnet-name["subnet1"]}"
  }
}

resource "aws_subnet" "subnet2" {
  cidr_block              = "${var.subnet-cidr["subnet2"]}"
  vpc_id                  = "${aws_vpc.devopsacademy-iac.id}"
  availability_zone       = "ap-southeast-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.subnet-name["subnet2"]}"
  }
}


resource "aws_subnet" "subnet3" {
  cidr_block        = "${var.subnet-cidr["subnet3"]}"
  vpc_id            = "${aws_vpc.devopsacademy-iac.id}"
  availability_zone = "ap-southeast-2b"
  tags = {
    Name = "${var.subnet-name["subnet3"]}"
  }
}

resource "aws_subnet" "subnet4" {
  cidr_block        = "${var.subnet-cidr["subnet4"]}"
  vpc_id            = "${aws_vpc.devopsacademy-iac.id}"
  availability_zone = "ap-southeast-2c"
  tags = {
    Name = "${var.subnet-name["subnet4"]}"
  }
}

resource "aws_eip" "da-eip" {
  vpc = true
}

resource "aws_nat_gateway" "da-ngw" {
  allocation_id = "${aws_eip.da-eip.id}"
  subnet_id     = "${aws_subnet.subnet1.id}"
}



resource "aws_route_table" "rt1" {
  vpc_id = "${aws_vpc.devopsacademy-iac.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.da-igw.id}"
  }

  tags = {
    Name = "da-rt1"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.subnet1.id}"
  route_table_id = "${aws_route_table.rt1.id}"
}


resource "aws_route_table_association" "b" {
  subnet_id      = "${aws_subnet.subnet2.id}"
  route_table_id = "${aws_route_table.rt1.id}"
}


resource "aws_route_table" "rt2" {
  vpc_id = "${aws_vpc.devopsacademy-iac.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.da-ngw.id}"
  }

  tags = {
    Name = "da-rt2"
  }
}

resource "aws_route_table_association" "c" {
  subnet_id      = "${aws_subnet.subnet3.id}"
  route_table_id = "${aws_route_table.rt2.id}"
}


resource "aws_route_table_association" "d" {
  subnet_id      = "${aws_subnet.subnet4.id}"
  route_table_id = "${aws_route_table.rt2.id}"
}

