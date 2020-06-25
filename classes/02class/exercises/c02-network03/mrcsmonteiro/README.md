# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:
```
$ aws ec2 create-vpc \
    --cidr-block 10.11.0.0/16

{
    "Vpc": {
        "CidrBlock": "10.11.0.0/16",
        "DhcpOptionsId": "dopt-2267ed46",
        "State": "pending",
        "VpcId": "vpc-0721e28436cea8410",
        "OwnerId": "149613515908",
        "InstanceTenancy": "default",
        "Ipv6CidrBlockAssociationSet": [],
        "CidrBlockAssociationSet": [
            {
                "AssociationId": "vpc-cidr-assoc-082f62662659ce1e8",
                "CidrBlock": "10.11.0.0/16",
                "CidrBlockState": {
                    "State": "associated"
                }
            }
        ],
        "IsDefault": false
    }
}

$ aws ec2 create-tags \
    --resources vpc-0721e28436cea8410 --tags Key=Name,Value=devopsacademy-vpc

$ aws ec2 describe-vpcs --filters Name=vpc-id,Values=vpc-0721e28436cea8410

{
    "Vpcs": [
        {
            "CidrBlock": "10.11.0.0/16",
            "DhcpOptionsId": "dopt-2267ed46",
            "State": "available",
            "VpcId": "vpc-0721e28436cea8410",
            "OwnerId": "149613515908",
            "InstanceTenancy": "default",
            "CidrBlockAssociationSet": [
                {
                    "AssociationId": "vpc-cidr-assoc-082f62662659ce1e8",
                    "CidrBlock": "10.11.0.0/16",
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
I haven't found a way to create a VPC and add a tag to it in just one command via AWS CLI, so I had to create a tag separately.

***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)
