# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
```
Allocate  Elastic Ip address

> aws ec2 allocate-address
{
    "PublicIp": "13.236.30.80",
    "AllocationId": "eipalloc-0806e1b4a4b1c5143",
    "PublicIpv4Pool": "amazon",
    "NetworkBorderGroup": "ap-southeast-2",
    "Domain": "vpc"
}

Create a natgateway and assoicate with Elastic ip and public subnet

> aws ec2 create-nat-gateway --allocation-id eipalloc-0806e1b4a4b1c5143 --subnet-id subnet-0ff0ad4440d0df64e
{
    "ClientToken": "1a204877-589e-44da-ba7b-6c208f54ec7b",
    "NatGateway": {
        "CreateTime": "2020-07-05T09:38:00+00:00",
        "NatGatewayAddresses": [
            {
                "AllocationId": "eipalloc-0806e1b4a4b1c5143"
            }
        ],
        "NatGatewayId": "nat-01d6374c190b9261d",
        "State": "pending",
        "SubnetId": "subnet-0ff0ad4440d0df64e",
        "VpcId": "vpc-076a05ec0f3be4895"
    }
}


Create a tag and associate devopsacademy-ngw
>aws ec2 create-tags --resources nat-01d6374c190b9261d --tags Key=Name,Value=devopsacademy-ngw

Verify nat gateway is created and properly tagged
> aws ec2 describe-nat-gateways --nat-gateway-id nat-01d6374c190b9261d

{
    "NatGateways": [
        {
            "CreateTime": "2020-07-05T09:38:00+00:00",
            "NatGatewayAddresses": [
                {
                    "AllocationId": "eipalloc-0806e1b4a4b1c5143",
                    "NetworkInterfaceId": "eni-0b9c5d0217958ad2c",
                    "PrivateIp": "10.0.101.244",
                    "PublicIp": "13.236.30.80"
                }
            ],
            "NatGatewayId": "nat-01d6374c190b9261d",
            "State": "available",
            "SubnetId": "subnet-0ff0ad4440d0df64e",
            "VpcId": "vpc-076a05ec0f3be4895",
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "devopsacademy-ngw"
                }
            ]
        }
    ]
}

Delete NatGawy to avoid any charges
> aws ec2 delete-nat-gateway --nat-gateway-id nat-01d6374c190b9261d

{
    "NatGatewayId": "nat-01d6374c190b9261d"
}

Release Address
> aws ec2 release-address --allocation-id  eipalloc-0806e1b4a4b1c5143

```


- Any extra challenges faced?
```
Finding out the command to create Elastic IP allocation as this was   required for associating  NAT gateway to subnet
```
<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)