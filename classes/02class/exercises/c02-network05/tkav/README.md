# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:

Describe VPC

```
aws ec2 describe-vpcs --vpc-ids vpc-0437c9e5d4deb0d46
```

Create internet gateway

```
aws ec2 create-internet-gateway \
    --tag-specifications 'ResourceType=internet-gateway,Tags=[{Key=Name,Value=tkav-dojo-igw}]' \
    --query=InternetGateway.InternetGatewayId --output text
```

Attach internet gateway

```
aws ec2 attach-internet-gateway --vpc-id vpc-0437c9e5d4deb0d46 --internet-gateway-id igw-0e5f16880146f0a33
```


- Any extra challenges faced?

VPC and Internet gateway need to be in the same region. Make sure no other IGW is attached to this VPC.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)