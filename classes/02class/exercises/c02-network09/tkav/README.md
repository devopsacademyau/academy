# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|---|---|---|---|---|---|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```
#Create public security group
aws ec2 create-security-group \
    --group-name tk-sg-public \
    --description 'SSH access from home to AWS' \
    --vpc-id vpc-0437c9e5d4deb0d46 \
    --tag-specifications "ResourceType=security-group,Tags=[{Key=Name,Value=tk-sg-public}]"

# Get external IP
curl https://checkip.amazonaws.com

# Add ACL to public security group
aws ec2 authorize-security-group-ingress --group-id sg-040506fdcfbbaf676 --protocol tcp --port 22 --cidr "$(myip)/32"

#Create private security group
aws ec2 create-security-group \
    --group-name tk-sg-private \
    --description 'SSH access from public security group' \
    --vpc-id vpc-0437c9e5d4deb0d46 \
    --tag-specifications "ResourceType=security-group,Tags=[{Key=Name,Value=tk-sg-private}]"


#Add ACL to private security group
aws ec2 authorize-security-group-ingress --group-id sg-0ede42a137608a804 --protocol tcp --port 22 --source-group sg-040506fdcfbbaf676

```

- Any extra challenges faced?

Ensure the two security groups are referencing the correct VPC

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)