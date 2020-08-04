# VPC
# New VPC with a /16 CIDR
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpcCIDR
  instance_tenancy     = var.instanceTenancy
  enable_dns_support   = var.dnsSupport 
  enable_dns_hostnames = var.dnsHostNames
    tags = {
        Name = "${var.project}_vpc"
    }
}


data "aws_availability_zones" "available" {
  state = "available"
}


# Subnets
# 2 /24 public subnets(different AZs)
# 2 /24 private subnets(different AZs)


resource "aws_subnet" "subnet_public_1" {
   	 vpc_id            = aws_vpc.vpc.id
   	 cidr_block        = cidrsubnet(var.vpcCIDR, 8, 0)
    	availability_zone = data.aws_availability_zones.available.names[0]
	map_public_ip_on_launch = var.map_public_ip1
    	tags = {
       	Name = "${var.project}_${var.subnet_public_1}"
       	Tier = "public"
    	}
}

resource "aws_subnet" "subnet_private_1" {
   	 vpc_id            = aws_vpc.vpc.id
    	cidr_block        = cidrsubnet(var.vpcCIDR, 8, 1)
    	availability_zone = data.aws_availability_zones.available.names[0]
    	tags = {
       	Name = "${var.project}_${var.subnet_public_2}"
       	Tier = "private"
    	}
}

resource "aws_subnet" "subnet_public_2" {
    	vpc_id            = aws_vpc.vpc.id
    	cidr_block        = cidrsubnet(var.vpcCIDR, 8, 2)
    	availability_zone = data.aws_availability_zones.available.names[1]
    	map_public_ip_on_launch = var.map_public_ip2
    	tags = {
       	Name = "${var.project}_${var.subnet_private_1}"
       	Tier = "public"
    	}
}

resource "aws_subnet" "subnet_private_2" {
    vpc_id            = aws_vpc.vpc.id
    cidr_block        = cidrsubnet(var.vpcCIDR, 8, 3)
    availability_zone = data.aws_availability_zones.available.names[1]

    tags = {
       Name = "${var.project}_${var.subnet_private_2}"
       Tier = "private"
    }
}




# Internet Gateway
# Internet Gateway in place
resource "aws_internet_gateway" "IGW" {
    vpc_id = aws_vpc.vpc.id

    tags = {
       Name = "${var.project}_IGW"
    }
}



# Elastic IP for NAT Gateway
resource "aws_eip" "NAT_EIP" {
	 vpc      = true
}



# NAT Gateway
resource "aws_nat_gateway" "NAT_GW" {
  allocation_id = aws_eip.NAT_EIP.id
  subnet_id     = aws_subnet.subnet_public_1.id
  depends_on = [aws_internet_gateway.IGW]
	tags = {
    Name = "${var.project}_NAT_GW"
  }
}

# Route tables and assosications
# public
resource "aws_route_table" "route_table_PUB" {
    vpc_id = aws_vpc.vpc.id
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.IGW.id
    }
    tags = {
	Name = "${var.project}_route_table_PUB"
	}	
}
# private
resource "aws_route_table" "route_table_PRI" {
    vpc_id = aws_vpc.vpc.id
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_nat_gateway.NAT_GW.id
    }
    tags = {
	Name = "${var.project}_route_table_PRI"
	}
		
}

# route table associations
# public route tables
resource "aws_route_table_association" "public_1" {
    subnet_id = aws_subnet.subnet_public_1.id
    route_table_id = aws_route_table.route_table_PUB.id
}

resource "aws_route_table_association" "public_2" {
    subnet_id = aws_subnet.subnet_public_2.id
    route_table_id = aws_route_table.route_table_PUB.id
}

# private route tables
resource "aws_route_table_association" "private_1" {
    subnet_id = aws_subnet.subnet_private_1.id
    route_table_id = aws_route_table.route_table_PRI.id
}

resource "aws_route_table_association" "private_2" {
    subnet_id = aws_subnet.subnet_private_1.id
    route_table_id = aws_route_table.route_table_PRI.id
}
