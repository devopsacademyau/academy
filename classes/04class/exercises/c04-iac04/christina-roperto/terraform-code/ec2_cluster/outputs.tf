output "dns_name" {
  value = "http://${aws_lb.this.dns_name}"
}

output "auto_scaling_policy" {
  value = {
    "scaling_up" : aws_autoscaling_policy.up.scaling_adjustment,
  "scaling_down" : aws_autoscaling_policy.down.scaling_adjustment }
}
