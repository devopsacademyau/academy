output "ecs_nodes_secgrp_id" {
    value = aws_security_group.ecs-ec2-sg.id
}
output "account_id" {
  value = data.aws_caller_identity.current.account_id
}