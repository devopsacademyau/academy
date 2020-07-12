# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|-|-|-|-|-|-|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```
aws ec2 create-security-group --group-name public-sg --vpc-id vpc-018717ea8ed22e6ae --description "My public security group"

{
    "GroupId": "sg-06d7c95453582cf5b"
}

aws ec2 authorize-security-group-ingress \
    --group-id sg-06d7c95453582cf5b \
    --protocol tcp \
    --port 22 \
    --cidr 61.69.159.185/32

aws ec2 create-security-group --group-name private-sg --vpc-id vpc-018717ea8ed22e6ae --description "My private security group"

{
    "GroupId": "sg-0824e1528809be815"
}

aws ec2 authorize-security-group-ingress \
    --group-id sg-0824e1528809be815 \
    --protocol tcp \
    --port 22 \
    --source-group sg-06d7c95453582cf5b


```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)