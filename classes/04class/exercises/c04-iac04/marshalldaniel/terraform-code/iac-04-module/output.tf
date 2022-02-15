output "alb_fqdn" {
  value = try(aws_lb.iac04-alb.dns_name, "")
}
