
output "alb_fqdn" {
  value = aws_lb.devops_alb.dns_name
}
