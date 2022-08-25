#VPC values
vpc_cidr = "10.0.0.0/16"

#Public subnet values 
pub_sub_name_1 = "public-subnet-1"
pub_sub_name_2 = "public-subnet-2"
pub_sub_name_3 = "public-subnet-3"
pub_sub_cidr_1 = "10.0.1.0/24"
pub_sub_cidr_2 = "10.0.2.0/24"
pub_sub_cidr_3 = "10.0.3.0/24"

#AMI Image
ami_id = "ami-0c641f2290e9cd048"
instance_type = "t2.micro"

#ASG policy 
asg_min = "1"
asg_desired = "2"
asg_max = "3"