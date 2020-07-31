cidr_block = "10.0.0.0/16"
region = "ap-southeast-2"
name = "da_iac02_vpc"
public_subnet_cidr_blocks = ["10.0.0.0/24", "10.0.2.0/24"]
private_subnet_cidr_blocks = ["10.0.1.0/24", "10.0.3.0/24"]
availability_zones = ["ap-southeast-2a", "ap-southeast-2b"]
destination_cidr_block = "0.0.0.0/0"