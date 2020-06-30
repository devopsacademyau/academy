# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:


https://docs.aws.amazon.com/cli/latest/reference/ec2/allocate-address.html

https://docs.aws.amazon.com/cli/latest/reference/ec2/create-nat-gateway.html

https://docs.aws.amazon.com/cli/latest/reference/ec2/delete-nat-gateway.html



```
z@bacon:~$ aws ec2 allocate-address --domain vpc
{
    "PublicIp": "13.238.177.28",
    "AllocationId": "eipalloc-0137e5eb8fc7117a5",
    "PublicIpv4Pool": "amazon",
    "NetworkBorderGroup": "ap-southeast-2",
    "Domain": "vpc"
}

z@bacon:~$ aws ec2 create-nat-gateway --subnet-id subnet-00649d5b0632cc2be --allocation-id eipalloc-0137e5eb8fc7117a5
{
    "NatGateway": {
        "CreateTime": "2020-06-30T03:46:47.000Z",
        "NatGatewayAddresses": [
            {
                "AllocationId": "eipalloc-0137e5eb8fc7117a5"
            }
        ],
        "NatGatewayId": "nat-0fdb30eefbc51e8d3",
        "State": "pending",
        "SubnetId": "subnet-00649d5b0632cc2be",
        "VpcId": "vpc-09d2f2719d50d1f7f"
    }
}

z@bacon:~$ aws ec2 create-tags --resources nat-0fdb30eefbc51e8d3 --tags Key=Name,Value=DevopsAcademy-ngw
z@bacon:~$ aws ec2 describe-nat-gateways
{
    "NatGateways": [
        {
            "CreateTime": "2020-06-30T03:46:47.000Z",
            "NatGatewayAddresses": [
                {
                    "AllocationId": "eipalloc-0137e5eb8fc7117a5",
                    "NetworkInterfaceId": "eni-007148527076f8340",
                    "PrivateIp": "192.168.174.55",
                    "PublicIp": "13.238.177.28"
                }
            ],
            "NatGatewayId": "nat-0fdb30eefbc51e8d3",
            "State": "available",
            "SubnetId": "subnet-00649d5b0632cc2be",
            "VpcId": "vpc-09d2f2719d50d1f7f",
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "DevopsAcademy-ngw"
                }
            ]
        }
    ]
}
z@bacon:~$ aws ec2 delete-nat-gateway --nat-gateway-id nat-0fdb30eefbc51e8d3
{
    "NatGatewayId": "nat-0fdb30eefbc51e8d3"
}
z@bacon:~$ aws ec2 describe-nat-gateways
{
    "NatGateways": [
        {
            "CreateTime": "2020-06-30T03:46:47.000Z",
            "DeleteTime": "2020-06-30T03:54:16.000Z",
            "NatGatewayAddresses": [
                {
                    "AllocationId": "eipalloc-0137e5eb8fc7117a5",
                    "NetworkInterfaceId": "eni-007148527076f8340",
                    "PrivateIp": "192.168.174.55",
                    "PublicIp": "13.238.177.28"
                }
            ],
            "NatGatewayId": "nat-0fdb30eefbc51e8d3",
            "State": "deleting",
            "SubnetId": "subnet-00649d5b0632cc2be",
            "VpcId": "vpc-09d2f2719d50d1f7f",
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "DevopsAcademy-ngw"
                }
            ]
        }
    ]
}

```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)