# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```
Command:
aws ec2 create-network-interface \
    --groups sg-0408abc0afed4c5c5 \
    --private-ip-address 10.0.0.10 \
    --subnet-id subnet-0334b66f2ca1b1ed8 \
    --region ap-southeast-2

Output:
{
    "NetworkInterface": {
        "AvailabilityZone": "ap-southeast-2a",
        "Description": "",
        "Groups": [
            {
                "GroupName": "private-sg",
                "GroupId": "sg-0408abc0afed4c5c5"
            }
        ],
        "InterfaceType": "interface",
        "Ipv6Addresses": [],
        "MacAddress": "02:a2:ac:57:d6:40",
        "NetworkInterfaceId": "eni-09b64974418db9894",
        "OwnerId": "969496245957",
        "PrivateIpAddress": "10.0.0.10",
        "PrivateIpAddresses": [
            {
                "Primary": true,
                "PrivateIpAddress": "10.0.0.10"
            }
        ],
        "RequesterId": "AIDA6DOT2W3CYVH5HNSUQ",
        "RequesterManaged": false,
        "SourceDestCheck": true,
        "Status": "pending",
        "SubnetId": "subnet-0334b66f2ca1b1ed8",
        "TagSet": [],
        "VpcId": "vpc-0e9963972a29d0cc3"
    }
}

```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)
