resource "aws_rds_cluster" "default" {
  cluster_identifier      = "${var.project_name}-default"
  engine                  = var.db.engine
  engine_mode             = var.db.engine_mode
  db_subnet_group_name    = var.db.subnet_group
  vpc_security_group_ids  = [aws_security_group.default_sg.id]
  master_username         = var.db.username
  master_password         = random_string.default_password.result
  backup_retention_period = var.db.backup_retention
  apply_immediately       = true

  lifecycle {
    ignore_changes = [master_password]
  }
}

resource "aws_security_group" "default_sg" {
  name   = "${var.project_name}-rds-default-sg"
  vpc_id = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.ecs_app_nodes.id]
    description     = "Private connection"
  }
}

resource "random_string" "default_password" {
  length  = 16
  special = false
}
