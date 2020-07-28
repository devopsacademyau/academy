# ALB FQDN(the DNS that you use to access the ALB endpoint)
output doa_alb_fdqn {
  value = aws_lb.doa_alb.dns_name
}