
output "alb_fqdn" {
  value = module.app_load_balancer.dns
}
