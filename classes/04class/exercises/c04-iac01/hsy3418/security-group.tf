//network.tf
// create the virtual private network
resource "aws_vpc" "dwe-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
}

// create the internet gateway
resource "aws_internet_gateway" "dwe-igw" {
  vpc_id = "${aws_vpc.dwe-vpc.id}"
 
  tags = {
    Name = "dwe-igw"
  }
}

// create a dedicated subnet
resource "aws_subnet" "dwe-subnet" {
  vpc_id            = "${aws_vpc.dwe-vpc.id}"
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-southeast-2a"
 
  tags = {
    Name = "dwe-subnet"
  }
}

/// create routing table which points to the internet gateway
resource "aws_route_table" "dwe-route" {
  vpc_id = "${aws_vpc.dwe-vpc.id}"
 
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.dwe-igw.id}"
  }
 
  tags = {
    Name = "dwe-igw"
  }
}

// associate the routing table with the subnet
resource "aws_route_table_association" "subnet-association" {
  subnet_id      = "${aws_subnet.dwe-subnet.id}"
  route_table_id = "${aws_route_table.dwe-route.id}"
}

//security.tf
resource "aws_security_group" "ingress-all-test" {
name = "allow-all-sg"
vpc_id      = "${aws_vpc.dwe-vpc.id}"
ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
from_port = 22
    to_port = 22
    protocol = "tcp"
  }
// Terraform removes the default rule
  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}