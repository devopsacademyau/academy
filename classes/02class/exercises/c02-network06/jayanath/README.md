# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
```
## need an Elastic IP to allocate to the NAT gateway
> aws ec2 allocate-address

    {
        "PublicIp": "13.237.200.105",
        "AllocationId": "eipalloc-08e342404e809182f",
        "PublicIpv4Pool": "amazon",
        "NetworkBorderGroup": "ap-southeast-2",
        "Domain": "vpc"
    }

## creating NAT gateway and attach to public-a subnet
> aws ec2 create-nat-gateway \
    --subnet-id subnet-05ba54dadeae3a83c \
    --allocation-id eipalloc-08e342404e809182f

    {
        "ClientToken": "bee39654-2c69-4fd1-9ab2-60fb48cd050f",
        "NatGateway": {
            "CreateTime": "2020-06-25T09:45:12+00:00",
            "NatGatewayAddresses": [
                {
                    "AllocationId": "eipalloc-08e342404e809182f"
                }
            ],
            "NatGatewayId": "nat-0d7ce38d84290da84",
            "State": "pending",
            "SubnetId": "subnet-05ba54dadeae3a83c",
            "VpcId": "vpc-007774900b7f4c596"
        }
    }

```

- Any extra challenges faced?
```
- Had to create an EIP before creating the NAT gateway

```

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)