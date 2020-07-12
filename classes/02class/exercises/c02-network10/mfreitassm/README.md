# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```
aws ec2 create-network-interface --subnet-id subnet-077d95081dbd28d26 --description "private network interface" --groups sg-04a749673e309f05d --private-ip-address 10.0.1.10

{
    "NetworkInterface": {
        "AvailabilityZone": "ap-southeast-2a",
        "Description": "private network interface",
        "Groups": [
            {
                "GroupName": "private-sg",
                "GroupId": "sg-04a749673e309f05d"
            }
        ],
        "InterfaceType": "interface",
        "Ipv6Addresses": [],
        "MacAddress": "06:58:02:0d:c6:d6",
        "NetworkInterfaceId": "eni-07e72144cdda486b2",
        "OwnerId": "490308117505",
        "PrivateIpAddress": "10.0.1.10",
        "PrivateIpAddresses": [
            {
                "Primary": true,
                "PrivateIpAddress": "10.0.1.10"
            }
        ],
        "RequesterId": "AIDAXEKFEEQA4TPKGONJ2",
        "RequesterManaged": false,
        "SourceDestCheck": true,
        "Status": "pending",
        "SubnetId": "subnet-077d95081dbd28d26",
        "TagSet": [],
        "VpcId": "vpc-04426efcf5b2228a4"
    }
}

```

- Any extra challenges faced?
No

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)
