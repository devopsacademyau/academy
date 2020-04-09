
// create a vpc
resource "aws_vpc" "devopsvpc" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
    enable_dns_support = true
}

// create a public subnet public-a
resource "aws_subnet" "public-a" {
    vpc_id = aws_vpc.devopsvpc.id
    cidr_block = var.public_subnets[0].cidr
    map_public_ip_on_launch = true # this makes it a public subnet
    availability_zone = var.public_subnets[0].az
    tags = {
        Name = var.public_subnets[0].name
    }
}

// create a public subnet public-b
resource "aws_subnet" "public-b" {
    vpc_id = aws_vpc.devopsvpc.id
    cidr_block = var.public_subnets[1].cidr
    map_public_ip_on_launch = true # this makes it a public subnet
    availability_zone = var.public_subnets[1].az
    tags = {
        Name = var.public_subnets[1].name
    }
}

// create a private subnet private-a
resource "aws_subnet" "private-a" {
    vpc_id = aws_vpc.devopsvpc.id
    cidr_block = var.private_subnets[0].cidr
    availability_zone = var.private_subnets[0].az
    tags = {
        Name = var.private_subnets[0].name
    }
}

// create a private subnet private-b
resource "aws_subnet" "private-b" {
    vpc_id = aws_vpc.devopsvpc.id
    cidr_block = var.private_subnets[1].cidr
    availability_zone = var.private_subnets[1].az
    tags = {
        Name = var.private_subnets[1].name
    }
}

# // create public subnets
# resource "aws_subnet" "public_subnet" {
#     # create two public subnets,cause there are two items
#     # in the public_subnets list
#     count = length(var.public_subnets)
    
#     vpc_id = aws_vpc.devopsvpc.id
#     cidr_block = var.public_subnets[count.index].cidr
#     map_public_ip_on_launch = true # this makes it a public subnet
#     availability_zone = var.public_subnets[count.index].az

#     tags = {
#         Name = var.public_subnets[count.index].name
#     } 
# }

# // create private subnets
# resource "aws_subnet" "private_subnet" {
#     # create two public subnets,cause there are two items
#     # in the public_subnets list
#     count = length(var.private_subnets)
    
#     vpc_id = aws_vpc.devopsvpc.id
#     cidr_block = var.private_subnets[count.index].cidr
#     availability_zone = var.private_subnets[count.index].az

#     tags = {
#         Name = var.private_subnets[count.index].name
#     }
  
# }




// create a public subnet public-b
# resource "aws_subnet" "${var.subnets[1]}" {
#     vpc_id = aws_vpc.devopsvpc.id
#     cidr_block = var.subnets_cidrs[var.subnets[1]]
#     map_public_ip_on_launch = true # this makes it a public subnet
#     availability_zone = var.availability_zone[1]

#     tags{
#         Name = var.subnets[1]
#     }
# }

// create a private subnet private-a
# resource "aws_subnet" "${var.subnets[2]}" {
#     vpc_id = "${aws_vpc.devopsvpc.id}"
#     cidr_block = "${var.subnets_cidrs[var.subnets[2]]}"
#     availability_zone = "${var.availability_zone[0]}"

#     tags{
#         Name = "${var.subnets[2]}"
#     }
# }

// create a private subnet private-b
# resource "aws_subnet" "${var.subnets[3]}" {
#     vpc_id = "${aws_vpc.devopsvpc.id}"
#     cidr_block = "${var.subnets_cidrs[var.subnets[3]]}"
#     availability_zone = "${var.availability_zone[1]}"

#     tags{
#         Name = "${var.subnets[3]}"
#     }
# }

// create a internet gateway
resource "aws_internet_gateway" "devopsad-igw" {
    vpc_id = aws_vpc.devopsvpc.id
    tags = {
        Name = "devopsad-igw"
    }
}

// create routing table which points to the internet gateway
resource "aws_route_table" "devopsad-igw-route" {
    vpc_id = aws_vpc.devopsvpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.devopsad-igw.id
    }
    tags = {
        Name = "devopsad-igw-route"
    }
}

// associate routetable with public-a subnet id
resource "aws_route_table_association" "public-a-subnet-association" {
    subnet_id = aws_subnet.public-a.id
    route_table_id = aws_route_table.devopsad-igw-route.id
}

// associate route table with public-b subnet id
resource "aws_route_table_association" "public-b-subnet-association" {
    subnet_id = aws_subnet.public-b.id
    route_table_id = aws_route_table.devopsad-igw-route.id
}


# // associate routetable with public-b subnet id
# resource "aws_route_table_association" "public-b-subnet-association" {
#     subnet_id = aws_subnet.var.public_subnets[1]
#     route_table_id = aws_route_table.devopsad-igw-route.id
# }


resource "aws_eip" "nateip" {
  vpc      = true
}

//create a nat gw
resource "aws_nat_gateway" "devopsad-ngw" {
    allocation_id = aws_eip.nateip.id
    subnet_id  = aws_subnet.private-b.id
    tags = {
        Name = "gw NAT"
    }
}

// create routing table which points to the ngw
resource "aws_route_table" "devopsad-ngw-route" {
    vpc_id = aws_vpc.devopsvpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.devopsad-ngw.id
    }
    tags = {
        Name = "devopsad-ngw-route"
    }
}


// associate routetable with private-a subnet id
resource "aws_route_table_association" "private-a-subnet-association" {
    subnet_id = aws_subnet.private-a.id
    route_table_id = aws_route_table.devopsad-ngw-route.id
}

// associate routetable with private-b subnet id
resource "aws_route_table_association" "private-b-subnet-association" {
    subnet_id = aws_subnet.private-b.id
    route_table_id = aws_route_table.devopsad-ngw-route.id
}