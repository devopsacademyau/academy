output "elb_dns" {
  value  = aws_elb.web_elb.dns_name
}