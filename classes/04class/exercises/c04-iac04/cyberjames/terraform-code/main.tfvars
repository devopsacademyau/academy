##########################################################################################
# Define values to be used for AWS VPC
##########################################################################################
vpc_name = "contino-james-web-vpc"
vpc_cidr = "10.0.0.0/16"

##########################################################################################
# Define values to be used for AWS VPC Subnets
##########################################################################################
subnet_pub_1_name = "public1"
subnet_pub_2_name = "public2"
subnet_pub_1_cidr = "10.0.1.0/24"
subnet_pub_2_cidr = "10.0.2.0/24"
subnet_public1_az = "us-east-1c"
subnet_public2_az = "us-east-1f"

##########################################################################################
# Define values to be used for IGW & NGW to be provisioned
##########################################################################################
internet_gateway_name = "contino-james-igw"

# ec2_ami = "ami-090fa75af13c156b4"
ec2_key_name       = "contino-james-useast1"
high_cpu_threshold = "80"
low_cpu_threshold  = "20"
