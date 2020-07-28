output "alb_dns_name" {
  description = "ALB DNS name"
  value       = aws_alb.alb.dns_name
}

output "alb_tg_arn" {
  description = "ALB TG ARN"
  value       = aws_alb_target_group.alb_tg.arn
}