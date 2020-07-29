vpc               = { "id" = "vpc-057dd5667c8b9c709", "cidr" = "10.0.0.0/16" }
public_subnet_ids = ["subnet-0689a8a1e90b115e4", "subnet-07b1bca70e911674d"]
ami_id            = "ami-0a58e22c727337c51"
tags              = { "alb_sg" = "devopsacademy-iac-alb-sg", "ec2_sg" = "devopsacademy-iac-ec2-sg", "ec2" = "devopsacademy-iac-ec2", "alb" = "devopsacademy-iac-lb" }
scales             = { "up" = 1, "down" = -1 }
