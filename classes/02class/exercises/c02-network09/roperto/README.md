# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|---|---|---|---|---|---|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```shell script
export AWS_DEFAULT_REGION=ap-southeast-2
VPC=vpc-0b374a631c3066687


# Public
HOME_IP=$(curl -s 'https://api.ipify.org?format=text')
SG_PUBLIC=$(aws ec2 create-security-group --group-name 'public-sg' --description 'SSH access from home to AWS' \
    --vpc-id $VPC --tag-specifications 'ResourceType=security-group,Tags=[{Key=Name,Value=public-sg}]' \
    --query GroupId --output text)
aws ec2 authorize-security-group-ingress --group-id $SG_PUBLIC \
    --protocol tcp --port 22 --cidr "$HOME_IP/32"


# Private
SG_PRIVATE=$(aws ec2 create-security-group --group-name 'private-sg' --description 'SSH access only from public instances on AWS' \
    --vpc-id $VPC --tag-specifications 'ResourceType=security-group,Tags=[{Key=Name,Value=private-sg}]' \
    --query GroupId --output text)
aws ec2 authorize-security-group-ingress --group-id $SG_PRIVATE \
    --protocol tcp --port 22 --source-group $SG_PUBLIC


# Destroy
aws ec2 delete-security-group --group-id $SG_PUBLIC
aws ec2 delete-security-group --group-id $SG_PRIVATE
```

- Any extra challenges faced?

> All good.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)