# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```shell script
# A few settings for this exercise...
export AWS_DEFAULT_REGION=ap-southeast-2
VPC=vpc-0b374a631c3066687

# List AZs
aws ec2 describe-availability-zones --all-availability-zones --query 'AvailabilityZones[].ZoneName' --output text
# ap-southeast-2a ap-southeast-2b ap-southeast-2c

# Create them (I used a different prefix from the exercise as I have other VPCs and Subnets in my account)
SUBNET_PRIVATE_A=$(aws ec2 create-subnet --vpc-id $VPC --cidr-block 10.42.10.0/24 --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=devops-private-a}]' --query=Subnet.SubnetId --output text)
SUBNET_PRIVATE_B=$(aws ec2 create-subnet --vpc-id $VPC --cidr-block 10.42.11.0/24 --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=devops-private-b}]' --query=Subnet.SubnetId --output text)
SUBNET_PRIVATE_C=$(aws ec2 create-subnet --vpc-id $VPC --cidr-block 10.42.12.0/24 --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=devops-private-c}]' --query=Subnet.SubnetId --output text)
SUBNET_PUBLIC_A=$(aws ec2 create-subnet --vpc-id $VPC --cidr-block 10.42.20.0/24 --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=devops-public-a}]' --query=Subnet.SubnetId --output text)
SUBNET_PUBLIC_B=$(aws ec2 create-subnet --vpc-id $VPC --cidr-block 10.42.21.0/24 --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=devops-public-b}]' --query=Subnet.SubnetId --output text)
SUBNET_PUBLIC_C=$(aws ec2 create-subnet --vpc-id $VPC --cidr-block 10.42.22.0/24 --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=devops-public-c}]' --query=Subnet.SubnetId --output text)
echo "Private subnets: ${SUBNET_PRIVATE_A} ${SUBNET_PRIVATE_B} ${SUBNET_PRIVATE_C}"
echo " Public subnets: ${SUBNET_PUBLIC_A} ${SUBNET_PUBLIC_B} ${SUBNET_PUBLIC_C}"
# Private subnets: subnet-0bd896edb2cf4b5b1 subnet-05c594f7c02eb5ee1 subnet-0c44a7ff278cf0a91
#  Public subnets: subnet-0d4986c79f7cd8e16 subnet-08a5197ff2b022ca9 subnet-03b629b6e349ce031

# Public subnets to assign public IP by default
aws ec2 modify-subnet-attribute --subnet-id $SUBNET_PUBLIC_A --map-public-ip-on-launch
aws ec2 modify-subnet-attribute --subnet-id $SUBNET_PUBLIC_B --map-public-ip-on-launch
aws ec2 modify-subnet-attribute --subnet-id $SUBNET_PUBLIC_C --map-public-ip-on-launch

# Destroy them all
aws ec2 delete-subnet --subnet-id $SUBNET_PRIVATE_A
aws ec2 delete-subnet --subnet-id $SUBNET_PRIVATE_B
aws ec2 delete-subnet --subnet-id $SUBNET_PRIVATE_C
aws ec2 delete-subnet --subnet-id $SUBNET_PUBLIC_A
aws ec2 delete-subnet --subnet-id $SUBNET_PUBLIC_B
aws ec2 delete-subnet --subnet-id $SUBNET_PUBLIC_C
```

- Any extra challenges faced?

> All good.


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)