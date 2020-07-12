# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|-|-|-|-|-|-|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```
aws ec2 create-security-group --group-name public-sg \
--description "SSH access from home to AWS" \
--vpc-id vpc-0f80827681fb041d0 \
--region ap-southeast-2

-------------------------------------
|        CreateSecurityGroup        |
+----------+------------------------+
|  GroupId |  sg-08eac92833065ac66  |
+----------+------------------------+

aws ec2 authorize-security-group-ingress --group-id  sg-08eac92833065ac66 \
--protocol tcp --port 22 \
--cidr 123.2.47.134/32 \
--region ap-southeast-2



aws ec2 create-security-group --group-name private-sg \
--description "SSH access only from public instances on AWS" \
--vpc-id vpc-0f80827681fb041d0 \
--region ap-southeast-2

-------------------------------------
|        CreateSecurityGroup        |
+----------+------------------------+
|  GroupId |  sg-06506bfeb68fb128e  |
+----------+------------------------+

aws ec2 authorize-security-group-ingress --group-id sg-06506bfeb68fb128e \
--protocol tcp --port 22 \
--source-group sg-08eac92833065ac66 \
--region ap-southeast-2
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)