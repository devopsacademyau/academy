resource "aws_security_group" "sg_lb" {
    name   = "sg_lb"
    vpc_id = var.vpc_id

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_lb" "lb" {
    name               = "lb"
    internal           = false
    load_balancer_type = "application"
    subnets  = concat(var.public_subnets)
    security_groups = [aws_security_group.sg_lb.id]
}

resource "aws_lb_listener" "http" {
    load_balancer_arn = aws_lb.lb.arn
    port = 80
    protocol = "HTTP"

    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.asg.arn
    }
}

resource "aws_lb_target_group" "asg" {
    name = "asg"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id
}