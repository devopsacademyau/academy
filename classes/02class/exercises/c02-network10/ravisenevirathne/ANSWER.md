# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```
aws ec2 create-network-interface \
    --subnet-id subnet-0bdd0e96fc5faab89 \
    --description "Elastic network interface" \
    --groups sg-02e108749814f1c16 \
    --private-ip-address 10.10.1.10

{
    "NetworkInterface": {
        "AvailabilityZone": "ap-southeast-2a",
        "Description": "Elastic network interface",
        "Groups": [
            {
                "GroupName": "private-sg-ravi",
                "GroupId": "sg-02e108749814f1c16"
            }
        ],
        "InterfaceType": "interface",
        "Ipv6Addresses": [],
        "MacAddress": "06:26:16:07:31:e0",
        "NetworkInterfaceId": "eni-0e06a9b5f9573b9d5",
        "OwnerId": "152848913167",
        "PrivateIpAddress": "10.10.1.10",
        "PrivateIpAddresses": [
            {
                "Primary": true,
                "PrivateIpAddress": "10.10.1.10"
            }
        ],
        "RequesterId": "AIDASHFUBKMHYN2GKWF7E",
        "RequesterManaged": false,
        "SourceDestCheck": true,
        "Status": "pending",
        "SubnetId": "subnet-0bdd0e96fc5faab89",
        "TagSet": [],
        "VpcId": "vpc-09b37d389cf1e7937"
    }
}
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)