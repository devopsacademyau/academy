####### define VPC #######
resource "aws_vpc" "devopsacademy-vpc-iac" {
  cidr_block = "${var.vpc_cidr}"

  tags = {
    Name = "vpc iac"
  }
}

####### define the subnets #######
resource "aws_subnet" "public-subnet-iac" {
  count = "${length(var.subnet_cidrs_public)}"

  vpc_id            = "${aws_vpc.devopsacademy-vpc-iac.id}"
  cidr_block        = "${var.subnet_cidrs_public[count.index]}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"

  tags = {
    Name = "private-${data.aws_availability_zones.available.names[count.index]}"
  }
}
resource "aws_subnet" "private-subnet-iac" {
  count = "${length(var.subnet_cidrs_private)}"

  vpc_id            = "${aws_vpc.devopsacademy-vpc-iac.id}"
  cidr_block        = "${var.subnet_cidrs_private[count.index]}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"

  tags = {
    Name = "private-${data.aws_availability_zones.available.names[count.index]}"
  }
}

####### define the internet gateway #######
resource "aws_internet_gateway" "devopsacademy-igw-iac" {
  vpc_id = "${aws_vpc.devopsacademy-vpc-iac.id}"

  tags = {
    Name = "vpc igw"
  }
}

####### define the elastic IP #######
resource "aws_eip" "devopsacademy-eip-iac" {
  vpc = true

}

resource "aws_nat_gateway" "devopsacademy-nat-iac" {
  allocation_id = "${aws_eip.devopsacademy-eip-iac.id}"
  # selectiong the first subnet 
  subnet_id = "${element(aws_subnet.private-subnet-iac.*.id, 1)}"

  tags = {
    Name = "NAT gateway devopsacademy"
  }
}


####### define the route tables #######
resource "aws_route_table" "devopsacademy-public-rt-iac" {
  vpc_id = "${aws_vpc.devopsacademy-vpc-iac.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.devopsacademy-igw-iac.id}"
  }

  tags = {
    Name = "public subnets route table"
  }

}
resource "aws_route_table" "devopsacademy-private-rt-iac" {
  vpc_id = "${aws_vpc.devopsacademy-vpc-iac.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.devopsacademy-nat-iac.id}"
  }

  tags = {
    Name = "private subnets route table"
  }

}
 
# attaching the table route to the subnets
resource "aws_route_table_association" "public-rt-iac" {
  count = "${length(var.subnet_cidrs_public)}"

  subnet_id      = "${element(aws_subnet.public-subnet-iac.*.id,count.index)}"
  route_table_id = "${aws_route_table.devopsacademy-public-rt-iac.id}"
}
resource "aws_route_table_association" "private-rt-iac" {
  count = "${length(var.subnet_cidrs_private)}"

  subnet_id      = "${element(aws_subnet.private-subnet-iac.*.id,count.index)}"
  route_table_id = "${aws_route_table.devopsacademy-private-rt-iac.id}"
}

# defining the security group for the subnets
resource "aws_security_group" "devopsacademy_public_sg_iac" {
  #name        = "sg-public-iac"
  description = "SSH access from home to AWS"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = "${aws_vpc.devopsacademy-vpc-iac.id}"

  tags = {
    Name = "public-security-group-iac"
  }
}
resource "aws_security_group" "devopsacademy_private_sg_iac" {
  #count = "${length(var.subnet_cidrs_private)}"

  #name        = "sg-private-iac"
  description = "SSH access only from public instances on AWS"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    # setting the public subnet which will be allowed to access the private subnet
    cidr_blocks = var.subnet_cidrs_public
  }

  vpc_id = "${aws_vpc.devopsacademy-vpc-iac.id}"

  tags = {
    Name = "private-security-group-iac"
  }
}

