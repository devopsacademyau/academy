# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
```
Allocate Elastc IP
aws ec2 allocate-address

"PublicIp": "52.65.40.187",
    "AllocationId": "eipalloc-0179ca368115afcb4",
    "PublicIpv4Pool": "amazon",
    "NetworkBorderGroup": "ap-southeast-2",
    "Domain": "vpc"

Create NAT
aws ec2 create-nat-gateway --subnet-id subnet-0dd087be76dd34768 --allocation-id eipalloc-0179ca368115afcb4 --tags Key=Name,Value=devopsacademy-ngw

{
    "NatGateway": {
        "CreateTime": "2020-07-06T07:47:52.000Z",
        "NatGatewayAddresses": [
            {
                "AllocationId": "eipalloc-0179ca368115afcb4"
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
                    "AllocationId": "eipalloc-0179ca368115afcb4 ",
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