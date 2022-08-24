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
subnet_pub_1_cidr = "10.0.2.0/24"
subnet_pub_2_cidr = "10.0.3.0/24"
subnet_prv_1_cidr = "10.0.22.0/24"
subnet_prv_2_cidr = "10.0.33.0/24"

##########################################################################################
# Define values to be used for IGW & NGW to be provisioned
##########################################################################################
internet_gateway_name = "igw-c01-iac02"
nat_gw_name           = "natgw-c01-iac02"
vpc_enabled           = "true"
igw_rt_pub_name       = "public-c01-iac02"
nat_gateway_rt_name   = "private-c01-iac02"
