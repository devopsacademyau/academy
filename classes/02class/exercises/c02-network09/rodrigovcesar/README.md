# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|---|---|---|---|---|---|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```
aws ec2 create-security-group --group-name public-sg --description "SSH access from home to AWS" --vpc-id vpc-060a0763bc0be9c60
{
    "GroupId": "sg-0ec24b2105ee8505e"
}


aws ec2 authorize-security-group-ingress --group-id sg-0ec24b2105ee8505e --cidr 122.150.73.147/32 --port 22 --protocol tcp


aws ec2 describe-security-groups --group-ids sg-0ec24b2105ee8505e
{
    "SecurityGroups": [
        {
            "Description": "SSH access from home to AWS",
            "GroupName": "public-sg",
            "IpPermissions": [
                {
                    "FromPort": 22,
                    "IpProtocol": "tcp",
                    "IpRanges": [
                        {
                            "CidrIp": "122.150.73.147/32"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 22,
                    "UserIdGroupPairs": []
                }
            ],
            "OwnerId": "722281479696",
            "GroupId": "sg-0ec24b2105ee8505e",
            "IpPermissionsEgress": [
                {
                    "IpProtocol": "-1",
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "UserIdGroupPairs": []
                }
            ],
            "VpcId": "vpc-060a0763bc0be9c60"
        }
    ]
}


aws ec2 create-security-group --group-name private-sg --description "SSH access only from public instances on AWS" --vpc-id vpc-060a0763bc0be9c60
{
    "GroupId": "sg-0496d82b17b95e334"
}


aws ec2 authorize-security-group-ingress --group-id sg-0496d82b17b95e334 --source-group sg-0ec24b2105ee8505e --port 22 --protocol tcp

aws ec2 describe-security-groups --group-ids sg-0496d82b17b95e334 
{
    "SecurityGroups": [
        {
            "Description": "SSH access only from public instances on AWS",
            "GroupName": "private-sg",
            "IpPermissions": [
                {
                    "FromPort": 22,
                    "IpProtocol": "tcp",
                    "IpRanges": [],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 22,
                    "UserIdGroupPairs": [
                        {
                            "GroupId": "sg-0ec24b2105ee8505e",
                            "UserId": "722281479696"
                        }
                    ]
                }
            ],
            "OwnerId": "722281479696",
            "GroupId": "sg-0496d82b17b95e334",
            "IpPermissionsEgress": [
                {
                    "IpProtocol": "-1",
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "UserIdGroupPairs": []
                }
            ],
            "VpcId": "vpc-060a0763bc0be9c60"
        }
    ]
}


```

- Any extra challenges faced?
More related to chase the commands and parameters in the docs.


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)