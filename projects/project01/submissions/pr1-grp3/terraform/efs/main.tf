resource "aws_efs_file_system" "project_efs" {
    creation_token = "${var.project_name}-file-system"
    throughput_mode = "bursting"
    performance_mode = "generalPurpose"
    encrypted = true
}
resource "aws_efs_mount_target" "project_mount_target" {
    count = length(var.private_subnet_id)
    file_system_id = aws_efs_file_system.project_efs.id
    subnet_id      = element(var.private_subnet_id, count.index)
    security_groups = [aws_security_group.project_security_group.id]
}
resource "aws_security_group" "project_security_group" {
    name        = "${var.project_name}-efs-sg"
    description = "Security Group for Elastic File System"
    vpc_id      = var.vpc_id

    ingress {
    description = "ECS Access"
        from_port   = 2049
        to_port     = 2049
        protocol    = "tcp"
        security_groups = [var.ecs_nodes_secgrp_id] 
    }
    egress {
        description = "out"
        from_port = 0
        to_port = 0
        protocol = -1
        security_groups = [var.ecs_nodes_secgrp_id]
    }
    tags = {
        Name = "${var.project_name}-efs-sg"
    }
}