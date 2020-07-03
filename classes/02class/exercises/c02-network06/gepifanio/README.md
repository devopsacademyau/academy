# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
```
aws ec2 allocate-address \
    --domain vpc 

{
    "PublicIp": "52.62.227.138",
    "AllocationId": "eipalloc-0e47890225c3f9969",
    "PublicIpv4Pool": "amazon",
    "NetworkBorderGroup": "ap-southeast-2",
    "Domain": "vpc"
}

aws ec2 create-nat-gateway --subnet-id subnet-0c341aabdd7fc51d6 --allocation-id eipalloc-0e47890225c3f9969

{
    "NatGateway": {
        "CreateTime": "2020-07-02T10:57:36+00:00",
        "NatGatewayAddresses": [
            {
                "AllocationId": "eipalloc-0e47890225c3f9969"
            }
        ],
        "NatGatewayId": "nat-0fbe2a7f66cdb2924",
        "State": "pending",
        "SubnetId": "subnet-0c341aabdd7fc51d6",
        "VpcId": "vpc-018717ea8ed22e6ae"
    }
}

aws ec2 create-tags \
    --resources nat-0fbe2a7f66cdb2924 \
    --tags Key=Name,Value=devopsacademy-ngw

aws ec2 delete-nat-gateway --nat-gateway-id nat-0fbe2a7f66cdb2924

{
    "NatGatewayId": "nat-0fbe2a7f66cdb2924"
}

aws ec2 release-address --allocation-id  eipalloc-0e47890225c3f9969

```

- Any extra challenges faced?

Yes, it was hard to find out that allocation id need to be created beforehand, and how to do that. But All sorted.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)