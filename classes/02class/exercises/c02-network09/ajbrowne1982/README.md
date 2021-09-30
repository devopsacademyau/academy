# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|---|---|---|---|---|---|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```
Add your commands and their outputs here
```
Public SG
    aws ec2 create-security-group --vpc-id vpc-0cc0c4eeb9c6504d7 --group-name ab-public-sg --description "SSH access from home to AWS"

    aws ec2 authorize-security-group-ingress --group-id sg-04b25ee3f663937f2 --protocol tcp --port 22 --cidr 110.174.92.59/32

    aws ec2 create-tags --resources sg-04b25ee3f663937f2 --tags Key=Name,Value=ab-public-sg

Private SG
    aws ec2 create-security-group --vpc-id vpc-0cc0c4eeb9c6504d7 --group-name ab-private-sg --description "SSH access only from public instances on AWS"

    aws ec2 authorize-security-group-ingress --group-id sg-0826h53af0fc5782b --source-group sg-04b25ee3f663937f2 --protocol tcp --port 22
 
    aws ec2 create-tags --resources sg-0826h53af0fc5782b --tags Key=Name,Value=ab-private-sg

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)