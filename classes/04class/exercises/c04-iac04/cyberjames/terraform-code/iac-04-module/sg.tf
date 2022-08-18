##########################################################################################
# Define security group to allow HTTP inbound to ALB
##########################################################################################
resource "aws_security_group" "sg_lb" {
  name   = "contino-james-lb"
  vpc_id = aws_vpc.vpc.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "contino-james"
  }
}
##########################################################################################
# Define security group for web servers to allow all traffic within VPC
##########################################################################################
resource "aws_security_group" "sg_web" {
  name   = "contino-james-web"
  vpc_id = aws_vpc.vpc.id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "contino-james"
  }
}