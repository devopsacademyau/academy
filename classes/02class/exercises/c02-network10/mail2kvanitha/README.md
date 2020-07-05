# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```
 > aws ec2 create-network-interface --description "devopsacademy-eni" --private-ip-address 10.10.2.130 --subnet-id subnet-07762642349e66471
  
   {
    "NetworkInterface": {
        "AvailabilityZone": "ap-southeast-2b",
        "Description": "devopsacademy-eni",
        "Groups": [
            {
                "GroupName": "default",
                "GroupId": "sg-09d15149bddc33214"
            }
        ],
        "InterfaceType": "interface",
        "Ipv6Addresses": [],
        "MacAddress": "06:7f:28:d3:ae:ac",
        "NetworkInterfaceId": "eni-0cf59acd4e9e51b6a",
        "OwnerId": "823151257518",
        "PrivateIpAddress": "10.10.2.130",
        "PrivateIpAddresses": [
            {
                "Primary": true,
                "PrivateIpAddress": "10.10.2.130"
            }
        ],
        "RequesterId": "AIDA37J5DM6XBR4JZNNMN",
        "RequesterManaged": false,
        "SourceDestCheck": true,
        "Status": "pending",
        "SubnetId": "subnet-07762642349e66471",
        "TagSet": [],
        "VpcId": "vpc-0d4cd22a6e87c698a"
     }
   }

 > aws ec2 describe-subnets --subnet-ids subnet-07762642349e66471
   {
    "Subnets": [
        {
            "AvailabilityZone": "ap-southeast-2b",
            "AvailabilityZoneId": "apse2-az3",
            "AvailableIpAddressCount": 250,
            "CidrBlock": "10.10.2.0/24",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "State": "available",
            "SubnetId": "subnet-07762642349e66471",
            "VpcId": "vpc-0d4cd22a6e87c698a",
            "OwnerId": "823151257518",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "private-b"
                }
            ],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:823151257518:subnet/subnet-07762642349e66471"
        }
     ]
   }
 
```

- Any extra challenges faced?
```
I created custom Security group "devopsacademy-ec2sg" and attached it to the VPC "devopsacademy-vpc". 

The create network interface command doesnt let me to add security groups with "--groups security-group-name". I got security group doesnt exist error. 

> aws ec2 modify-network-interface-attribute --network-interface-id eni-0cf59acd4e9e51b6a --groups devopsacademy-ec2sg

   An error occurred (InvalidGroup.NotFound) when calling the ModifyNetworkInterfaceAttribute operation: The security group 'devopsacademy-ec2sg' does not exist

But when i do describe security groups, i am able to view the security groups

 > aws ec2 describe-security-groups --group-ids sg-0338d87ff2cb69501
   {
      "SecurityGroups": [
          {
            "Description": "devopsacademy-ec2sg created 2020-07-01T15:28:20.961+10:00",
            "GroupName": "devopsacademy-ec2sg",
            "IpPermissions": [
                {
                    "FromPort": 22,
                    "IpProtocol": "tcp",
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 22,
                    "UserIdGroupPairs": []
                }
            ],
            "OwnerId": "823151257518",
            "GroupId": "sg-0338d87ff2cb69501",
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
            "VpcId": "vpc-0d4cd22a6e87c698a"
         }
      ]
   }

 so, i created the network interface without --groups command. I observed that the default security group of the VPC is attached to the network interface. 
 
 > aws ec2 describe-security-groups --group-ids sg-09d15149bddc33214
   {
     "SecurityGroups": [
        {
            "Description": "default VPC security group",
            "GroupName": "default",
            "IpPermissions": [
                {
                    "IpProtocol": "-1",
                    "IpRanges": [],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "UserIdGroupPairs": [
                        {
                            "GroupId": "sg-09d15149bddc33214",
                            "UserId": "823151257518"
                        }
                    ]
                }
            ],
            "OwnerId": "823151257518",
            "GroupId": "sg-09d15149bddc33214",
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
            "VpcId": "vpc-0d4cd22a6e87c698a"
        }
     ]
  }

```

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)
