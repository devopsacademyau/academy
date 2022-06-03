 # https://registry.terraform.io/providers/hashicorp/aws/4.16.0/docs/resources/iam_instance_profile  
resource "aws_iam_instance_profile" "bcurrey_iac_1_s3_access_profile" {
  name = "bcurrey_iac_1_s3_access_profile"
  role = aws_iam_role.bcurrey_iac_1_s3_access_role.name
}

# https://registry.terraform.io/providers/hashicorp/aws/4.16.0/docs/resources/iam_role
resource "aws_iam_role" "bcurrey_iac_1_s3_access_role" {
    name = "bcurrey_iac_1_s3_access_role"
    # Terraform's "jsonencode" function converts a
    # Terraform expression result to valid JSON syntax.
    managed_policy_arns = [aws_iam_policy.bcurrey_iac_1_s3_access_policy.arn]
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Sid = ""
                Principal = {
                    Service = "ec2.amazonaws.com"
                }
            },
        ]
    })
}

# https://registry.terraform.io/providers/hashicorp/aws/4.16.0/docs/resources/iam_policy
resource "aws_iam_policy" "bcurrey_iac_1_s3_access_policy" {
    name = "bcurrey_iac_1_s3_access_policy"
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect = "Allow"
                Action = "s3:*"
                Resource = aws_s3_bucket.bcurrey_iac_1_s3.arn
            }
        ]
    })
}
