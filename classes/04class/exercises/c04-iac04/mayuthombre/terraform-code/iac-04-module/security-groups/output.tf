output "alb_sg_id" {
  value       = aws_security_group.alb.id
  description = "Application Load Balancer Security Group ID"
}

output "ec2_sg_id" {
  value       = aws_security_group.allow_alb.id
  description = "EC2 Security Group ID"
}