resource "aws_vpc" "this" {
  cidr_block           = var.cidr_vpc
  enable_dns_hostnames = "true" # provides an internal host name

  tags = {
    Name = var.exercise_name
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "public" {
  count = 2

  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(aws_vpc.this.cidr_block, 4, count.index + 1)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = "true"
  tags = {
    Name = "public_subnet_${data.aws_availability_zones.available.names[count.index]}_${var.exercise_name}"
  }
}

data "aws_ami" "amazon_owned" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"] # Amazon Linux free tier
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "igw_${var.exercise_name}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public_rt_${var.exercise_name}"
  }
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_main_route_table_association" "public_main" {
  vpc_id         = aws_vpc.this.id
  route_table_id = aws_route_table.public.id
}

module "ec2_cluster" {
  source            = "./ec2_cluster"
  image_id          = data.aws_ami.amazon_owned.id
  vpc_id            = aws_vpc.this.id
  exercise_name     = var.exercise_name
  subnet_public_ids = [for subnet in aws_subnet.public : subnet.id]
  scale_up          = var.scale_up
  scale_down        = var.scale_down

}

output "dns_name" {
  value = module.ec2_cluster.dns_name
}

output "auto_scaling_policy" {
  value = module.ec2_cluster.auto_scaling_policy
}
