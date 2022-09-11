# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
```
$ aws ec2 allocate-address --region us-east-1
{
    "PublicIp": "18.210.25.118",
    "AllocationId": "eipalloc-0759ab46d28a8ef53",
    "PublicIpv4Pool": "amazon",
    "NetworkBorderGroup": "us-east-1",
    "Domain": "vpc"
}


$ aws ec2 create-nat-gateway \
--subnet-id subnet-005acc9c005fd6a97 \
--allocation-id eipalloc-0759ab46d28a8ef53 \
--tag-specifications 'ResourceType=natgateway,Tags=[{Key=Name,Value=devopsacademy-ngw}]' \
--region us-east-1

{
    "ClientToken": "19743156-db6e-4bde-989b-651816f80085",
    "NatGateway": {
        "CreateTime": "2022-08-24T11:17:44+00:00",
        "NatGatewayAddresses": [
            {
                "AllocationId": "eipalloc-0759ab46d28a8ef53"
            }
        ],
        "NatGatewayId": "nat-052aa76040091599e",
        "State": "pending",
        "SubnetId": "subnet-005acc9c005fd6a97",
        "VpcId": "vpc-0d8edf6a0d1104524",
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
VPC limit in the region `ap-southeast-2` has been reached so I have to use `us-east-1` region instead.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)
