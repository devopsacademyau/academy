# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|---|---|---|---|---|---|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```
# Create public-sg
Command:
aws ec2 create-security-group \
    --group-name public-sg \
    --description "SSH access from home to AWS" \
    --vpc-id vpc-0e9963972a29d0cc3 \
    --region ap-southeast-2

Output:
{
    "GroupId": "sg-0099da4cfb47aae94"
}

# Create private-sg
Command:
aws ec2 create-security-group \
    --group-name private-sg \
    --description "SSH access only from public instances on AWS" \
    --vpc-id vpc-0e9963972a29d0cc3 \
    --region ap-southeast-2

Output:
{
    "GroupId": "sg-0408abc0afed4c5c5"
}

# Create ingress rule for public-sg
Command:
aws ec2 authorize-security-group-ingress \
    --group-id sg-0099da4cfb47aae94 \
    --protocol tcp \
    --port 22 \
    --cidr 1.158.41.73/32 \
    --region ap-southeast-2

Output:
{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-0aedb2951c8f3ea84",
            "GroupId": "sg-0099da4cfb47aae94",
            "GroupOwnerId": "969496245957",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "CidrIpv4": "1.158.41.73/32"
        }
    ]
}

# Create ingress rule for private-sg
Command:
aws ec2 authorize-security-group-ingress \
    --group-id sg-0408abc0afed4c5c5 \
    --protocol tcp \
    --port 22 \
    --source-group sg-0099da4cfb47aae94 \
    --region ap-southeast-2

Output:
{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-07c6766ae1c1d6a93",
            "GroupId": "sg-0408abc0afed4c5c5",
            "GroupOwnerId": "969496245957",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "ReferencedGroupInfo": {
                "GroupId": "sg-0099da4cfb47aae94"
            }
        }
    ]
}
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)
