# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
```
>>>Command to check current region[Sydney [ap-southeast2]]
aws configure get region

>>>Command to allocate an elastic IP to the gateway
aws ec2 allocate-address \
    --domain vpc 
>The command returns: 
{
    "PublicIp": "3.24.252.148",
    "AllocationId": "eipalloc-0ef59de18bb08a3b8",
    "PublicIpv4Pool": "amazon",
    "NetworkBorderGroup": "ap-southeast-2",
    "Domain": "vpc"
}  

>>>Command to create a NAT gateway with the elastic IP allocation ID 
aws ec2 create-nat-gateway \
 --subnet-id subnet-062c79f06460c35c1 \
 --allocation-id eipalloc-0ef59de18bb08a3b8
>The command returns:
{
    "ClientToken": "047ab584-1a52-4465-b016-03d375c6d0ab",
    "NatGateway": {
        "CreateTime": "2020-06-30T23:51:23+00:00",
        "NatGatewayAddresses": [
            {
                "AllocationId": "eipalloc-0ef59de18bb08a3b8"
            }
        ],
        "NatGatewayId": "nat-07e041dcaef2485c0",
        "State": "pending",
        "SubnetId": "subnet-062c79f06460c35c1",
        "VpcId": "vpc-081afcee350babdf5"
    }
}

>>>Command to give a name to the NAT gateway
aws ec2 create-tags \
 --resources nat-07e041dcaef2485c0 \
 --tags Key=Name,Value=devopsacademy-ngw

>>>Command to describe created NAT gateway
aws ec2 describe-nat-gateways
>The command returns:
{
    "NatGateways": [
        {
            "CreateTime": "2020-06-30T23:51:23+00:00",
            "NatGatewayAddresses": [
                {
                    "AllocationId": "eipalloc-0ef59de18bb08a3b8",
                    "NetworkInterfaceId": "eni-019b31b0eeb2ef476",
                    "PrivateIp": "172.16.3.147",
                    "PublicIp": "3.24.252.148"
                }
            ],
            "NatGatewayId": "nat-07e041dcaef2485c0",
            "State": "available",
            "SubnetId": "subnet-062c79f06460c35c1",
            "VpcId": "vpc-081afcee350babdf5",
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "devopsacademy-ngw"
                }
            ]
        }
    ]
}

```

- Any extra challenges faced?
Figuring out the command to allocate an elastic IP to the NAT Gateway.


***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)
