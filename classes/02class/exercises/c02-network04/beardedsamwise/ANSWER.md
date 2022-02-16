# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
```
aws ec2 create-subnet \
    --vpc-id vpc-09666fb121d6ae087 \
    --cidr-block 10.0.0.0/24 \
    --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=public-a}]" \
    --availability-zone ap-southeast-2a 
    
aws ec2 create-subnet \
    --vpc-id vpc-09666fb121d6ae087 \
    --cidr-block 10.0.1.0/24 \
    --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=public-b}]" \
    --availability-zone ap-southeast-2b

aws ec2 create-subnet \
    --vpc-id vpc-09666fb121d6ae087 \
    --cidr-block 10.0.2.0/24 \
    --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=public-c}]" \
    --availability-zone ap-southeast-2c

aws ec2 create-subnet \
    --vpc-id vpc-09666fb121d6ae087 \
    --cidr-block 10.0.10.0/24 \
    --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=private-a}]" \
    --availability-zone ap-southeast-2a

aws ec2 create-subnet \
    --vpc-id vpc-09666fb121d6ae087 \
    --cidr-block 10.0.11.0/24 \
    --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=private-b}]" \
    --availability-zone ap-southeast-2b

aws ec2 create-subnet \
    --vpc-id vpc-09666fb121d6ae087 \
    --cidr-block 10.0.12.0/24 \
    --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=private-c}]" \
    --availability-zone ap-southeast-2c
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)