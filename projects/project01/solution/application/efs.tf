resource "aws_efs_file_system" "shared_volume" {
  creation_token = "${var.project_name}-${var.app_name}-efs"
  encrypted      = true

  tags = {
    Name = "${var.project_name}-${var.app_name}-efs"
  }
}

resource "aws_efs_mount_target" "ecs" {
  count          = length(var.private_subnets_ids)
  file_system_id = aws_efs_file_system.shared_volume.id
  subnet_id      = element(var.private_subnets_ids, count.index)

  security_groups = [
    aws_security_group.efs.id
  ]

  lifecycle {
    ignore_changes = [subnet_id]
  }
}

resource "aws_security_group" "efs" {
  name        = "${var.project_name}-${var.app_name}-efs-sg"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.project_name}-${var.app_name}-efs-sg"
  }
}

resource "aws_security_group_rule" "efs_sg_allow_ecs" {
  description              = "SG to allow ecs nodes to connect to efs"
  type                     = "ingress"
  from_port                = 2049
  to_port                  = 2049
  protocol                 = "tcp"
  security_group_id        = aws_security_group.efs.id
  source_security_group_id = aws_security_group.ecs_app_nodes.id
}
