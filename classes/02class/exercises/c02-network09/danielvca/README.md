
# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|-|-|-|-|-|-|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```
aws ec2 create-security-group \
    --group-name da_public-sg \
    --description "SSH access from home to AWS" \
    --vpc-id vpc-0c2c93451cdd28192
GroupId: sg-024a02765d4a3501d

aws ec2 authorize-security-group-ingress \
    --group-id sg-024a02765d4a3501d \
    --protocol tcp \
    --port 22 \
    --cidr 180.150.58.136/32

---------------------------------------------------
aws ec2 create-security-group \
    --group-name da_private-sg \
    --description "SSH access only from public instances on AWS" \
    --vpc-id vpc-0c2c93451cdd28192
GroupId: sg-0f854ba13fa06fc9e

aws ec2 authorize-security-group-ingress \
    --group-id sg-0f854ba13fa06fc9e \
    --protocol tcp \
    --port 22 \
    --source-group sg-024a02765d4a3501d
No Output
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)

> Written with [StackEdit](https://stackedit.io/).
