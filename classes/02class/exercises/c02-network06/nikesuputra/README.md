# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
```
# Command to allocate an elastic IP address
aws ec2 allocate-address
{
    "PublicIp": "52.74.16.119",
    "AllocationId": "eipalloc-0e613de3148d0bd09",
    "PublicIpv4Pool": "amazon",
    "NetworkBorderGroup": "ap-southeast-1",
    "Domain": "vpc"
}

# Command to create a public NAT gateway
aws ec2 create-nat-gateway \
    --subnet-id subnet-0ac6ac8d810afda4c \
    --allocation-id eipalloc-0e613de3148d0bd09
{
    "ClientToken": "0b9050c7-d6a1-436b-98d9-2bce24f728f3",
    "NatGateway": {
        "CreateTime": "2022-06-28T23:29:19+00:00",
        "NatGatewayAddresses": [
            {
                "AllocationId": "eipalloc-0e613de3148d0bd09"
            }
        ],
        "NatGatewayId": "nat-0313733d4615bee35",
        "State": "pending",
        "SubnetId": "subnet-0ac6ac8d810afda4c",
        "VpcId": "vpc-0d4d5380eac332f8b",
        "ConnectivityType": "public"
    }
}
```

- Any extra challenges faced?
None

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)
