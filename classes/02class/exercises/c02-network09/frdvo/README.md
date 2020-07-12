# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|-|-|-|-|-|-|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```
$aws ec2 create-security-group --group-name public-sg --description "SSH access from home to AWS" --vpc-id vpc-0a2b7db4956438d22
{
    "GroupId": "sg-074c76a5868b6d0a1"
}

$aws ec2 create-tags --resources sg-074c76a5868b6d0a1 --tags Key=Name,Value=public-sg
$aws ec2 authorize-security-group-ingress --group-id sg-074c76a5868b6d0a1 --protocol tcp --port 22 --cidr 220.245.96.238/32
$aws ec2 describe-security-groups --group-ids sg-074c76a5868b6d0a1
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
                            "CidrIp": "220.245.96.238/32"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 22,
                    "UserIdGroupPairs": []
                }
            ],
            "OwnerId": "165765640813",
            "GroupId": "sg-074c76a5868b6d0a1",
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
            "VpcId": "vpc-0a2b7db4956438d22"
        }
    ]
}
$aws ec2 create-security-group --group-name private-sg --description "SSH access only from public instances on AWS" --vpc-id vpc-0a2b7db4956438d22
{
    "GroupId": "sg-0f13d66af24816cf5"
}
$aws ec2 create-tags --resources sg-0f13d66af24816cf5 --tags Key=Name,Value=private-sg
$aws ec2 authorize-security-group-ingress --group-id sg-0f13d66af24816cf5 --protocol tcp --port 22 --source-group sg-074c76a5868b6d0a1
$aws ec2 describe-security-groups --group-ids sg-0f13d66af24816cf5
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
                            "GroupId": "sg-074c76a5868b6d0a1",
                            "UserId": "165765640813"
                        }
                    ]
                }
            ],
            "OwnerId": "165765640813",
            "GroupId": "sg-0f13d66af24816cf5",
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
            "VpcId": "vpc-0a2b7db4956438d22"
        }
    ]
}

```

- Any extra challenges faced?
No, the challenge was when I did it on class01 exercises.


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)