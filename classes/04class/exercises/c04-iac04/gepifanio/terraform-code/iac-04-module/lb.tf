resource "aws_lb" "lb" {
    name               = "terraform-asg-example"
    load_balancer_type = "application"

    subnets  = data.aws_subnet_ids.default.ids
    security_groups = [aws_security_group.sg_load_balancer.id]
}

resource "aws_lb_listener" "http" {
    load_balancer_arn = aws_lb.lb.arn
    port = 80
    protocol = "HTTP"

    default_action {
        type = "fixed-response"
        fixed_response {
        content_type = "text/plain"
        message_body = "404: page not found"
        status_code  = 404
        }
    }
}

resource "aws_lb_target_group" "asg" {
    name = "asg-example"
    port = 80
    protocol = "HTTP"
    vpc_id = data.aws_vpc.default.id
}