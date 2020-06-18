
output "arn" {
  value       = aws_lb_target_group.devops_target.arn
  description = "ARN Target Group"
}