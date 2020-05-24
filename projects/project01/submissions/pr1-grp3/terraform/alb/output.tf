output "alb_sg" {
    value = aws_security_group.alb-sg.id
    description = "loadbalancer security group"
}

output "target_group_arn" {
    value = aws_lb_target_group.lbtg.arn
    description = "loadbalancer target group arn"
}