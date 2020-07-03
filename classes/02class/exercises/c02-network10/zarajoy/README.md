# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet


https://docs.aws.amazon.com/cli/latest/reference/ec2/create-network-interface.html


https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-network-interfaces.html


|SubnetID | Subnet Address | Host Address Range | Public/Private | SubnetID | RouteTable |
|-|-|-|-|-| - |
|1|192.168.0.0/19|192.168.0.1 - 192.168.31.254|Private-a|subnet-07cd3a9c8c7c3634e| rtb-0f8fb399d2a29b2fa |


```
z@bacon:~$ aws ec2 create-network-interface  --subnet-id subnet-07cd3a9c8c7c3634e  --description "DevopsAcademy Network Interface"  --groups sg-0f9b7a15d80e0ad02  --private-ip-address 192.168.13.37
{
    "NetworkInterface": {
        "AvailabilityZone": "ap-southeast-2a",
        "Description": "DevopsAcademy Network Interface",
        "Groups": [
            {
                "GroupName": "private-sg",
                "GroupId": "sg-0f9b7a15d80e0ad02"
            }
        ],
        "InterfaceType": "interface",
        "Ipv6Addresses": [],
        "MacAddress": "06:f7:01:3a:22:78",
        "NetworkInterfaceId": "eni-0e958326f6f210b9c",
        "OwnerId": "512742231244",
        "PrivateIpAddress": "192.168.13.37",
        "PrivateIpAddresses": [
            {
                "Primary": true,
                "PrivateIpAddress": "192.168.13.37"
            }
        ],
        "RequesterId": "AIDAXOYORRTGDDLSJ27VE",
        "RequesterManaged": false,
        "SourceDestCheck": true,
        "Status": "pending",
        "SubnetId": "subnet-07cd3a9c8c7c3634e",
        "TagSet": [],
        "VpcId": "vpc-09d2f2719d50d1f7f"
    }
}
z@bacon:~$ aws ec2 create-tags --resources eni-0e958326f6f210b9c --tags Key=Name,Value=Private-a-NetworkInterface

z@bacon:~$ aws ec2 describe-network-interfaces --filters Name=tag:Name,Values=Private-a-NetworkInterface
{
    "NetworkInterfaces": [
        {
            "AvailabilityZone": "ap-southeast-2a",
            "Description": "DevopsAcademy Network Interface",
            "Groups": [
                {
                    "GroupName": "private-sg",
                    "GroupId": "sg-0f9b7a15d80e0ad02"
                }
            ],
            "InterfaceType": "interface",
            "Ipv6Addresses": [],
            "MacAddress": "06:f7:01:3a:22:78",
            "NetworkInterfaceId": "eni-0e958326f6f210b9c",
            "OwnerId": "512742231244",
            "PrivateIpAddress": "192.168.13.37",
            "PrivateIpAddresses": [
                {
                    "Primary": true,
                    "PrivateIpAddress": "192.168.13.37"
                }
            ],
            "RequesterId": "AIDAXOYORRTGDDLSJ27VE",
            "RequesterManaged": false,
            "SourceDestCheck": true,
            "Status": "available",
            "SubnetId": "subnet-07cd3a9c8c7c3634e",
            "TagSet": [
                {
                    "Key": "Name",
                    "Value": "Private-a-NetworkInterface"
                }
            ],
            "VpcId": "vpc-09d2f2719d50d1f7f"
        }
    ]
}


```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)