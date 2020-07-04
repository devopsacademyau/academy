# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:
```
aws ec2 create-vpc --cidr-block 10.0.0.0/16

{
    "Vpc": {
        "CidrBlock": "10.0.0.0/16",
        "DhcpOptionsId": "dopt-ab5f74cc",
        "State": "pending",
        "VpcId": "vpc-04426efcf5b2228a4",
        "OwnerId": "490308117505",
        "InstanceTenancy": "default",
        "Ipv6CidrBlockAssociationSet": [],
        "CidrBlockAssociationSet": [
            {
                "AssociationId": "vpc-cidr-assoc-07a90fef9e6d033da",
                "CidrBlock": "10.0.0.0/16",
                "CidrBlockState": {
                    "State": "associated"
                }
            }
        ],
        "IsDefault": false
    }
}


aws ec2 create-tags --resources vpc-04426efcf5b2228a4 --tags Key=Name,Value=devopsacademy-vpc
aws ec2 describe-vpcs --vpc-ids vpc-04426efcf5b2228a4

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

Adding a tag while creating a VPC is not supported yet by CLI. So we need to create a VPC and then set the name.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)