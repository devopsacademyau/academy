resource "aws_ecs_cluster" "ecs_app" {
  name = "${var.project_name}-${var.app_name}-ecs-cluster"
}

resource "aws_security_group" "ecs_app_nodes" {
  name   = "${var.project_name}-${var.app_name}-ecs-nodes-sg"
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.project_name}-${var.app_name}-ecs-nodes-sg"
  }
}

# resource "aws_security_group_rule" "all_from_alb_to_ecs_nodes" {
#   count = var.alb ? 1 : 0

#   description              = "from ALB"
#   type                     = "ingress"
#   from_port                = 0
#   to_port                  = 0
#   protocol                 = "-1"
#   security_group_id        = aws_security_group.ecs_nodes.id
#   source_security_group_id = aws_security_group.alb[0].id
# }

resource "aws_security_group_rule" "all_traffic_nodes" {
  description              = "Allow traffic between ecs nodes"
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.ecs_app_nodes.id
  source_security_group_id = aws_security_group.ecs_app_nodes.id
}

resource "aws_security_group_rule" "all_to_internet" {
  description       = "egress to internet"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.ecs_app_nodes.id
  cidr_blocks       = ["0.0.0.0/0"]
}
