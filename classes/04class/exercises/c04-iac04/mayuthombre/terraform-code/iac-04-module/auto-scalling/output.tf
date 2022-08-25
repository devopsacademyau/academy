
output "arn" {
  value       = aws_lb_target_group.mayu_tg.arn
  description = "Newly created target group ARN"
}