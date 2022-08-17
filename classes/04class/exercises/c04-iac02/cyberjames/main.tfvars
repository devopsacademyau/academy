##########################################################################################
# Define values to be used for AWS VPC
##########################################################################################
vpc_name = "devopsacademy-iac"
vpc_cidr = "10.0.0.0/16"

##########################################################################################
# Define values to be used for AWS VPC Subnets
##########################################################################################
subnet_pub_1_name = "public1"
subnet_pub_2_name = "public2"
subnet_prv_1_name = "private1"
subnet_prv_2_name = "private2"
subnet_pub_1_az   = "us-east-1a"
subnet_pub_2_az   = "us-east-1b"
subnet_pub_1_cidr = "10.0.2.0/24"
subnet_pub_2_cidr = "10.0.3.0/24"
subnet_prv_1_az   = "us-east-1a"
subnet_prv_2_az   = "us-east-1b"
subnet_prv_1_cidr = "10.0.22.0/24"
subnet_prv_2_cidr = "10.0.33.0/24"

##########################################################################################
# Define values to be used for IGW & NGW to be provisioned
##########################################################################################
internet_gateway_name = "igw-01-contino-james"
nat_gw_name_001       = "natgw-01-contino-james"
vpc_enabled           = "true"

##########################################################################################
# Define values to be used for Route Tables
##########################################################################################
internet_cidr = "0.0.0.0/0"