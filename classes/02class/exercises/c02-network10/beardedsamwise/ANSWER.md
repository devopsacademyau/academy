# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```
aws ec2 create-network-interface --subnet-id subnet-0a05ed9c8336c5f07 --description "private-a-eni-01" --groups sg-0f83244d342a2c680 --private-ip-address 10.0.10.20
{
    "NetworkInterface": {
        "AvailabilityZone": "ap-southeast-2a",
        "Description": "private-a-eni-01",
        "Groups": [
            {
                "GroupName": "private-sg",
                "GroupId": "sg-0f83244d342a2c680"
            }
        ],
        "InterfaceType": "interface",
        "Ipv6Addresses": [],
        "MacAddress": "06:17:07:d4:fa:84",
        "NetworkInterfaceId": "eni-0fb129032f2492f72",
        "OwnerId": "639247960747",
        "PrivateIpAddress": "10.0.10.20",
        "PrivateIpAddresses": [
            {
                "Primary": true,
                "PrivateIpAddress": "10.0.10.20"
            }
        ],
        "RequesterId": "AIDAZJVRFZKVZKKIXHAR5",
        "RequesterManaged": false,
        "SourceDestCheck": true,
        "Status": "pending",
        "SubnetId": "subnet-0a05ed9c8336c5f07",
        "TagSet": [],
        "VpcId": "vpc-09666fb121d6ae087"
    }
}
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)