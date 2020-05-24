resource "aws_vpc" "main" {
    cidr_block = var.vpccidr
    enable_dns_hostnames = true
    tags = { Name = "${var.projectname}-vpc"}
}
resource "aws_subnet" "public-subs" {
    vpc_id = aws_vpc.main.id
    count = length(var.publicsubnets)
    cidr_block = var.publicsubnets[count.index].cidr
    availability_zone = var.publicsubnets[count.index].az
    map_public_ip_on_launch = var.publicsubnets[count.index].publicip
    tags = {
        Tier = "Public"
        Name = "${var.projectname}-${var.publicsubnets[count.index].name}"
    } 
}
resource "aws_subnet" "private-subs" {
    vpc_id = aws_vpc.main.id
    count = length(var.privatesubnets)
    cidr_block = var.privatesubnets[count.index].cidr
    availability_zone = var.privatesubnets[count.index].az
    map_public_ip_on_launch = var.privatesubnets[count.index].publicip
    tags = {
        Tier = "Private"
        Name = "${var.projectname}-${var.privatesubnets[count.index].name}"
    } 
}
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "${var.projectname}-igw"
    }
}
resource "aws_route_table" "rtpublic" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
        Name = "${var.projectname}-rtpublic"
    }
}
resource "aws_route_table" "rtprivate" {
    vpc_id = aws_vpc.main.id
    route {
            cidr_block = "0.0.0.0/0"
            nat_gateway_id = aws_nat_gateway.gw.id
        }
    tags = {
        Name = "${var.projectname}-rtprivate"
    }
}
resource "aws_route_table_association" "rtpublicsubnets" {
    count = length(aws_subnet.public-subs)
    subnet_id      = aws_subnet.public-subs[count.index].id
    route_table_id = aws_route_table.rtpublic.id
}
resource "aws_route_table_association" "rtprivatesubnets" {
    count = length(aws_subnet.private-subs)
    subnet_id      = aws_subnet.private-subs[count.index].id
    route_table_id = aws_route_table.rtprivate.id
}
resource "aws_network_acl" "private" {
    vpc_id = aws_vpc.main.id
    subnet_ids = aws_subnet.private-subs[*].id
    ingress {
        protocol   = -1
        rule_no    = 110
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
        }
    egress{
        protocol   = -1
        rule_no    = 110
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
        }
    tags = {
        Name = "${var.projectname}-private"
    }
}
resource "aws_network_acl" "public" {
    vpc_id = aws_vpc.main.id
    subnet_ids = aws_subnet.public-subs[*].id
    ingress {
        protocol = "tcp"
        rule_no = 110
        action = "allow"
        cidr_block = "0.0.0.0/0"
        from_port = 443
        to_port   = 443
      }
    ingress {
        protocol = "tcp"
        rule_no = 120
        action = "allow"
        cidr_block = "0.0.0.0/0"
        from_port = 80
        to_port   = 80
      }
    ingress {
        protocol = "tcp"
        rule_no = 130
        action = "allow"
        cidr_block = "0.0.0.0/0"
        from_port = 10000
        to_port   = 65535
        }
    egress{
        protocol = "tcp"
        rule_no = 110
        action = "allow"
        cidr_block = "0.0.0.0/0"
        from_port = 10000
        to_port   = 65535
    }
    tags = {
        Name = "${var.projectname}-public"
    }
}

resource "aws_nat_gateway" "gw" {
    allocation_id = aws_eip.nat.id
    subnet_id     = aws_subnet.public-subs[0].id
}

resource "aws_eip" "nat" {
    vpc      = true
}
