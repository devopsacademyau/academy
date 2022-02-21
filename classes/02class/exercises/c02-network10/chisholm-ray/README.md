# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```
tags=(--tag-specifications                                                                           
'ResourceType=network-interface,Tags=[
{Key=Name,Value=ccr-dojo-private-rt}
]') && \
aws ec2 create-network-interface \
 --subnet-id subnet-0a728ec3b7e79f619 \
 --description "my network interface" \
 --groups sg-0b6b4303beb0693c3 \
 --private-ip-address 10.0.1.5 \
 "${tags[@]}"
```
```
{
    "NetworkInterface": {
        "AvailabilityZone": "ap-southeast-2a",
        "Description": "my network interface",
        "Groups": [
            {
                "GroupName": "ccr-dojo-private-sg",
                "GroupId": "sg-0b6b4303beb0693c3"
            }
        ],
        "InterfaceType": "interface",
        "Ipv6Addresses": [],
        "MacAddress": "06:97:8c:00:aa:9c",
        "NetworkInterfaceId": "eni-0d07753ba6578fb2f",
        "OwnerId": "152848913167",
        "PrivateIpAddress": "10.0.1.5",
        "PrivateIpAddresses": [
            {
                "Primary": true,
                "PrivateIpAddress": "10.0.1.5"
            }
        ],
        "RequesterId": "AROASHFUBKMH3NFVXLE6I:conor.chisholm-ray@contino.io",
        "RequesterManaged": false,
        "SourceDestCheck": true,
        "Status": "pending",
        "SubnetId": "subnet-0a728ec3b7e79f619",
        "TagSet": [   
            {
                "Key": "Name",
                "Value": "ccr-dojo-private-rt"
            }
        ],
        "VpcId": "vpc-091f1866ec064400e"
    }
}
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)