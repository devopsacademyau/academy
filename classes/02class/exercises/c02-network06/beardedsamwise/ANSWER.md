# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
```
$ aws ec2 allocate-address
{
    "PublicIp": "13.238.124.40",
    "AllocationId": "eipalloc-07f54130e3178a93a",
    "PublicIpv4Pool": "amazon",
    "NetworkBorderGroup": "ap-southeast-2",
    "Domain": "vpc"
}

$ aws ec2 create-nat-gateway \
    --subnet-id subnet-087f588f03b7ad0c1 \
    --allocation-id eipalloc-07f54130e3178a93a
{
    "ClientToken": "3c4b492e-e0d4-487d-8e4c-133ade9d4f49",
    "NatGateway": {
        "CreateTime": "2022-02-16T05:43:20+00:00",
        "NatGatewayAddresses": [
            {
                "AllocationId": "eipalloc-07f54130e3178a93a"
            }
        ],
        "NatGatewayId": "nat-0f46d7abd2b989005",
        "State": "pending",
        "SubnetId": "subnet-087f588f03b7ad0c1",
        "VpcId": "vpc-09666fb121d6ae087",
        "ConnectivityType": "public"
    }
}
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)