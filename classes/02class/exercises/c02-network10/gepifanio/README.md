# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```

aws ec2 create-network-interface --subnet-id subnet-0525ca8d01593ccbb --description "my network interface with my private subnet" --groups sg-0824e1528809be815 --private-ip-address 10.0.0.15

{
    "NetworkInterface": {
        "AvailabilityZone": "ap-southeast-2a",
        "Description": "my network interface with my private subnet",
        "Groups": [
            {
                "GroupName": "private-sg",
                "GroupId": "sg-0824e1528809be815"
            }
        ],
        "InterfaceType": "interface",
        "Ipv6Addresses": [],
        "MacAddress": "06:6c:51:40:de:7c",
        "NetworkInterfaceId": "eni-09ec9a93ec3352adf",
        "OwnerId": "873547843801",
        "PrivateIpAddress": "10.0.0.15",
        "PrivateIpAddresses": [
            {
                "Primary": true,
                "PrivateIpAddress": "10.0.0.15"
            }
        ],
        "RequesterManaged": false,
        "SourceDestCheck": true,
        "Status": "pending",
        "SubnetId": "subnet-0525ca8d01593ccbb",
        "TagSet": [],
        "VpcId": "vpc-018717ea8ed22e6ae"
    }
}

```

- Any extra challenges faced?

Yes, had to recreate my SG, as they were not associated with the correct VPC.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)