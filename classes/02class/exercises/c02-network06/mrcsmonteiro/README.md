# c02-network06

## Commands Execution Output

- Commands for creating the NAT gateway:
```
$ aws ec2 allocate-address \
    --domain vpc

{
    "PublicIp": "3.105.167.246",
    "AllocationId": "eipalloc-064d879b3be84c839",
    "PublicIpv4Pool": "amazon",
    "NetworkBorderGroup": "ap-southeast-2",
    "Domain": "vpc"
}

$ aws ec2 create-nat-gateway \
    --subnet-id subnet-012cc488da2a78bcd \
    --allocation-id eipalloc-064d879b3be84c839

{
    "ClientToken": "5e9e8997-7b91-4ab9-b2cc-3d3648cb23e9",
    "NatGateway": {
        "CreateTime": "2020-06-25T16:40:30+00:00",
        "NatGatewayAddresses": [
            {
                "AllocationId": "eipalloc-064d879b3be84c839"
            }
        ],
        "NatGatewayId": "nat-01dfd6d7bc743054d",
        "State": "pending",
        "SubnetId": "subnet-012cc488da2a78bcd",
        "VpcId": "vpc-0721e28436cea8410"
    }
}

$ aws ec2 create-tags \
    --resources nat-01dfd6d7bc743054d --tags Key=Name,Value=devopsacademy-ngw
```

- Any extra challenges faced?
Yes, although it seems that NAT Gateway supports Tag-on-Create, I haven't figured out the right parameters to be used, so I created the tag in a separate command.

Shorthand '--tag-specifications' didn't work for me, with the following syntax:

aws ec2 create-nat-gateway \
    --subnet-id subnet-012cc488da2a78bcd \
    --allocation-id eipalloc-064d879b3be84c839 \
    --tag-specifications ResourceType=natgateway,Tags=[{Key=Name,Value=devopsacademy-ngw}]

UPDATE: Tag-on-create works using single quotes:

aws ec2 create-nat-gateway \
    --subnet-id subnet-012cc488da2a78bcd \
    --allocation-id eipalloc-0415c38ba25aa7fee \
    --tag-specifications 'ResourceType=natgateway,Tags=[{Key=Name,Value=devopsacademy-ngw}]'

{
    "ClientToken": "fb9a682c-dbbd-4527-a720-584b18e0807d",
    "NatGateway": {
        "CreateTime": "2020-06-26T17:51:16+00:00",
        "NatGatewayAddresses": [
            {
                "AllocationId": "eipalloc-0415c38ba25aa7fee"
            }
        ],
        "NatGatewayId": "nat-066f1e749b6091775",
        "State": "pending",
        "SubnetId": "subnet-012cc488da2a78bcd",
        "VpcId": "vpc-0721e28436cea8410",
        "Tags": [
            {
                "Key": "Name",
                "Value": "devopsacademy-ngw"
            }
        ]
    }
}

Thanks Kiko!

***
Answer for exercise [c02-network06](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network06/README.md)
