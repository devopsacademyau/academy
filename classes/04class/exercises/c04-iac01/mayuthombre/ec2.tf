# Resource block for EC2 instance
resource "aws_instance" "mayu_c04_iac01" {
  ami                  = "ami-090fa75af13c156b4"                        # Specify AMI ID to use for instance creation
  instance_type        = "t2.micro"                                     # Define instance type/size
  key_name             = "MayuKey"                                      # Assign which key will be used for CLI access for this instance
  iam_instance_profile = aws_iam_instance_profile.S3Access_policy.id    # Attach instance profile if necessary to allow EC2 access to other AWS resources
  security_groups      = [aws_security_group.mayu_dojo_sg.name]         # Assign access to resources on your network. In this case access via SSH (port 22)
  depends_on = [
    aws_iam_role.EC2S3AccessRole                                        # Ensuring IAM role is created first so that it can be attached to instace after creation
  ]

  tags = {
    Name = "mayu-c04-iac01"                                              # Tag to identify and group resources
  }
}

