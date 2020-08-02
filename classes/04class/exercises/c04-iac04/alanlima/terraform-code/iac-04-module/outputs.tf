output "load_balancer" {
  description = "the load balancer definition created."
  value = {
    id       = aws_lb.devops.id
    dns_name = aws_lb.devops.dns_name
    subnets  = aws_lb.devops.subnets
  }
}