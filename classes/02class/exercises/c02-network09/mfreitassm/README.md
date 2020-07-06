# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|-|-|-|-|-|-|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```
create a security group
aws ec2 create-security-group --group-name public-sg --description "SSH access from home to AWS" --vpc-id vpc-04426efcf5b2228a4
{
    "GroupId": "sg-087b8f7ebba365ec7"
}

aws ec2 authorize-security-group-ingress --group-id sg-087b8f7ebba365ec7 --protocol tcp --port 22 --cidr 101.116.206.49/32

aws ec2 create-security-group --group-name private-sg --description "SSH access only from public instances on AWS" --vpc-id vpc-04426efcf5b2228a4
{
    "GroupId": "sg-04a749673e309f05d"
}


aws ec2 authorize-security-group-ingress --group-id sg-04a749673e309f05d --protocol tcp --port 22--source-group sg-087b8f7ebba365ec7

aws ec2 describe-security-groups --filters "Name=vpc-id,Values=vpc-04426efcf5b2228a4"
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
                            "GroupId": "sg-087b8f7ebba365ec7",
                            "UserId": "490308117505"
                        }
                    ]
                }
            ],
            "OwnerId": "490308117505",
            "GroupId": "sg-04a749673e309f05d",
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
            "VpcId": "vpc-04426efcf5b2228a4"
        },
        {
            "Description": "SSH access from home to AWS",
            "GroupName": "public-sg",
            "IpPermissions": [
                {
                    "FromPort": 22,
                    "IpProtocol": "tcp",
                    "IpRanges": [
                        {
                            "CidrIp": "101.116.206.49/32"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 22,
                    "UserIdGroupPairs": []
                }
            ],
            "OwnerId": "490308117505",
            "GroupId": "sg-087b8f7ebba365ec7",
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
            "VpcId": "vpc-04426efcf5b2228a4"
        }
    ]
}


```

- Any extra challenges faced?
No

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)