# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|---|---|---|---|---|---|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```
aws --region us-east-1 ec2 create-security-group --group-name public-sg --description "SSH access from home to AWS" --vpc-id vpc-0e4bde4129898095b
{
    "GroupId": "sg-089eda60c7eb26911"
}

aws --region us-east-1 ec2 authorize-security-group-ingress --group-id sg-089eda60c7eb26911 --protocol tcp --port ssh --cidr x.x.x.x/32

{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-0cf7cbb1973da8c5d",
            "GroupId": "sg-089eda60c7eb26911",
            "GroupOwnerId": "152848913167",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "CidrIpv4": "x.x.x.x/32"
        }
    ]
}

aws --region us-east-1 ec2 create-security-group --group-name private-sg --description "SSH access only from public instances on AWS" --vpc-id vpc-0e4bde4129898095b
{
    "GroupId": "sg-0d910059011b3c004"
}

aws --region us-east-1 ec2 authorize-security-group-ingress --group-id sg-0d910059011b3c004 --protocol tcp --port ssh --source-group sg-089eda60c7eb26911

{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-0d974af49ca49ad2e",
            "GroupId": "sg-0d910059011b3c004",
            "GroupOwnerId": "152848913167",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "ReferencedGroupInfo": {
                "GroupId": "sg-089eda60c7eb26911",
                "UserId": "152848913167"
            }
        }
    ]
}
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)