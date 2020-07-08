# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```bash
# check AWS CLI configuration file
$ cat ~/.aws/config
[default]
region = ap-southeast-2
[profile devopsacademyau]
region = ap-southeast-2

# Set the environment variables:
export AWS_PROFILE=devopsacademyau
aws sts get-caller-identity

aws ec2 describe-vpcs --filters "Name=tag:Name,Values=da-c02-vpc"  VCP_ID=vpc-02ec2836691642ace
# Create 2 subnets (private and public) per Availability Zone (6 subnets in total)
aws ec2 describe-availability-zones --all-availability-zones --query 'AvailabilityZones[].ZoneName' --output text
# ap-southeast-2a ap-southeast-2b ap-southeast-2c

# ap-southeast-2a
aws ec2 create-subnet --vpc-id $VCP_ID --cidr-block 10.128.10.0/24 --availability-zone ap-southeast-2a --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=da-c02-public-a}]'

aws ec2 create-subnet --vpc-id $VCP_ID --cidr-block 10.128.20.0/24 --availability-zone ap-southeast-2a --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=da-c02-private-a}]'

# ap-southeast-2b
aws ec2 create-subnet --vpc-id $VCP_ID --cidr-block 10.128.11.0/24 --availability-zone ap-southeast-2b --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=da-c02-public-b}]'

aws ec2 create-subnet --vpc-id $VCP_ID --cidr-block 10.128.21.0/24 --availability-zone ap-southeast-2b --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=da-c02-private-b}]'

# ap-southeast-2c
aws ec2 create-subnet --vpc-id $VCP_ID --cidr-block 10.128.12.0/24 --availability-zone ap-southeast-2c --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=da-c02-public-c}]'

aws ec2 create-subnet --vpc-id $VCP_ID --cidr-block 10.128.22.0/24 --availability-zone ap-southeast-2c --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=da-c02-private-c}]'

# Make the subnets public or private in next excercises
# After created the VPC and subnets, you can attach Internet gateway and NAT gateway to your VPC, creating  custom route tables, and configuring routing for the public subnets through an associated public route table to the Internet gateway and configuring routing for the private subnets through an assocated private route table to the NAT gateway.

# Clean when needless
aws ec2 delete-subnet --subnet-id ********
```

- Any extra challenges faced?
Ok.

Ref: https://docs.aws.amazon.com/cli/latest/index.html

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)