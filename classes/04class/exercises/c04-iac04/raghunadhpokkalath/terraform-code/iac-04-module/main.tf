resource "aws_security_group" "allow_http" {
  name   = "allow_http"
  vpc_id = var.vpc.id
  ingress {
    description = "Allow http connection"
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
    Name = var.tags.alb_sg
  }
}

resource "aws_security_group" "allow_only_alb" {
    vpc_id = var.vpc.id   
  name   = "allow_only_alb"
  ingress {
    description = "Allow only ALB connection to EC2"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"  
    security_groups = [aws_security_group.allow_http.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.tags.ec2_sg
  }
}




resource "aws_lb" "this" {
  name               = "devops-academy-iac-lb"
  internal           = "false"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http.id]
  subnets            = var.public_subnet_ids

  tags = {
    Name = var.tags.alb
  }
}

resource "aws_lb_target_group" "this" {
  name     = "devops-academy-iac-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc.id
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}



resource "aws_launch_configuration" "this" {
  name_prefix = "devopsacademy-iac-launchconfig"
  image_id      = var.ami_id
  instance_type = "t2.micro"
  key_name = "EC2KeyPair"
  user_data_base64 =  base64encode(var.user_data)
  associate_public_ip_address = true
  security_groups =  [aws_security_group.allow_only_alb.id]
  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_autoscaling_group" "this" {
  name                = "devops-academy-asg-iac"
  vpc_zone_identifier = var.public_subnet_ids
  launch_configuration = aws_launch_configuration.this.id
  target_group_arns = [aws_lb_target_group.this.arn]
  min_size       = 1
  max_size       = 2

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_policy" "scale_up" {
  name                    = "devops-academy-asg-scale-up"
  scaling_adjustment      = var.scales.up
  adjustment_type         = "ChangeInCapacity"
  cooldown                = 300
  autoscaling_group_name = aws_autoscaling_group.this.name

}

resource "aws_autoscaling_policy" "scale_down" {
  name                    = "devops-academy-asg-scale-down"
  scaling_adjustment      = var.scales.down
  adjustment_type         = "ChangeInCapacity"
  cooldown                = 300
  autoscaling_group_name = aws_autoscaling_group.this.name
}





