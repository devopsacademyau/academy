# VPC

resource "aws_vpc" "devopsacademy-vpc-iac" {

    cidr_block       = "${var.vpc_cidr}"

    tags = {

    Name = "VPC IaC"

}

}



# Internet Gateway

resource "aws_internet_gateway" "devopsacademy-igw-iac" {

    vpc_id = "${aws_vpc.devopsacademy-vpc-iac.id}"

    tags = {

    Name = "IGW IaC"

    }

}



# Subnets - Public

resource "aws_subnet" "public" {

  count = "${length(var.subnets_public_cidr)}"

  vpc_id = "${aws_vpc.devopsacademy-vpc-iac.id}"

  cidr_block = "${element(var.subnets_public_cidr,count.index)}"

  availability_zone = "${element(var.azs,count.index)}"

  tags = {

    Name = "${var.subnets_public_name[count.index]}"

  }

}



# Route Table - Attach Internet Gateway 

resource "aws_route_table" "devopsacademy-rt-public-iac" {

  vpc_id = "${aws_vpc.devopsacademy-vpc-iac.id}"

  route {

    cidr_block = "0.0.0.0/0"

    gateway_id = "${aws_internet_gateway.devopsacademy-igw-iac.id}"

  }

  tags = {

    Name = "RT IGW IaC"

  }

}



# Route Table - Association With Public Subnets

resource "aws_route_table_association" "rt_igw_iac" {

  count = "${length(var.subnets_public_cidr)}"

  subnet_id      = "${element(aws_subnet.public.*.id,count.index)}"

  route_table_id = "${aws_route_table.devopsacademy-rt-public-iac.id}"

}



# Subnets - Private

resource "aws_subnet" "private" {

  count = "${length(var.subnets_private_cidr)}"

  vpc_id = "${aws_vpc.devopsacademy-vpc-iac.id}"

  cidr_block = "${element(var.subnets_private_cidr,count.index)}"

  availability_zone = "${element(var.azs,count.index)}"

  tags = {

    Name = "${var.subnets_private_name[count.index]}"

  }

}



# NAT Gateway

resource "aws_nat_gateway" "devopsacademy-ngw-iac" {

    count = "${length(var.subnets_private_cidr)}"

    allocation_id = "${var.eip_id[count.index]}"

    subnet_id      = "${element(aws_subnet.private.*.id,count.index)}"

    tags = {

    Name = "NGW IaC-${count.index+1}"

  }

}



# Route Table - Attach NAT Gateway 

resource "aws_route_table" "devopsacademy-rt-private-iac" {

  count = "${length(var.subnets_private_cidr)}"

  vpc_id = "${aws_vpc.devopsacademy-vpc-iac.id}"

  route {

    cidr_block = "0.0.0.0/0"

    #gateway_id = "${aws_nat_gateway.devopsacademy-ngw-iac.id}"

    gateway_id = "${element(aws_nat_gateway.devopsacademy-ngw-iac.*.id,count.index)}"

  }

  tags = {

    Name = "RT NGW IaC-${count.index+1}"

  }

}



# Route Table - Association With Private Subnets

resource "aws_route_table_association" "rt_ngw_iac" {

  count = "${length(var.subnets_private_cidr)}"

  subnet_id      = "${element(aws_subnet.private.*.id,count.index)}"

  #route_table_id = "${aws_route_table.devopsacademy-rt-private-iac.id}"

  route_table_id = "${aws_route_table.devopsacademy-rt-private-iac[count.index].id}"

}
