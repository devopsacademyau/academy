vpc_cidr       = "10.0.0.0/16"
vpc_name       = "vpc-devops-academy-c04-iac04"
sub_pub_name_a = "public-subnet-a"
sub_pub_name_b = "public-subnet-b"
sub_pub_name_c = "public-subnet-c"
sub_pub_cidr_a = "10.0.1.0/24"
sub_pub_cidr_b = "10.0.2.0/24"
sub_pub_cidr_c = "10.0.3.0/24"
igw_name       = "igw-devops-academy-c04-iac04"
pub_rt_name    = "pub-rt-devops-academy-c04-iac04"
alb_name       = "alb-devops-academy-c04-iac04"
alb_sg_name    = "alb-sg-devops-academy-c04-iac04"
ami_id         = "ami-0a58e22c727337c51"
instance_type  = "t2.micro"
asg_desired    = "2"
asg_min        = "1"
asg_max        = "3"
my_ip          = "220.253.7.163/32"