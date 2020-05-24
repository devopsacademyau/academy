resource "aws_ecr_repository" "project_ecr" {
    name = "${var.projectname}-ecr"
    image_tag_mutability = "MUTABLE"
    image_scanning_configuration {
        scan_on_push = true
    }
}
resource "aws_ecr_repository_policy" "default" {
    repository = aws_ecr_repository.project_ecr.name
    policy = <<EOF
    {
    "Version": "2008-10-17",
    "Statement":{
        "Sid": "AllowPullPush",
        "Effect": "Allow",
        "Principal": {
            "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        },
        "Action": [
            "ecr:GetDownloadUrlForLayer",
            "ecr:BatchGetImage",
            "ecr:BatchCheckLayerAvailability",
            "ecr:GetDownloadUrlForLayer",
            "ecr:BatchGetImage",
            "ecr:BatchCheckLayerAvailability",
            "ecr:PutImage",
            "ecr:InitiateLayerUpload",
            "ecr:UploadLayerPart",
            "ecr:CompleteLayerUpload"
        ]
        }
    }
    EOF
}
data "aws_caller_identity" "current" {}