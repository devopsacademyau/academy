###############################################################################
# VPC variable values
###############################################################################
project_name          = "c04-iac04"
vpc_cidr              = "10.0.0.0/16"
vpc_tenancy           = "default"
enable_dns_hostnames  = true
azs                   = ["ap-southeast-2a", "ap-southeast-2b"]
private_subnet_suffix = "private"
private_subnets       = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnet_suffix  = "public"
public_subnets        = ["10.0.101.0/24", "10.0.102.0/24"]
create_igw            = true

###############################################################################
# Security group values
###############################################################################

###############################################################################
# Autoscaling group values
###############################################################################
asg_launch_template_desc          = "Default auto scaling group launch template for exercise c04-iac04"
asg_launch_template_instance_type = "t2.micro"
asg_min_size                      = 1
asg_max_size                      = 3
asg_desired_capacity              = 2
ec2_high_cpu_threshold            = 85
ec2_low_cpu_threshold             = 20

###############################################################################
# Application load balancer values
###############################################################################

###############################################################################
# Other values
###############################################################################
ec2_key_pair = "c04-iac04"
