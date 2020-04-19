


resource "aws_autoscaling_group" "ecs" {
  name = "${var.project_name}-${var.app_name}-ecs-node"

  vpc_zone_identifier = var.private_subnets_ids

  min_size = var.ecs_nodes.asg.min_size
  max_size = var.ecs_nodes.asg.max_size

  health_check_grace_period = var.ecs_nodes.asg.health_check_grace_period

  target_group_arns = var.ecs_nodes.asg.target_group_arns
  default_cooldown  = var.ecs_nodes.asg.default_cooldown

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.ecs_node_instance_lc.id
        version            = "$Latest"
      }

      override {
        instance_type = var.ecs_nodes.asg.instance_type_1
      }

      override {
        instance_type = var.ecs_nodes.asg.instance_type_1
      }

      override {
        instance_type = var.ecs_nodes.asg.instance_type_1
      }
    }

    instances_distribution {
      spot_instance_pools                      = var.ecs_nodes.asg.spot_instance_pools
      on_demand_base_capacity                  = var.ecs_nodes.asg.on_demand_base_capacity
      on_demand_percentage_above_base_capacity = var.ecs_nodes.asg.on_demand_percentage
    }
  }

  tag {
    key                 = "Name"
    value               = "${var.project_name}-${var.app_name}-ecs-node"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_template" "ecs_node_instance_lc" {
  name_prefix = "${var.project_name}-${var.app_name}-ecs-node-lc"

  image_id = data.aws_ami.ecs_optimized.id

  instance_initiated_shutdown_behavior = "terminate"
  instance_type                        = var.ecs_nodes.asg.instance_type_1
  vpc_security_group_ids               = [aws_security_group.ecs_app_nodes.id]
  user_data                            = base64encode(data.template_file.userdata.rendered)

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = var.ecs_nodes.lc.ebs_root_size
    }
  }

  iam_instance_profile {
    name = aws_iam_instance_profile.ecs_node_instance_profile.name
  }
}

data "aws_ami" "ecs_optimized" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-*-amazon-ecs-optimized"]
  }
}

data "template_file" "userdata" {
  template = file("${path.module}/userdata.tpl")

  vars = {
    ecs_cluster_name = aws_ecs_cluster.ecs_app.name
  }
}
