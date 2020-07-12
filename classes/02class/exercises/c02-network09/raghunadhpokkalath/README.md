# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|-|-|-|-|-|-|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```
Create public-sg 

> aws ec2 create-security-group --group-name public-sg --vpc-id vpc-076a05ec0f3be4895 --description 'ssh access from home to AWS'

{
    "GroupId": "sg-086cc2f38056a639a"
}

Tag Security Group as public-sg
> aws ec2 create-tags --resources sg-086cc2f38056a639a --tags Key=Name,Value=public-sg

Create inbound to allow access only from Home
> aws ec2 authorize-security-group-ingress --group-id sg-086cc2f38056a639a --protocol tcp --port 22 --cidr 58.96.95.89/32

Verify the security group to ensure the ssh access is allowed only from home ip
> aws ec2 describe-security-groups --group-ids sg-086cc2f38056a639a
{
    "SecurityGroups": [
        {
            "Description": "ssh access from home to AWS",
            "GroupName": "public-sg",
            "IpPermissions": [
                {
                    "FromPort": 22,
                    "IpProtocol": "tcp",
                    "IpRanges": [
                        {
                            "CidrIp": "58.96.95.89/32"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 22,
                    "UserIdGroupPairs": []
                }
            ],
            "OwnerId": "361529347535",
            "GroupId": "sg-086cc2f38056a639a",
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
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "public-sg"
                }
            ],
            "VpcId": "vpc-076a05ec0f3be4895"
        }
    ]
}

Create Private SG

> aws ec2 create-security-group --group-name private-sg --vpc-id vpc-076a05ec0f3be4895 --description 'SSH access only from public instances on AWS'
{
    "GroupId": "sg-01ae6489e38ada216"
}

Tag Security Group as private-sg
> aws ec2 create-tags --resources sg-01ae6489e38ada216 --tags Key=Name,Value=private-sg

Create a private security group and assign the source as public secur
> aws ec2 authorize-security-group-ingress --group-id sg-01ae6489e38ada216 --protocol tcp --port 22 --source-group sg-086cc2f38056a639a

> Describe security group 
aws ec2 describe-security-groups --group-ids sg-01ae6489e38ada216
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
                            "GroupId": "sg-086cc2f38056a639a",
                            "UserId": "361529347535"
                        }
                    ]
                }
            ],
            "OwnerId": "361529347535",
            "GroupId": "sg-01ae6489e38ada216",
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
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "private-sg"
                }
            ],
            "VpcId": "vpc-076a05ec0f3be4895"
        }
    ]
}

```

- Any extra challenges faced?
```
No challenges for this lab
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)