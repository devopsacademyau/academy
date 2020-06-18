// create a vpc
resource "aws_vpc" "iac04-vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
}

// create a public subnet public-a
resource "aws_subnet" "public-a-iac04" {
    vpc_id = aws_vpc.iac04-vpc.id
    cidr_block = var.subnets[0].cidr
    map_public_ip_on_launch = true # this makes it a public subnet
    availability_zone = var.subnets[0].az
    tags = {
        Name = var.subnets[0].name
    }
}

// create a public subnet public-b
resource "aws_subnet" "public-b-iac04" {
    vpc_id = aws_vpc.iac04-vpc.id
    cidr_block = var.subnets[1].cidr
    map_public_ip_on_launch = true # this makes it a public subnet
    availability_zone = var.subnets[1].az
    tags = {
        Name = var.subnets[1].name
    }
}


resource "aws_internet_gateway" "my_vpc_igw" {
   vpc_id = aws_vpc.iac04-vpc.id

   tags = {
     Name = "My VPC - Internet Gateway"
   }
}

resource "aws_route_table" "my_vpc_public" {
    vpc_id = aws_vpc.iac04-vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_vpc_igw.id
    }

    tags = {
        Name = "Public Subnets Route Table for My VPC"
    }
}

resource "aws_route_table_association" "my_vpc_a_public" {
    subnet_id = aws_subnet.public-a-iac04.id
    route_table_id = aws_route_table.my_vpc_public.id
}

resource "aws_route_table_association" "my_vpc_b_public" {
    subnet_id = aws_subnet.public-b-iac04.id
    route_table_id = aws_route_table.my_vpc_public.id
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP inbound connections"
  vpc_id = aws_vpc.iac04-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow HTTP Security Group"
  }
}

resource "aws_launch_configuration" "as_config" {
    name = "as_config"
    image_id = var.ami
    instance_type = "t2.micro"
    security_groups = [aws_security_group.allow_http.id]
    user_data = <<-EOF
    #!/bin/bash
    sudo amazon-linux-extras install nginx1.12 -y
    sudo nginx
    EOF
    associate_public_ip_address = true
}

resource "aws_elb" "web_elb" {
    name = "web-elb"
    security_groups = [aws_security_group.allow_http.id]
    subnets = [
        aws_subnet.public-a-iac04.id,
        aws_subnet.public-b-iac04.id
    ]
    listener {
        lb_port = 80
        lb_protocol = "http"
        instance_port = "80"
        instance_protocol = "http"
     }
}

resource "aws_autoscaling_group" "ad_asg" {
    name = "ad_asg"
    launch_configuration = aws_launch_configuration.as_config.name
    min_size = 1
    desired_capacity = 2
    max_size = 2

    load_balancers = [
        aws_elb.web_elb.id
    ]
    vpc_zone_identifier = [aws_subnet.public-a-iac04.id,aws_subnet.public-b-iac04.id]
}

resource "aws_autoscaling_policy" "web_policy_up" {
    name = var.asg_policies[0].name
    scaling_adjustment = var.asg_policies[0].scaling_adjustment
    adjustment_type = var.asg_policies[0].adjustment_type
    cooldown = var.asg_policies[0].cooldown
    autoscaling_group_name = aws_autoscaling_group.ad_asg.name
}

resource "aws_autoscaling_policy" "web_policy_down" {
    name = var.asg_policies[1].name
    scaling_adjustment = var.asg_policies[1].scaling_adjustment
    adjustment_type = var.asg_policies[1].adjustment_type
    cooldown = var.asg_policies[1].cooldown
    autoscaling_group_name = aws_autoscaling_group.ad_asg.name
}