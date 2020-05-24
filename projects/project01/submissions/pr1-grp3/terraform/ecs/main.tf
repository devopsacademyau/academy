resource "aws_ecs_cluster" "ecscluster" {
  name = "${var.projectname}-cluster"
}
resource "aws_security_group" "ecs-ec2-sg" {
    name   = "${var.projectname}-ecs-ec2-sg"
    vpc_id = var.vpc_id

    lifecycle {
        create_before_destroy = true
    }
    ingress {
        from_port       = 0
        to_port         = 0 
        protocol        = "-1" 
        cidr_blocks     = ["0.0.0.0/0"]
        security_groups = [var.alb_sg] 
        description     = "From ALB"
    }
    egress {
        from_port       = 0
        to_port         = 0 
        protocol        = "-1" 
        cidr_blocks     = ["0.0.0.0/0"]
        security_groups = [var.alb_sg] 
        description     = "From ALB"
    }
}
resource "aws_launch_configuration" "lc" {
  name = "${var.projectname}-lc"
  image_id = var.ami_id
  instance_type = var.inst_type
  key_name      = var.inst_key != "" ? var.inst_key : ""
  security_groups = [aws_security_group.ecs-ec2-sg.id]
  user_data = base64encode(data.template_file.userdata.rendered)
  iam_instance_profile = aws_iam_instance_profile.instprof.name
  lifecycle {
    create_before_destroy = true
  }

}
resource "aws_autoscaling_group" "asg" {
  desired_capacity   = var.asg_desired_capac
  max_size           = var.asg_max_size
  min_size           = var.asg_min_size
  launch_configuration = aws_launch_configuration.lc.name
  vpc_zone_identifier = [var.pub_sub1,var.pub_sub2]
}
data "template_file" "userdata" {
  template = file("${path.module}/userdata.tpl")
  vars = {
    ecs_cluster_name = aws_ecs_cluster.ecscluster.name
    efs_id = var.efs_id
  }
}
resource "aws_iam_role" "ecs_role" {
    name = "${var.projectname}-ecs_role"
    assume_role_policy = <<-EOF
    {
        "Version": "2008-10-17",
        "Statement": [
            {
                "Action": "sts:AssumeRole",
                "Principal": {
                    "Service": "ecs-tasks.amazonaws.com"
                },
                "Effect": "Allow",
                "Sid": ""
            }
        ]
    }
    EOF
}
resource "aws_iam_role_policy_attachment" "ecs_role_policy_attachment" {
  role      = aws_iam_role.ecs_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
resource "aws_iam_role_policy_attachment" "ecs_role_policy_attachment_ssm" {
  role     = aws_iam_role.ecs_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess"
}
data "template_file" "containerdata" {
  template = file("${path.module}/cd.json")
  vars = {
    db_host_arn = var.db_host_arn
    db_user_arn = var.db_user_arn
    db_passowrd_arn = var.db_passowrd_arn
    db_name_arn = var.db_name_arn
    rds_endpoint = var.rds_endpoint
    containerimage = var.containerimage
  }
}
resource "aws_ecs_task_definition" "wp-task" {
  family                = "wp-task"
  execution_role_arn = aws_iam_role.ecs_role.arn
  container_definitions = data.template_file.containerdata.rendered
  volume {
    name = "wordpress"
    host_path = "/mnt/efs/wordpress"
  } 
}
resource "aws_ecs_service" "wordpress-ecs-service" {
  name = "wordpress-ecs-service"
  cluster = aws_ecs_cluster.ecscluster.id
  task_definition = aws_ecs_task_definition.wp-task.family
  desired_count = 2
  load_balancer {
      target_group_arn = var.target_group_arn
      container_name   = "wordpress"
      container_port   = 80
  }
}
resource "aws_iam_role" "ecsrun" {
    name = "${var.projectname}-roleecsrun"
    assume_role_policy = <<-EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Action": "sts:AssumeRole",
                "Principal": {
                    "Service": "ec2.amazonaws.com"
                },
                "Effect": "Allow",
                "Sid": ""
            }
        ]
    }
    EOF
}
resource "aws_iam_role_policy_attachment" "ecs_node_role_policy" {
  role       = aws_iam_role.ecsrun.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}
resource "aws_iam_instance_profile" "instprof" {
    name    = "${var.projectname}-inst-prof"
    role    = aws_iam_role.ecsrun.name
}
resource "aws_cloudwatch_log_group" "log" {
  name              = "/ecs/${var.projectname}"
  retention_in_days = var.retention_in_days
}
data "aws_caller_identity" "current" {}