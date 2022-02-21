# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|---|---|---|---|---|---|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```
curl https://checkip.amazonaws.com/
118.210.125.173

aws ec2 create-security-group \
    --group-name public-sg \
    --description "SSH access from home to AWS" \
    --vpc-id vpc-0a002c0e5a418e381 \
    --region ap-southeast-1
{
    "GroupId": "sg-0c4202b20e3c79654"
}

aws ec2 create-security-group \
    --group-name private-sg \
    --description "SSH access only from public instances on AWS" \
    --vpc-id vpc-0a002c0e5a418e381 \
    --region ap-southeast-1
{
    "GroupId": "sg-039156288d7a1dece"
}


aws ec2 authorize-security-group-ingress \
    --group-id sg-0c4202b20e3c79654 \
    --protocol tcp \
    --port 22 \
    --cidr 118.210.125.173/32 \
    --region ap-southeast-1
{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-06ff80ab76411b153",
            "GroupId": "sg-0c4202b20e3c79654",
            "GroupOwnerId": "152848913167",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "CidrIpv4": "118.210.125.173/32"
        }
    ]
}

aws ec2 authorize-security-group-ingress \
    --group-id sg-039156288d7a1dece \
    --protocol tcp \
    --port 22 \
    --source-group sg-0c4202b20e3c79654 \
    --region ap-southeast-1
{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-0becfedb12f40eff9",
            "GroupId": "sg-039156288d7a1dece",
            "GroupOwnerId": "152848913167",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "ReferencedGroupInfo": {
                "GroupId": "sg-0c4202b20e3c79654"
            }
        }
    ]
}

```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)