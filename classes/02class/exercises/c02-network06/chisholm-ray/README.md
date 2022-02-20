# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
```
tags=(--tag-specifications                  
'ResourceType=elastic-ip,Tags=[            
{Key=Name,Value=ccr-dojo-eip}     
]') && \
aws ec2 allocate-address \
"${tags[@]}" 

{
    "PublicIp": "54.253.76.215",
    "AllocationId": "eipalloc-0da2222f8fb333ffc",
    "PublicIpv4Pool": "amazon",
    "NetworkBorderGroup": "ap-southeast-2",
    "Domain": "vpc"
}
{
    "PublicIp": "54.253.76.215",
    "AllocationId": "eipalloc-0da2222f8fb333ffc",
    "PublicIpv4Pool": "amazon",
    "NetworkBorderGroup": "ap-southeast-2",
    "Domain": "vpc"
}
```

```
tags=(--tag-specifications                  
'ResourceType=natgateway,Tags=[            
{Key=Name,Value=ccr-dojo-natgw-a}     
]') && \
aws ec2 create-nat-gateway \
--connectivity-type public \
--subnet-id subnet-0b2f8b5bb39b96759 \
--allocation-id eipalloc-0da2222f8fb333ffc \
"${tags[@]}" 

{
    "ClientToken": "f11aeb72-2e6a-4b96-a391-585ff83c872a",
    "NatGateway": {
        "CreateTime": "2022-02-20T03:18:22+00:00",
        "NatGatewayAddresses": [
            {
                "AllocationId": "eipalloc-0da2222f8fb333ffc"
            }
        ],
        "NatGatewayId": "nat-09c3b70275101b301",
        "State": "pending",
        "SubnetId": "subnet-0b2f8b5bb39b96759",
        "VpcId": "vpc-091f1866ec064400e",
        "Tags": [
            {
                "Key": "Name",
                "Value": "ccr-dojo-natgw-a"
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