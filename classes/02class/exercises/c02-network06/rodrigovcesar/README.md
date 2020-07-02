# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
```
aws ec2 allocate-address
{
    "PublicIp": "54.66.130.254",
    "AllocationId": "eipalloc-04284fd12f4723623",
    "PublicIpv4Pool": "amazon",
    "NetworkBorderGroup": "ap-southeast-2",
    "Domain": "vpc"
}

aws ec2 describe-subnets --filters "Name=tag-value,Values=public-a"
{
    "Subnets": [
        {
            "AvailabilityZone": "ap-southeast-2a",
            "AvailabilityZoneId": "apse2-az1",
            "AvailableIpAddressCount": 8187,
            "CidrBlock": "10.0.0.0/19",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "State": "available",
            "SubnetId": "subnet-0556ec1c9f6fc6007",
            "VpcId": "vpc-03f503f58eb9f0512",
            "OwnerId": "102825027349",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "public-a"
                }
            ],
            "SubnetArn": "arn:aws:ec2:ap-southeast-2:102825027349:subnet/subnet-0556ec1c9f6fc6007"
        }
    ]
}

aws ec2 create-nat-gateway --subnet-id subnet-0556ec1c9f6fc6007 --allocation-id eipalloc-04284fd12f4723623
{
    "ClientToken": "7e6aaa15-dcb4-4401-a63f-ef67c0b71d27",
    "NatGateway": {
        "CreateTime": "2020-07-02T12:40:11+00:00",
        "NatGatewayAddresses": [
            {
                "AllocationId": "eipalloc-04284fd12f4723623"
            }
        ],
        "NatGatewayId": "nat-0acd9c6ec134816b0",
        "State": "pending",
        "SubnetId": "subnet-0556ec1c9f6fc6007",
        "VpcId": "vpc-03f503f58eb9f0512"
    }
}

aws ec2 delete-nat-gateway --nat-gateway-id nat-0acd9c6ec134816b0
{
    "NatGatewayId": "nat-0acd9c6ec134816b0"
}

aws ec2 release-address --allocation-id eipalloc-04284fd12f4723623


```

- Any extra challenges faced?
In this one was OK only using the docs from AWS, just to figure out the Elastic IP


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)