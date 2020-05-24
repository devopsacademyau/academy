resource "aws_rds_cluster" "rdsclu" {
    cluster_identifier      = "${var.project_name}-db-cluster"
    engine                  = "aurora-mysql"
    engine_version          = "5.7.mysql_aurora.2.07.2"
    db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
    vpc_security_group_ids  = [aws_security_group.rds-apps.id]
    database_name           = var.db_name
    master_username         = var.db_user_name
    master_password         = aws_ssm_parameter.db-passowrd.value 
    backup_retention_period = 1
    deletion_protection     = false
    apply_immediately       = true
    skip_final_snapshot     = true
    storage_encrypted       = true
}

resource "aws_rds_cluster_instance" "cluster_instances" {
    count                  = 1
    identifier             = "${var.project_name}-rds-instance"
    cluster_identifier     = aws_rds_cluster.rdsclu.id
    instance_class         = "db.t2.small"
    engine                 = "aurora-mysql"
    engine_version         = "5.7.mysql_aurora.2.07.2" 
    db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
}

resource "aws_db_subnet_group" "db_subnet_group" {
    name       = "db_subnet_group"
    subnet_ids = [var.private_subnet_id1, var.private_subnet_id2]

    tags = {
    Name = "My DB subnet group"
    }
}

resource "aws_security_group" "rds-apps" {
    name   = "${var.project_name}-rds-sg"
    vpc_id = var.vpc_id

    lifecycle {
        create_before_destroy = true
    }

    ingress {
        from_port       = 3306
        to_port         = 3306
        protocol        = "tcp"
        cidr_blocks     = [var.vpc_cidr]
        security_groups = [var.ecs_nodes_secgrp_id] 
    }

    egress {
        description = "out"
        from_port = 0
        to_port = 0
        protocol = -1
        security_groups = [var.ecs_nodes_secgrp_id] 
    }
}

resource "aws_ssm_parameter" "db-host" {
    name = var.wordpress_db_host_parameter
    description = "The wordpress db host"
    type        = "String"
    value       = "${aws_rds_cluster.rdsclu.endpoint}:3306"
}

resource "aws_ssm_parameter" "db-user" {
    name = var.wordpress_db_user_parameter
    description = "The wordpress db user"
    type        = "String"
    value       = var.db_user_name
}

resource "aws_ssm_parameter" "db-passowrd" {
    name = var.wordpress_db_password_parameter
    description = "The wordpress password"
    type        = "SecureString"
    value       = random_password.password.result
}

resource "aws_ssm_parameter" "db-name" {
    name = var.wordpress_db_name_parameter
    description = "The wordpress db name"
    type        = "String"
    value       = var.db_name
}

resource "random_password" "password" {
    length = 16
    special = true
    override_special = "@"
}

