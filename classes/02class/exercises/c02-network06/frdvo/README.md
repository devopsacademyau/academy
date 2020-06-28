# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
````

$ aws ec2 allocate-address

{
    "PublicIp": "3.105.15.81",
    "AllocationId": "eipalloc-0438e982d1be851e3",
    "PublicIpv4Pool": "amazon",
    "NetworkBorderGroup": "ap-southeast-2",
    "Domain": "vpc"
}

$ aws ec2 create-nat-gateway --allocation-id eipalloc-0438e982d1be851e3 --subnet-id subnet-0dbb2205880974071

{
    "ClientToken": "64b706bf-17d2-416a-8ad3-3b0a8eddbb6b",
    "NatGateway": {
        "CreateTime": "2020-06-27T13:04:48.000Z",
        "NatGatewayAddresses": [
            {
                "AllocationId": "eipalloc-0438e982d1be851e3"
            }
        ],
        "NatGatewayId": "nat-02330e26283489e20",
        "State": "pending",
        "SubnetId": "subnet-0dbb2205880974071",
        "VpcId": "vpc-0a2b7db4956438d22"
    }
}

$ aws ec2 create-tags --resources nat-02330e26283489e20 --tags Key=Name,Value=devopsacademy-ngw

$ aws ec2 delete-nat-gateway --nat-gateway-id nat-02330e26283489e20

{
    "NatGatewayId": "nat-02330e26283489e20"
}

$ aws ec2  release-address --allocation-id eipalloc-0438e982d1be851e3

````

- Any extra challenges faced?

No, same thing, tag is an extra resource.


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)