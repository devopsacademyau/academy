# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```bash
## Get VPC
❯ AWS_VPC_ID=$(aws ec2 describe-vpcs \
--vpc-ids vpc-01cbfa4cf653d82e3 \
--query 'Vpcs[*].[VpcId]' \
--output text)

############# Availability zone A #############
## Create a public subnet
❯ AWS_SUBNET_PUBLIC_A_ID=$(aws ec2 create-subnet \
--vpc-id $AWS_VPC_ID \
--cidr-block 10.0.0.0/24 \
--availability-zone ap-southeast-2a \
--query 'Subnet.{SubnetId:SubnetId}' \
--output text)

## Add a tag to public subnet
❯ aws ec2 create-tags \
--resources $AWS_SUBNET_PUBLIC_A_ID \
--tags "Key=Name,Value=public-a"

## Create a private subnet
❯ AWS_SUBNET_PRIVATE_A_ID=$(aws ec2 create-subnet \
--vpc-id $AWS_VPC_ID \
--cidr-block 10.0.10.0/24 \
--availability-zone ap-southeast-2a \
--query 'Subnet.{SubnetId:SubnetId}' \
--output text)


❯ aws ec2 create-tags \
--resources $AWS_SUBNET_PRIVATE_A_ID \
--tags "Key=Name,Value=private-a"

##############################################
############# Availability zone B #############
## Create a public subnet
❯ AWS_SUBNET_PUBLIC_B_ID=$(aws ec2 create-subnet \
--vpc-id $AWS_VPC_ID \
--cidr-block 10.0.1.0/24 \
--availability-zone ap-southeast-2b \
--query 'Subnet.{SubnetId:SubnetId}' \
--output text)

❯ aws ec2 create-tags \
--resources $AWS_SUBNET_PUBLIC_B_ID \
--tags "Key=Name,Value=public-b"

## Create a private subnet
❯ AWS_SUBNET_PRIVATE_B_ID=$(aws ec2 create-subnet \
--vpc-id $AWS_VPC_ID \
--cidr-block 10.0.11.0/24 \
--availability-zone ap-southeast-2b \
--query 'Subnet.{SubnetId:SubnetId}' \
--output text)

❯ aws ec2 create-tags \
--resources $AWS_SUBNET_PRIVATE_B_ID \
--tags "Key=Name,Value=private-b"

##############################################
############# Availability zone C #############
## Create a public subnet

❯ AWS_SUBNET_PUBLIC_C_ID=$(aws ec2 create-subnet \
--vpc-id $AWS_VPC_ID \
--cidr-block 10.0.2.0/24 \
--availability-zone ap-southeast-2c \
--query 'Subnet.{SubnetId:SubnetId}' \
--output text)

❯ aws ec2 create-tags \
--resources $AWS_SUBNET_PUBLIC_C_ID \
--tags "Key=Name,Value=public-c"

## Create a private subnet
❯ AWS_SUBNET_PRIVATE_C_ID=$(aws ec2 create-subnet \
--vpc-id $AWS_VPC_ID \
--cidr-block 10.0.12.0/24 \
--availability-zone ap-southeast-2c \
--query 'Subnet.{SubnetId:SubnetId}' \
--output text)

❯ aws ec2 create-tags \
--resources $AWS_SUBNET_PRIVATE_C_ID \
--tags "Key=Name,Value=private-c"
##############################################

```

- Any extra challenges faced?
```
No
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)