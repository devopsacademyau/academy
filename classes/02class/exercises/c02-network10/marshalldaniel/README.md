# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```
aws ec2 create-network-interface \
    --groups sg-039156288d7a1dece \
    --private-ip-address 10.0.0.10 \
    --subnet-id subnet-014271f4eb5ba8d27 \
    --region ap-southeast-1
{
    "NetworkInterface": {
        "AvailabilityZone": "ap-southeast-1a",
        "Description": "",
        "Groups": [
            {
                "GroupName": "private-sg",
                "GroupId": "sg-039156288d7a1dece"
            }
        ],
        "InterfaceType": "interface",
        "Ipv6Addresses": [],
        "MacAddress": "02:7c:89:a8:a7:e4",
        "NetworkInterfaceId": "eni-0e4c3eeca9fdd7907",
        "OwnerId": "152848913167",
        "PrivateIpAddress": "10.0.0.10",
        "PrivateIpAddresses": [
            {
                "Primary": true,
                "PrivateIpAddress": "10.0.0.10"
            }
        ],
        "RequesterId": "AIDASHFUBKMH6XS5Z3I5V",
        "RequesterManaged": false,
        "SourceDestCheck": true,
        "Status": "pending",
        "SubnetId": "subnet-014271f4eb5ba8d27",
        "TagSet": [],
        "VpcId": "vpc-0a002c0e5a418e381"
    }
}
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)