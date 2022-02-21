# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|---|---|---|---|---|---|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```
aws ec2 create-security-group \
--group-name ccr-dojo-private-sg \
--description "Private networks security group" \
--vpc-id vpc-091f1866ec064400e 
```
```
{
    "GroupId": "sg-0b6b4303beb0693c3"
}
```
```
aws ec2 create-security-group \
--group-name ccr-dojo-public-sg \
--description "Public networks security group" \
--vpc-id vpc-091f1866ec064400e 
```
```
{
    "GroupId": "sg-03e715b77dc425518"
}
```

Public-sg security group rule
```
aws ec2 authorize-security-group-ingress \
--group-id sg-03e715b77dc425518 \
--protocol tcp --port 22 \
--cidr x.x.x.x/32

```
```
{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-0b5155e94a53195d1",
            "GroupId": "sg-03e715b77dc425518",
            "GroupOwnerId": "152848913167",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "CidrIpv4": "x.x.x.x/32"
        }
    ]
}
```

Private-sg security group rule
```
aws ec2 authorize-security-group-ingress \
    --group-id sg-0b6b4303beb0693c3 \
    --protocol tcp \
    --port 22 \
    --source-group sg-03e715b77dc425518
```
```
{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-0e5ea8e60cba1a887",
            "GroupId": "sg-0b6b4303beb0693c3",
            "GroupOwnerId": "152848913167",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "ReferencedGroupInfo": {
                "GroupId": "sg-03e715b77dc425518"
            }
        }
    ]
}
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)