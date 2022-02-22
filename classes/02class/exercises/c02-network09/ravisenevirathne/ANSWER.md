# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|---|---|---|---|---|---|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```
aws ec2 create-security-group \
    --group-name public-sg-ravi \
    --description "SSH access from home to AWS" \
    --vpc-id vpc-09b37d389cf1e7937
{
    "GroupId": "sg-02968252763c487c5"
}

aws ec2 authorize-security-group-ingress \
    --group-id sg-02968252763c487c5 \
    --cidr 211.26.246.72/32 \
    --protocol tcp \
    --port 22
{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-097ee5a122351b21b",
            "GroupId": "sg-02968252763c487c5",
            "GroupOwnerId": "152848913167",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "CidrIpv4": "211.26.246.72/32"
        }
    ]
}

aws ec2 create-security-group \
    --group-name private-sg-ravi \
    --description "SSH access only from public instances on AWS" \
    --vpc-id vpc-09b37d389cf1e7937
{
    "GroupId": "sg-02e108749814f1c16"
}

aws ec2 authorize-security-group-ingress \
    --group-id sg-02e108749814f1c16 \
    --source-group sg-02968252763c487c5 \
    --protocol tcp \
    --port 22
{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-02b50ef529b0f3bf9",
            "GroupId": "sg-02e108749814f1c16",
            "GroupOwnerId": "152848913167",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "ReferencedGroupInfo": {
                "GroupId": "sg-02968252763c487c5"
            }
        }
    ]
}

```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)