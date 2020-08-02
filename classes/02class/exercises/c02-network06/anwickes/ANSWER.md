## NAT Gateway (NGW) (optional)

Be aware that NAT Gateway is out of the free-tier. If you just use it while you are doing your exercises and MAKE SURE TO DELETE afterwards it should incurr less than 1$ cost. We highly recommend you testing this step but we understand if you decide not to.

Create a NAT Gateway called `devopsacademy-ngw` and attach it to one of your public subnets (any) with an Elastic IP. 

#### DO NOT FORGET TO DELETE YOUR RESOURCES ONCE YOU FINISH

# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
```
aws ec2 allocate-address --domain vpc
{
    "PublicIp": "13.236.21.32",
    "AllocationId": "eipalloc-02279b9180ef83de2",
    "PublicIpv4Pool": "amazon",
    "NetworkBorderGroup": "ap-southeast-2",
    "Domain": "vpc"
}

aws ec2 create-nat-gateway --allocation-id eipalloc-02279b9180ef83de2 --subnet-id subnet-00906c319bbfb11e2 --tag-specifications --tag-specifications "ResourceType=natgateway,Tags=[{Key=Name,Value=devopsacademy-ngw}]"
{
    "ClientToken": "2cb306b7-e1e1-4472-82fb-cc6c442fd0fa",
    "NatGateway": {
        "CreateTime": "2020-07-19T10:07:05+00:00",
        "NatGatewayAddresses": [
            {
                "AllocationId": "eipalloc-02279b9180ef83de2"
            }
        ],
        "NatGatewayId": "nat-004fe1f3d587ecc6d",
        "State": "pending",
        "SubnetId": "subnet-00906c319bbfb11e2",
        "VpcId": "vpc-064f8156856e7ef9e",
        "Tags": [
            {
                "Key": "Name",
                "Value": "devopsacademy-ngw"
            }
        ]
    }
}
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)