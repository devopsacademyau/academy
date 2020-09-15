#  ELB listener: tcp/443 with domain name demo.dryonne.net backend: tcp/80 to the vms created by ASG

resource "aws_security_group" "myinstance" {
  name        = "${var.project_name}-${var.stack_name}-instance-sg"
  description = "security group for my instance"
  vpc_id      = var.vpc_id

  ingress {
    description = "Inbound SSH from Jumpbox"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = var.allowed_security_groups
  }

  ingress {
    description = "Inbound 80 from ELB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_security_group.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${var.stack_name}-instance-sg"
  }
}

resource "aws_security_group" "alb_security_group" {
  vpc_id      = var.vpc_id
  name        = "${var.project_name}-${var.stack_name}-elb-sg"
  description = "security group for load balancer"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80 #443
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project_name}-${var.stack_name}-alb-sg"
  }
}

