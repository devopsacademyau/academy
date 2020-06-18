output "alb_sg_id" {
  value       = aws_security_group.alb.id
  description = "The Application Load Balance Security Group"
}

output "ec2_sg_id" {
  value       = aws_security_group.allow_alb.id
  description = "The EC2 Security Group"
}