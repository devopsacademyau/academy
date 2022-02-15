output "module_alb_fqdn" {
  value = try(module.iac-04-module.alb_fqdn, "")
}
