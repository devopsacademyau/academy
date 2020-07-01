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

 I am unable to add Security group to the create-network-interface command. Whenever i add parameter "--groups sg-group-name" or "--group-ids sg-groupid", i am always getting groups or group-ids not found error. 

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)
