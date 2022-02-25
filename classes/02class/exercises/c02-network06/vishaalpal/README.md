# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
```
# Allocating an EIP for the NAT gateway
Command:
aws ec2 allocate-address \
    --region ap-southeast-2

Output:
{
    "PublicIp": "13.55.188.61",
    "AllocationId": "eipalloc-0cfe67c317d320ab5",
    "PublicIpv4Pool": "amazon",
    "NetworkBorderGroup": "ap-southeast-2",
    "Domain": "vpc"
}

# Creating a NAT Gateway
Command:
aws ec2 create-nat-gateway \
    --subnet-id subnet-0fc530aa074c01084 \
    --allocation-id eipalloc-0cfe67c317d320ab5 \
    --tag-specifications 'ResourceType=natgateway,Tags=[{Key=Name,Value=devopsacademy-ngw}]' \
    --region ap-southeast-2

Output:
{
    "ClientToken": "e4a14431-6f0b-4d2b-959f-e688425db497",
    "NatGateway": {
        "CreateTime": "2022-02-25T06:39:28+00:00",
        "NatGatewayAddresses": [
            {
                "AllocationId": "eipalloc-0cfe67c317d320ab5"
            }
        ],
        "NatGatewayId": "nat-000c46964aa7043ae",
        "State": "pending",
        "SubnetId": "subnet-0fc530aa074c01084",
        "VpcId": "vpc-0e9963972a29d0cc3",
        "Tags": [
            {
                "Key": "Name",
                "Value": "devopsacademy-ngw"
            }
        ],
        "ConnectivityType": "public"
    }
}
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)

