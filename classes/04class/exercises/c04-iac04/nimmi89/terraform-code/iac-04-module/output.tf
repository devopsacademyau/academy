output "lb_dns_name" {
  value = aws_lb.tf-da-lb.dns_name
}

output "lb_tg_arn" {
  value = aws_lb_target_group.tf-da-tg.arn
}
