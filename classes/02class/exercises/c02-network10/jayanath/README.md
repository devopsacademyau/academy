# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```
## create a new ENI for private-a subnet

> aws ec2 create-network-interface \
    --subnet-id subnet-0ee93ecd696d65414 \
    --description "DOA ENI" \
    --groups sg-06519b6fe81ef49d3 \
    --private-ip-address 192.168.10.10

    {
        "NetworkInterface": {
            "AvailabilityZone": "ap-southeast-2a",
            "Description": "DOA ENI",
            "Groups": [
                {
                    "GroupName": "private-sg",
                    "GroupId": "sg-06519b6fe81ef49d3"
                }
            ],
            "InterfaceType": "interface",
            "Ipv6Addresses": [],
            "MacAddress": "02:39:3f:81:cf:d2",
            "NetworkInterfaceId": "eni-026389c444ebacbb6",
            "OwnerId": "907095435092",
            "PrivateIpAddress": "192.168.10.10",
            "PrivateIpAddresses": [
                {
                    "Primary": true,
                    "PrivateIpAddress": "192.168.10.10"
                }
            ],
            "RequesterId": "AIDA5GMYZ45KA2XBHRGKU",
            "RequesterManaged": false,
            "SourceDestCheck": true,
            "Status": "pending",
            "SubnetId": "subnet-0ee93ecd696d65414",
            "TagSet": [],
            "VpcId": "vpc-007774900b7f4c596"
        }
    }

```

- Any extra challenges faced?
```
None for this one.
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)