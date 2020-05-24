resource "aws_lb" "lb" {
    name               = "${var.projectname}-lb"
    internal           = false
    load_balancer_type = "application"
    security_groups    = [aws_security_group.alb-sg.id]
    subnets            = [var.pub_sub1, var.pub_sub2]
    tags = {
        Name = "${var.projectname}-lb"
    }
}
resource "aws_security_group" "alb-sg" {
    name   = "alb-sg"
    vpc_id = var.vpc_id

    lifecycle {
        create_before_destroy = true
    }
    ingress {

        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

}
resource "aws_lb_listener" "lblistener" {
    load_balancer_arn = aws_lb.lb.arn
    port = "443"
    protocol = "HTTPS"
    certificate_arn = var.certificate_arn
    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.lbtg.arn
    }
}
resource "aws_lb_target_group" "lbtg" {
    name     = "${var.projectname}-lb-tg"
    port     = 80
    protocol = "HTTP"
    vpc_id   = var.vpc_id
    health_check {
        protocol = "HTTPS"
        enabled = true
        interval = 300
        path = "/"
        matcher = "200"
    }
}
data "aws_route53_zone" "r53" {
  name = var.domainname
}
resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.r53.zone_id
  name    = "www.${data.aws_route53_zone.r53.name}"
  type    = "CNAME"
  ttl     = "30"
  records = [aws_lb.lb.dns_name]
}
