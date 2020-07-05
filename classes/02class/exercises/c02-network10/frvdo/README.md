# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```
$ aws ec2 create-network-interface  --subnet-id subnet-0b9349fa56d76afb7 --description "DA ENI"  --groups sg-0f13d66af24816cf5  --private-ip-address 172.16.20.100
{
    "NetworkInterface": {
        "AvailabilityZone": "ap-southeast-2b",
        "Description": "DA ENI",
        "Groups": [
            {
                "GroupName": "private-sg",
                "GroupId": "sg-0f13d66af24816cf5"
            }
        ],
        "InterfaceType": "interface",
        "Ipv6Addresses": [],
        "MacAddress": "06:fb:8e:85:a1:9e",
        "NetworkInterfaceId": "eni-06843a9d81d573a08",
        "OwnerId": "165765640813",
        "PrivateIpAddress": "172.16.20.100",
        "PrivateIpAddresses": [
            {
                "Primary": true,
                "PrivateIpAddress": "172.16.20.100"
            }
        ],
        "RequesterId": "AIDASNGDG6JWRDN7R4WJL",
        "RequesterManaged": false,
        "SourceDestCheck": true,
        "Status": "pending",
        "SubnetId": "subnet-0b9349fa56d76afb7",
        "TagSet": [],
        "VpcId": "vpc-0a2b7db4956438d22"
    }
}
$ aws ec2 create-tags --resources  eni-06843a9d81d573a08 --tags Key=Name,Value=private-b-eni

$ aws ec2 describe-network-interfaces --network-interface-ids eni-06843a9d81d573a08
{
    "NetworkInterfaces": [
        {
            "AvailabilityZone": "ap-southeast-2b",
            "Description": "DA ENI",
            "Groups": [
                {
                    "GroupName": "private-sg",
                    "GroupId": "sg-0f13d66af24816cf5"
                }
            ],
            "InterfaceType": "interface",
            "Ipv6Addresses": [],
            "MacAddress": "06:fb:8e:85:a1:9e",
            "NetworkInterfaceId": "eni-06843a9d81d573a08",
            "OwnerId": "165765640813",
            "PrivateIpAddress": "172.16.20.100",
            "PrivateIpAddresses": [
                {
                    "Primary": true,
                    "PrivateIpAddress": "172.16.20.100"
                }
            ],
            "RequesterId": "AIDASNGDG6JWRDN7R4WJL",
            "RequesterManaged": false,
            "SourceDestCheck": true,
            "Status": "available",
            "SubnetId": "subnet-0b9349fa56d76afb7",
            "TagSet": [
                {
                    "Key": "Name",
                    "Value": "private-b-eni"
                }
            ],
            "VpcId": "vpc-0a2b7db4956438d22"
        }
    ]
}
```

- Any extra challenges faced?
No

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)