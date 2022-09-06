######################################################################
# Outputs of Terraform execution
######################################################################
output "alb_fqdn" {
  description = "Application Load Balancer FQDN"
  value       = module.alb.alb_fqdn
}