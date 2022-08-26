output "alb_fqdn" {
  description = "Application Load Balancer FQDN"
  value       = module.web_app.alb_fqdn
}