# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```
$ aws ec2 create-network-interface \
    --subnet-id subnet-062fa33492cd979a6 \
    --description "DevOps Academy ENI" \
    --groups sg-01331d649596fcd01 \
    --private-ip-address 10.11.1.4

{
    "NetworkInterface": {
        "AvailabilityZone": "ap-southeast-2a",
        "Description": "DevOps Academy ENI",
        "Groups": [
            {
                "GroupName": "private-sg",
                "GroupId": "sg-01331d649596fcd01"
            }
        ],
        "InterfaceType": "interface",
        "Ipv6Addresses": [],
        "MacAddress": "02:90:bb:78:c7:52",
        "NetworkInterfaceId": "eni-0fab763805ac2c997",
        "OwnerId": "149613515908",
        "PrivateIpAddress": "10.11.1.4",
        "PrivateIpAddresses": [
            {
                "Primary": true,
                "PrivateIpAddress": "10.11.1.4"
            }
        ],
        "RequesterId": "AIDAJWDDF4V5TSEKCUUQW",
        "RequesterManaged": false,
        "SourceDestCheck": true,
        "Status": "pending",
        "SubnetId": "subnet-062fa33492cd979a6",
        "TagSet": [],
        "VpcId": "vpc-0721e28436cea8410"
    }
}

$ aws ec2 create-tags \
    --resources eni-0fab763805ac2c997 \
    --tags Key=Name,Value=devopsacademy-eni
```

- Any extra challenges faced?
Nope, all good :-)

***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)
