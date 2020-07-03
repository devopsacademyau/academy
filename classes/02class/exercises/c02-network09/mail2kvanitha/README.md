# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|-|-|-|-|-|-|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

### Public Security Group

```

 > aws ec2 create-security-group --description "Public Security Group" --group-name public-sg --vpc-id vpc-090b5559554353054

   {
      "GroupId": "sg-04f4e5c5c200d097b"
   }

 Get my home IP address from https://checkip.amazonaws.com/

 > aws ec2 authorize-security-group-ingress --group-id sg-04f4e5c5c200d097b --protocol tcp --port 22 --cidr 14.203.197.155/32

 > aws ec2 describe-security-groups --group-id sg-04f4e5c5c200d097b 
   
   {
    "SecurityGroups": [
        {
            "Description": "Public Security Group",
            "GroupName": "public-sg",
            "IpPermissions": [
                {
                    "FromPort": 22,
                    "IpProtocol": "tcp",
                    "IpRanges": [
                        {
                            "CidrIp": "14.203.197.155/32"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 22,
                    "UserIdGroupPairs": []
                }
            ],
            "OwnerId": "823151257518",
            "GroupId": "sg-04f4e5c5c200d097b",
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
            "VpcId": "vpc-090b5559554353054"
        }
    ]
  }
  
```

### Private Security Group

```

 > aws ec2 create-security-group --description "Private Security Group" --group-name private-sg --vpc-id vpc-090b5559554353054

   {
     "GroupId": "sg-0e0408972c4f4f616"
   }

 > aws ec2 authorize-security-group-ingress --group-id sg-0e0408972c4f4f616 --protocol tcp --port 22 --source-group sg-04f4e5c5c200d097b

 > aws ec2 describe-security-groups --group-id sg-0e0408972c4f4f616

   {
     "SecurityGroups": [
        {
            "Description": "Private Security Group",
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
                            "GroupId": "sg-04f4e5c5c200d097b",
                            "UserId": "823151257518"
                        }
                    ]
                }
            ],
            "OwnerId": "823151257518",
            "GroupId": "sg-0e0408972c4f4f616",
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
            "VpcId": "vpc-090b5559554353054"
        }
     ]
   }

```

- Any extra challenges faced?

```
May not be a challenge, but it will be good to have in AWS. I explored whether there is a way to find my home laptop IP address. But cant find any AWS command to get the IP address of my home laptop. 

Wierd that there is a API from AWS that can find this but not any AWS command.

So, we need to either script it to get this IP automatically and use it in our security group rules, or call the API in the browser (manual) to get this IP.

```

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)
