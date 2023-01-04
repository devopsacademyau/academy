# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:

The following create-nat-gateway  creates a public NAT gateway in the public subnet (a) we created in earlier exercise and associates the Elastic IP address with the specified allocation ID. When you create a public NAT gateway, you must associate an Elastic IP address. Therefore, first lets allocate an Elastic IP

```
aws ec2 allocate-address

Output
    {
        "PublicIp": "13.52.25.41",
        "AllocationId": "eipalloc-0cbe2daff1a2e2788",
        "PublicIpv4Pool": "amazon",
        "NetworkBorderGroup": "us-west-1",
        "Domain": "vpc"
    }



aws ec2 create-nat-gateway \
    --subnet-id subnet-028f49f43c269bbb6 \
    --allocation-id eipalloc-0cbe2daff1a2e2788

Output
    {
        "ClientToken": "950eb5e6-a4cf-4165-9c1d-221188f5b76c",
        "NatGateway": {
            "CreateTime": "2022-08-29T01:49:39+00:00",
            "NatGatewayAddresses": [
                {
                    "AllocationId": "eipalloc-0cbe2daff1a2e2788"
                }
            ],
            "NatGatewayId": "nat-0824a2c60f306cb4a",
            "State": "pending",
            "SubnetId": "subnet-028f49f43c269bbb6",
            "VpcId": "vpc-0c6f909f7f7dd06d7",
            "ConnectivityType": "public"
        }
    }
```

Finally, lets add a name to our NAT gateway so that we can easily identify it.

```
aws ec2 create-tags \
    --resources nat-0824a2c60f306cb4a --tags Key=Name,Value=devopsacademy-ngw

Output
- Any extra challenges faced?
NONE


***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)