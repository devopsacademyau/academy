# c02-network04

## Commands Execution Output

- Commands for creating the subnets:
Private-a
```
aws ec2 create-subnet \
    --vpc-id vpc-091f1866ec064400e \
    --cidr-block 10.0.1.0/24 \
    --availability-zone ap-southeast-2a
    --tag-specifications ResourceType=subnet,Tags=[{Key=Name,Value="ccr-dojo-private-a"}]
```

Public-a
```
aws ec2 create-subnet \
    --vpc-id vpc-091f1866ec064400e \
    --cidr-block 10.0.11.0/24 \
    --availability-zone ap-southeast-2a
    --tag-specifications ResourceType=subnet,Tags=[{Key=Name,Value="ccr-dojo-public-a"}]
```

Private-b
```
aws ec2 create-subnet \
    --vpc-id vpc-091f1866ec064400e \
    --cidr-block 10.0.2.0/24 \
    --availability-zone ap-southeast-2b
    --tag-specifications ResourceType=subnet,Tags=[{Key=Name,Value="ccr-dojo-private-b"}]
```

Public-b
```
aws ec2 create-subnet \
    --vpc-id vpc-091f1866ec064400e \
    --cidr-block 10.0.12.0/24 \
    --availability-zone ap-southeast-2b
    --tag-specifications ResourceType=subnet,Tags=[{Key=Name,Value="ccr-dojo-public-b"}]
```

Private-c
```
aws ec2 create-subnet \
    --vpc-id vpc-091f1866ec064400e \
    --cidr-block 10.0.3.0/24 \
    --availability-zone ap-southeast-2c
    --tag-specifications ResourceType=subnet,Tags=[{Key=Name,Value=ccr-dojo-private-c}]
```

Public-c
```
aws ec2 create-subnet \
    --vpc-id vpc-091f1866ec064400e \
    --cidr-block 10.0.13.0/24 \
    --availability-zone ap-southeast-2c
    --tag-specifications ResourceType=subnet,Tags='[{Key=Name,Value=ccr-dojo-public-c}]'
```


- Any extra challenges faced?

Tagging wouldn't work with the --tag-specifications option inline within the create command. I found that setting a variable in bash beforehand with the tag specification in an array worked. e.g

tags=(--tag-specifications 'ResourceType=subnet,Tags=[
{Key=Name,Value=ccr-dojo-test-b}]
') 
&& \
aws ec2 create-subnet \
    --vpc-id vpc-091f1866ec064400e \
    --cidr-block 10.0.43.0/24 \
    --availability-zone ap-southeast-2b \
    "${tags[@]}"

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network04](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network04/README.md)