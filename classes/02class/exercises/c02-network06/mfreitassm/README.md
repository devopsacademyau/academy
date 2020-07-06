# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
```
Create a network interface
//subnet public-b
aws ec2 create-network-interface --subnet-id subnet-0dd087be76dd34768 --description "devopsacademy network interface" --groups sg-021fa8202867b5ce0 

{
    "NetworkInterface": {
        "AvailabilityZone": "ap-southeast-2b",
        "Description": "devopsacademy network interface",
        "Groups": [
            {
                "GroupName": "default",
                "GroupId": "sg-021fa8202867b5ce0"
            }
        ],
        "InterfaceType": "interface",
        "Ipv6Addresses": [],
        "MacAddress": "02:07:d3:21:35:2e",
        "NetworkInterfaceId": "eni-06bc2518d39cdf022",
        "OwnerId": "490308117505",
        "PrivateIpAddress": "10.0.10.174",
        "PrivateIpAddresses": [
            {
                "Primary": true,
                "PrivateIpAddress": "10.0.10.174"
            }
        ],
        "RequesterId": "AIDAXEKFEEQA4TPKGONJ2",
        "RequesterManaged": false,
        "SourceDestCheck": true,
        "Status": "pending",
        "SubnetId": "subnet-0dd087be76dd34768",
        "TagSet": [],
        "VpcId": "vpc-04426efcf5b2228a4"
    }
}

Associate Network Interface with te elastic IP
aws ec2 associate-address --allocation-id eipalloc-0ce4bab5ca01b643f --network-interface-id eni-06bc2518d39cdf022 --private-ip-address 10.0.10.174
{
    "AssociationId": "eipassoc-0b36d9fb021c930ed"
}

Create NAT
aws ec2 create-nat-gateway --subnet-id subnet-0dd087be76dd34768 --allocation-id eipalloc-0ce4bab5ca01b643f --tags Key=Name,Value=devopsacademy-ngw

{
    "NatGateway": {
        "CreateTime": "2020-07-06T07:47:52.000Z",
        "NatGatewayAddresses": [
            {
                "AllocationId": "eipalloc-0ce4bab5ca01b643f"
            }
        ],
        "NatGatewayId": "nat-08c0c5ed60d56a9d1",
        "State": "pending",
        "SubnetId": "subnet-0dd087be76dd34768",
        "VpcId": "vpc-04426efcf5b2228a4"
    }
}


aws ec2 create-tags --resources nat-08c0c5ed60d56a9d1 --tags Key=Name,Value=devopsacademy-ngw
aws ec2 describe-nat-gateways
{
    "NatGateways": [
        {
            "CreateTime": "2020-07-06T07:47:52.000Z",
            "NatGatewayAddresses": [
                {
                    "AllocationId": "eipalloc-0ce4bab5ca01b643f",
                    "NetworkInterfaceId": "eni-04a8b00d8a627295b",
                    "PrivateIp": "10.0.10.38"
                }
            ],
            "NatGatewayId": "nat-08c0c5ed60d56a9d1",
            "State": "pending",
            "SubnetId": "subnet-0dd087be76dd34768",
            "VpcId": "vpc-04426efcf5b2228a4",
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "devopsacademy-ngw"
                }
            ]
        }
    ]
}

```

- Any extra challenges faced?
No

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)