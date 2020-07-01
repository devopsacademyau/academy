# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```shell script
# A few settings for this exercise...
export AWS_DEFAULT_REGION=ap-southeast-2
VPC_ID=$(aws ec2 describe-vpcs --filter 'Name=tag:Name,Values=devopsacademy-vpc' --query Vpcs[-1].VpcId --output text)

# Create gateway
INTERNET_GW=$(aws ec2 create-internet-gateway --tag-specifications 'ResourceType=internet-gateway,Tags=[{Key=Name,Value=devopsacademy-igw}]' --query=InternetGateway.InternetGatewayId --output text)
echo $INTERNET_GW # igw-0464c937b4fd0cad5

# Attach to VPC
aws ec2 attach-internet-gateway --internet-gateway-id $INTERNET_GW --vpc-id $VPC_ID

# Destroy it
aws ec2 detach-internet-gateway --internet-gateway-id $INTERNET_GW --vpc-id $VPC_ID
aws ec2 delete-internet-gateway --internet-gateway-id $INTERNET_GW
```

- Any extra challenges faced?

> All good.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)