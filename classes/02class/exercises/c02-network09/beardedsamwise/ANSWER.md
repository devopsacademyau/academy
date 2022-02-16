# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|---|---|---|---|---|---|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```
aws ec2 create-security-group --group-name public-sg --description "public-sg" --vpc-id vpc-09666fb121d6ae087
{
    "GroupId": "sg-03306f8d0577a09d5"
}


aws ec2 create-security-group --group-name private-sg --description "private-sg" --vpc-id vpc-09666fb121d6ae087
{
    "GroupId": "sg-0f83244d342a2c680"
}

aws ec2 authorize-security-group-ingress \
    --group-id sg-03306f8d0577a09d5 \
    --protocol tcp \
    --port 22 \
    --cidr 115.64.227.252/32
{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-0f61fa6b3369c9ddd",
            "GroupId": "sg-03306f8d0577a09d5",
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
    --group-id sg-0f83244d342a2c680 \
    --protocol tcp \
    --port 22 \
    --source-group sg-03306f8d0577a09d5
{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-08798d3a71e825853",
            "GroupId": "sg-0f83244d342a2c680",
            "GroupOwnerId": "639247960747",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "ReferencedGroupInfo": {
                "GroupId": "sg-03306f8d0577a09d5"
            }
        }
    ]
}
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)