# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
```
aws ec2 allocate-address \
    --region ap-southeast-1

{
    "PublicIp": "52.220.90.8",
    "AllocationId": "eipalloc-0fbd644b4ab043827",
    "PublicIpv4Pool": "amazon",
    "NetworkBorderGroup": "ap-southeast-1",
    "Domain": "vpc"
}

aws ec2 create-nat-gateway \
    --subnet-id subnet-0e9f13962485ddfe9 \
    --allocation-id eipalloc-0fbd644b4ab043827 \
    --tag-specifications 'ResourceType=natgateway,Tags=[{Key=Name,Value=devopsacademy-ngw},{Key=CreatedBy,Value=DMarshall}]' \
    --region ap-southeast-1

An error occurred (NatGatewayLimitExceeded) when calling the CreateNatGateway operation: Performing this operation would exceed the limit of 5 NAT gateways

{
    "ClientToken": "62a9ebc6-47bf-4372-bc67-85a475ca37de",
    "NatGateway": {
        "CreateTime": "2022-02-21T02:59:43+00:00",
        "NatGatewayAddresses": [
            {
                "AllocationId": "eipalloc-0fbd644b4ab043827"
            }
        ],
        "NatGatewayId": "nat-042fd88a5655be00a",
        "State": "pending",
        "SubnetId": "subnet-0e9f13962485ddfe9",
        "VpcId": "vpc-0a002c0e5a418e381",
        "Tags": [
            {
                "Key": "Name",
                "Value": "devopsacademy-ngw"
            },
            {
                "Key": "CreatedBy",
                "Value": "DMarshall"
            }
        ],
        "ConnectivityType": "public"
    }
}
```

- Any extra challenges faced?
Hitting limits in ap-southeast-2. Re-creating resources in another AWS region from this exercise onwards, with new resource IDs.
Also needed to create an EIP allocation beforehand.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)