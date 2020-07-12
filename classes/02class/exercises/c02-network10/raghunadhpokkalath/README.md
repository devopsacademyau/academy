# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```
> aws ec2  create-network-interface --private-ip-address 10.0.1.35 --subnet-id subnet-0b93b57d95a2de8d4 --groups sg-01ae6489e38ada216

{
    "NetworkInterface": {
        "AvailabilityZone": "ap-southeast-2a",
        "Description": "",
        "Groups": [
            {
                "GroupName": "private-sg",
                "GroupId": "sg-01ae6489e38ada216"
            }
        ],
        "InterfaceType": "interface",
        "Ipv6Addresses": [],
        "MacAddress": "02:d5:a2:57:5b:f2",
        "NetworkInterfaceId": "eni-0cfef972aa7334b23",
        "OwnerId": "361529347535",
        "PrivateIpAddress": "10.0.1.35",
        "PrivateIpAddresses": [
            {
                "Primary": true,
                "PrivateIpAddress": "10.0.1.35"
            }
        ],
        "RequesterId": "AIDAVILGUBXHXQN4QIMOV",
        "RequesterManaged": false,
        "SourceDestCheck": true,
        "Status": "pending",
        "SubnetId": "subnet-0b93b57d95a2de8d4",
        "TagSet": [],
        "VpcId": "vpc-076a05ec0f3be4895"
    }
}

```

- Any extra challenges faced?
```
Had to delete and create Network interface as i didnt attach security group initially
```


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)