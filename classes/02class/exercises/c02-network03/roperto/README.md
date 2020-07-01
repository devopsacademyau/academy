# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:
```shell script
# My AWS profile has no default region set
export AWS_DEFAULT_REGION=ap-southeast-2

# Create
VPC_ID=$(aws ec2 create-vpc --cidr-block 10.42.0.0/16 --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=devopsacademy-vpc}]' --query Vpc.VpcId --output text)
echo $VPC_ID # vpc-0827fccaa60cacfce

# Destroy
aws ec2 delete-vpc --vpc-id $VPC_ID
```

- Any extra challenges faced?

> I had to update my AWS CLI in order to get tags working. My current version:
> aws-cli/1.18.91 Python/3.7.7 Darwin/19.5.0 botocore/1.17.14

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)