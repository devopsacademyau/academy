# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
```
Add your commands and their outputs here
```

sam.daymond@contino.io@Sams-MacBook-Pro myacademy % aws ec2 allocate-address --domain vpc          
{
    "PublicIp": "52.62.255.63",
    "AllocationId": "eipalloc-062c99ed4e6a461ac",
    "PublicIpv4Pool": "amazon",
    "NetworkBorderGroup": "ap-southeast-2",
    "Domain": "vpc"
}

sam.daymond@contino.io@Sams-MacBook-Pro myacademy % aws ec2 create-nat-gateway --allocation-id eipalloc-062c99ed4e6a461ac --subnet-id subnet-03137b09e2b59edb3
{
    "ClientToken": "3563b022-8ffb-4bb6-89f1-593d61e4901e",
    "NatGateway": {
        "CreateTime": "2022-08-25T05:02:31+00:00",
        "NatGatewayAddresses": [
            {
                "AllocationId": "eipalloc-062c99ed4e6a461ac"
            }
        ],
        "NatGatewayId": "nat-018d91ba3011234ee",
        "State": "pending",
        "SubnetId": "subnet-03137b09e2b59edb3",
        "VpcId": "vpc-082db14641294a216",
        "ConnectivityType": "public"
    }
}

aws ec2 create-tags --resources nat-018d91ba3011234ee --tags Key=Name,Value=DevopsAcademy-ngw

sam.daymond@contino.io@Sams-MacBook-Pro myacademy % aws ec2 delete-nat-gateway --nat-gateway-id nat-018d91ba3011234ee
{
    "NatGatewayId": "nat-018d91ba3011234ee"
}
- Any extra challenges faced?
I accidently was referring to the nat gateway creation document for cli v1 for a couple of minutes until I realised it wasn't working as expected, important to check the documentation is current

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)