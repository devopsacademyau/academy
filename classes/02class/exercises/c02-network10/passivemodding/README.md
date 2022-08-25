# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```yaml
aws ec2 create-network-interface \
    --subnet-id subnet-0bde38b7afdbd6944 \
    --groups sg-02b2fcad404a76fc9 \
    --private-ip-address 10.10.1.20

{
    "NetworkInterface": {
        "AvailabilityZone": "ap-southeast-2a",
        "Description": "",
        "Groups": [
            {
                "GroupName": "private-sg",
                "GroupId": "sg-02b2fcad404a76fc9"
            }
        ],
        "InterfaceType": "interface",
        "Ipv6Addresses": [],
        "MacAddress": "06:ad:aa:88:45:d6",
        "NetworkInterfaceId": "eni-0fe58d4ec76fd4f2d",
        "OwnerId": "152848913167",
        "PrivateIpAddress": "10.10.1.20",
        "PrivateIpAddresses": [
            {
                "Primary": true,
                "PrivateIpAddress": "10.10.1.20"
            }
        ],
        "RequesterId": "AROASHFUBKMH3NFVXLE6I:lachlan.jaques@contino.io",
        "RequesterManaged": false,
        "SourceDestCheck": true,
        "Status": "pending",
        "SubnetId": "subnet-0bde38b7afdbd6944",
        "TagSet": [],
        "VpcId": "vpc-09b37d389cf1e7937"
    }
}
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)