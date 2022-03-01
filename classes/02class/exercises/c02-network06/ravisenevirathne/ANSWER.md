# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
```
#Allocated Elastic ip

aws ec2 allocate-address \
    --tag-specifications "ResourceType=elastic-ip,Tags=[{Key=Name,Value=devopsacademy-eip}]"

{
    "PublicIp": "3.104.46.253",
    "AllocationId": "eipalloc-03137b8b0e2a821f2",
    "PublicIpv4Pool": "amazon",
    "NetworkBorderGroup": "ap-southeast-2",
    "Domain": "vpc"
}

#Creating ngw with tag name
aws ec2 create-nat-gateway \
    --subnet-id subnet-0518abea8303fc4cb \
    --allocation-id eipalloc-03137b8b0e2a821f2 \
    --tag-specifications "ResourceType=natgateway,Tags=[{Key=Name,Value=devopsacademy-ngw}]"

{
    "ClientToken": "30f21774-b0bb-40c0-9fe3-546dfb4ee4a8",
    "NatGateway": {
        "CreateTime": "2022-02-21T13:17:47+00:00",
        "NatGatewayAddresses": [
            {
                "AllocationId": "eipalloc-03137b8b0e2a821f2"
            }
        ],
        "NatGatewayId": "nat-0afeb25e252dfc517",
        "State": "pending",
        "SubnetId": "subnet-0518abea8303fc4cb",
        "VpcId": "vpc-09b37d389cf1e7937",
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