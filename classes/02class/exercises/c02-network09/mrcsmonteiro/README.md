# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|-|-|-|-|-|-|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```
$ aws ec2 create-security-group \
    --group-name public-sg \
    --description "SSH access from home to AWS" \
    --vpc-id vpc-0721e28436cea8410

{
    "GroupId": "sg-0eda88d126367fb83"
}

$ aws ec2 authorize-security-group-ingress \
    --group-id sg-0eda88d126367fb83 \
    --protocol tcp \
    --port 22 \
    --cidr 120.88.137.206/32

$ aws ec2 create-tags \
    --resources sg-0eda88d126367fb83 \
    --tags Key=Name,Value=public-sg

$ aws ec2 create-security-group \
    --group-name private-sg \
    --description "SSH access only from public instances on AWS" \
    --vpc-id vpc-0721e28436cea8410

{
    "GroupId": "sg-01331d649596fcd01"
}

$ aws ec2 authorize-security-group-ingress \
    --group-id sg-01331d649596fcd01 \
    --protocol tcp \
    --port 22 \
    --source-group sg-0eda88d126367fb83

$ aws ec2 create-tags \
    --resources sg-01331d649596fcd01 \
    --tags Key=Name,Value=private-sg
```

- Any extra challenges faced?
Nope, this one was straightforward.

***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)
