# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|---|---|---|---|---|---|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```
$ aws ec2 create-security-group \
--group-name public-sg \
--description "SSH access from home to AWS" \
--vpc-id vpc-0d8edf6a0d1104524 \
--tag-specifications "ResourceType=security-group,Tags=[{Key=Name,Value=public-sg}]"

$ aws ec2 authorize-security-group-ingress \
--group-id sg-045d3538c13fea3da \
--protocol tcp \
--port 22 \
--cidr "$(curl checkip.amazonaws.com)/32"


$ aws ec2 create-security-group \
--group-name private-sg \
--description "SSH access only from public instances on AWS" \
--vpc-id vpc-0d8edf6a0d1104524 \
--tag-specifications "ResourceType=security-group,Tags=[{Key=Name,Value=private-sg}]"

$ aws ec2 authorize-security-group-ingress \
--group-id sg-0d1945a56ef5a5894 \
--protocol tcp \
--port 22 \
--source-group sg-045d3538c13fea3da

```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)