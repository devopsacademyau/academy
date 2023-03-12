# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
```yaml
aws ec2 allocate-address

{
    "PublicIp": "3.105.189.10",
    "AllocationId": "eipalloc-09821a03590752390",
    "PublicIpv4Pool": "amazon",
    "NetworkBorderGroup": "ap-southeast-2",
    "Domain": "vpc"
}

aws ec2 create-nat-gateway --subnet-id subnet-08face2dbefdaa808 --allocation-id eipalloc-09821a03590752390

{
    "ClientToken": "218b08c9-5c39-4902-88a3-aeea858c3067",
    "NatGateway": {
        "CreateTime": "2022-08-22T03:03:13.000Z",
        "NatGatewayAddresses": [
            {
                "AllocationId": "eipalloc-09821a03590752390"
            }
        ],
        "NatGatewayId": "nat-0fb7961bd3c16eaaa",
        "State": "pending",
        "SubnetId": "subnet-08face2dbefdaa808",
        "VpcId": "vpc-09b37d389cf1e7937"
    }
}

aws ec2 create-tags --resources nat-0fb7961bd3c16eaaa --tags Key=Name,Value=devopsacademy-ngw
aws ec2 create-tags --resources eipalloc-09821a03590752390 --tags Key=Name,Value=devopsacademy-ngw
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)