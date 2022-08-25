# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|---|---|---|---|---|---|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```yaml
# Home SSH Access
aws ec2 create-security-group \
  --description "SSH access from home to AWS" \
  --group-name "public-sg" \
  --vpc-id vpc-09b37d389cf1e7937
{
    "GroupId": "sg-0d1e969bd74611af7"
}

# Export ip to env variable
export myip=$(curl https://checkip.amazonaws.com)

# Authorize ingress on port 22 for ip
aws ec2 authorize-security-group-ingress \
  --group-id sg-0d1e969bd74611af7 \
  --port 22 --protocol tcp \
  --cidr "$myip/32"


# SSH from public AWS instances
aws ec2 create-security-group \
  --description "SSH access only from public instances on AWS" \
  --group-name "private-sg" \
  --vpc-id vpc-09b37d389cf1e7937
{
    "GroupId": "sg-02b2fcad404a76fc9"
}

# Authorize ingress from source group
aws ec2 authorize-security-group-ingress \
  --group-id sg-02b2fcad404a76fc9 \
  --port 22 --protocol tcp \
  --source-group sg-0d1e969bd74611af7
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)