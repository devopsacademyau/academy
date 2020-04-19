resource "aws_iam_role" "ecs_node_role" {
  name               = "${var.project_name}-${var.app_name}-ecs-node-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_node_assume_role.json
}

resource "aws_iam_instance_profile" "ecs_node_instance_profile" {
  name = aws_iam_role.ecs_node_role.name
  role = aws_iam_role.ecs_node_role.name
}

data "aws_iam_policy_document" "ecs_node_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role_policy_attachment" "ecs_node_role_policy" {
  role       = aws_iam_role.ecs_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}
