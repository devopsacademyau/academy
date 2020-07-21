# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```bash
## Get VPC
❯ AWS_VPC_ID=$(aws ec2 describe-vpcs \
--filters "Name=tag-value,Values=devopsacademy-vpc" \
--query 'Vpcs[*].[VpcId]' \
--output text)

## Create an Internet Gateway
AWS_INTERNET_GATEWAY_ID=$(aws ec2 create-internet-gateway \
--query 'InternetGateway.{InternetGatewayId:InternetGatewayId}' \
--output text)

## Add a tag to the Internet-Gateway
aws ec2 create-tags \
--resources $AWS_INTERNET_GATEWAY_ID \
--tags "Key=Name,Value=devopsacademy-igw"

## Attach Internet gateway to your VPC
aws ec2 attach-internet-gateway \
--vpc-id $AWS_VPC_ID \
--internet-gateway-id $AWS_INTERNET_GATEWAY_ID

```

- Any extra challenges faced?
```
No
```


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)