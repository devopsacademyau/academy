# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```
aws ec2 create-network-interface \
--subnet-id subnet-04abf35901ad7a22a \
--description "ENI network interface" \
--groups sg-0b64282ceb6c83fb0 \
--private-ip-address 172.16.32.20
>The command returns:
{
    "NetworkInterface": {
        "AvailabilityZone": "ap-southeast-2a",
        "Description": "ENI network interface",
        "Groups": [
            {
                "GroupName": "private-sg",
                "GroupId": "sg-0b64282ceb6c83fb0"
            }
        ],
        "InterfaceType": "interface",
        "Ipv6Addresses": [],
        "MacAddress": "02:e6:a8:18:18:8e",
        "NetworkInterfaceId": "eni-0130b98ffaa477689",
        "OwnerId": "438549961569",
        "PrivateIpAddress": "172.16.32.20",
        "PrivateIpAddresses": [
            {
                "Primary": true,
                "PrivateIpAddress": "172.16.32.20"
            }
        ],
        "RequesterId": "AIDAWMG45LNQRL364UND4",
        "RequesterManaged": false,
        "SourceDestCheck": true,
        "Status": "pending",
        "SubnetId": "subnet-04abf35901ad7a22a",
        "TagSet": [],
        "VpcId": "vpc-081afcee350babdf5"
    }
}
aws ec2 create-tags --resources eni-0130b98ffaa477689 --tags Key=Name,Value=ENI-privateSubnet

```

- Any extra challenges faced?
None for this exercise



***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)