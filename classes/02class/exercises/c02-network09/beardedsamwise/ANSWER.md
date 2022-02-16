# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|---|---|---|---|---|---|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```
aws ec2 create-security-group --group-name public-sg --description "public-sg"
{
    "GroupId": "sg-08e81cdb0c91d451e"
}


aws ec2 create-security-group --group-name private-sg --description "private-sg"
{
    "GroupId": "sg-030093c36c5d7aa6d"
}

aws ec2 authorize-security-group-ingress \
    --group-name public-sg \
    --protocol tcp \
    --port 22 \
    --cidr 115.64.227.252/32
{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-02c991f7849b4683d",
            "GroupId": "sg-08e81cdb0c91d451e",
            "GroupOwnerId": "639247960747",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "CidrIpv4": "115.64.227.252/32"
        }
    ]
}

aws ec2 authorize-security-group-ingress \
    --group-name private-sg \
    --protocol tcp \
    --port 22 \
    --source-group public-sg 
{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-089cf39b8e31707fa",
            "GroupId": "sg-030093c36c5d7aa6d",
            "GroupOwnerId": "639247960747",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "ReferencedGroupInfo": {
                "GroupId": "sg-08e81cdb0c91d451e"
            }
        }
    ]
}
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)