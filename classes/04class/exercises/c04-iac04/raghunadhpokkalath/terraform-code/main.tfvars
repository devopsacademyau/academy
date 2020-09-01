vpc               = { "id" = "vpc-0eb0b59f6a096004c", "cidr" = "10.0.0.0/16" }
public_subnet_ids = ["subnet-0d16c009298908459", "subnet-0c3129b5cccee961c"]
ami_id            = "ami-0a58e22c727337c51"
tags              = { "alb_sg" = "devopsacademy-iac-alb-sg", "ec2_sg" = "devopsacademy-iac-ec2-sg", "ec2" = "devopsacademy-iac-ec2", "alb" = "devopsacademy-iac-lb" }
scales            = { "up" = 1, "down" = -1 }