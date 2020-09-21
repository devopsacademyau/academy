# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:

```
# create vpc
$aws ec2 create-vpc --cidr-block 10.0.0.0/16 --no-amazon-provided-ipv6-cidr-block 
{
    "Vpc": {
        "CidrBlock": "10.0.0.0/16",
        "DhcpOptionsId": "dopt-5e83a939",
        "State": "pending",
        "VpcId": "vpc-024a0b611dbedcd58",
        "OwnerId": "059642851259",
        "InstanceTenancy": "default",
        "Ipv6CidrBlockAssociationSet": [],
        "CidrBlockAssociationSet": [
            {
                "AssociationId": "vpc-cidr-assoc-082bad816a71c10ea",
                "CidrBlock": "10.0.0.0/16",
                "CidrBlockState": {
                    "State": "associated"
                }
            }
        ],
        "IsDefault": false
    }
}

#create a tag just for assign a name to vpc
$aws ec2 create-tags --tags Key=Name,Value=devopsacademy-vpc --resources vpc-024a0b611dbedcd58

#list vpcs (both the recently created one and the default one)
$aws ec2 describe-vpcs
{
    "Vpcs": [
        {
            "CidrBlock": "10.0.0.0/16",
            "DhcpOptionsId": "dopt-5e83a939",
            "State": "available",
            "VpcId": "vpc-024a0b611dbedcd58",
            "OwnerId": "059642851259",
            "InstanceTenancy": "default",
            "CidrBlockAssociationSet": [
                {
                    "AssociationId": "vpc-cidr-assoc-082bad816a71c10ea",
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
        },
        {
            "CidrBlock": "172.31.0.0/16",
            "DhcpOptionsId": "dopt-5e83a939",
            "State": "available",
            "VpcId": "vpc-c6aba3a1",
            "OwnerId": "059642851259",
            "InstanceTenancy": "default",
            "CidrBlockAssociationSet": [
                {
                    "AssociationId": "vpc-cidr-assoc-6566930e",
                    "CidrBlock": "172.31.0.0/16",
                    "CidrBlockState": {
                        "State": "associated"
                    }
                }
            ],
            "IsDefault": true
        }
    ]
}
```

- Any extra challenges faced?

As there is no parameter to name a VPC from its creation, I had to create a tag and so assign a name to the recently VPC created.

***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)