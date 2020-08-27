vpc_cidr      = "10.0.0.0/16"
subnet_a_cidr = "10.0.1.0/24"
subnet_b_cidr = "10.0.2.0/24"
ami           = "ami-0ded330691a314693"

# ASG Configuration
max_size                 = "4"
min_size                 = "2"
desired_capacity         = "2"
mem_scale_up_threshold   = "90"
mem_scale_down_threshold = "40"
