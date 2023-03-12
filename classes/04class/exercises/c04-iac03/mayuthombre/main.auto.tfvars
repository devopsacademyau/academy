# Declaring input variables to be used while creating VPC & Subnet
vpcCIDRblock               = "10.0.0.0/18"                                      # Specify the CIDR block to be used for VPC creation
public_subnet_cidr_blocks  = ["10.0.10.0/28", "10.0.11.0/28"]                   # List of subnets to be used while creating public subnet
public_subnet_names        = ["public-a", "public-b"]                           # Name of subnets to be used while creating public subnet
private_subnet_cidr_blocks = ["10.0.30.0/28", "10.0.31.0/28"]                   # List of subnets to be used while creating private subnet
private_subnet_names       = ["private-a", "private-b"]                         # Name of subnets to be used while creating private subnet
destinationCIDRblock       = "49.193.184.101/32"                                # Inbound access on a particular port using my IP only 
availability_zones         = ["ap-southeast-2a", "ap-southeast-2b"]             # List of AZ used whilst creating subnets in different AZs 