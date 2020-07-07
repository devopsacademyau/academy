# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|-|-|-|-|-|-|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```
aws ec2 create-security-group --group-name public-sg --description "My public security group"

{
    "GroupId": "sg-0f3d9cc0786fce034"
}

aws ec2 authorize-security-group-ingress \
    --group-name public-sg \
    --protocol tcp \
    --port 22 \
    --cidr 61.69.159.185/32

aws ec2 create-security-group --group-name private-sg --description "My private security group"

{
    "GroupId": "sg-01a4327c2d3ccea83"
}

aws ec2 authorize-security-group-ingress \
    --group-name private-sg \
    --protocol tcp \
    --port 22 \
    --source-group sg-0f3d9cc0786fce034


```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)