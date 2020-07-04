# c02-network05

## Commands Execution Output

- Commands for creating the internet gateway:
```
aws ec2 create-internet-gateway
{
    "InternetGateway": {
        "Attachments": [],
        "InternetGatewayId": "igw-05a432e0e12592247",
        "OwnerId": "490308117505",
        "Tags": []
    }
}

aws ec2 create-tags --resources igw-05a432e0e12592247 --tags Key=Name,Value=devopsacademy-igw

aws ec2 attach-internet-gateway --internet-gateway-id igw-05a432e0e12592247 --vpc-id vpc-04426efcf5b2228a4

aws ec2 describe-internet-gateways --filters "Name=attachment.vpc-id,Values=vpc-04426efcf5b2228a4"
{
    "InternetGateways": [
        {
            "Attachments": [
                {
                    "State": "available",
                    "VpcId": "vpc-04426efcf5b2228a4"
                }
            ],
            "InternetGatewayId": "igw-05a432e0e12592247",
            "OwnerId": "490308117505",
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "devopsacademy-igw"
                }
            ]
        }
    ]
}

aws ec2 describe-vpcs --filters "Name=vpc-id,Values=vpc-04426efcf5b2228a4"
{
    "Vpcs": [
        {
            "CidrBlock": "10.0.0.0/16",
            "DhcpOptionsId": "dopt-ab5f74cc",
            "State": "available",
            "VpcId": "vpc-04426efcf5b2228a4",
            "OwnerId": "490308117505",
            "InstanceTenancy": "default",
            "CidrBlockAssociationSet": [
                {
                    "AssociationId": "vpc-cidr-assoc-07a90fef9e6d033da",
                    "CidrBlock": "10.0.0.0/16",
                    "CidrBlockState": {
                        "State": "associated"
                    }
                }
            ],
            "IsDefault": false,
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "devopsacademy-vpc"
                }
            ]
        }
    ]
}

```

- Any extra challenges faced?

No
<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network05](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network05/README.md)