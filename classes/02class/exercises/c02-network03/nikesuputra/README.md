# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:
```
$ aws ec2 create-vpc \
> --cidr-block 10.0.0.0/16 \
> --no-amazon-provided-ipv6-cidr-block \
> --instance-tenancy default \
> --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=devopsacademy-vpc}]'
{
    "Vpc": {
        "CidrBlock": "10.0.0.0/16",
        "DhcpOptionsId": "dopt-03e193d0d72486e72",
        "State": "pending",
        "VpcId": "vpc-0d4d5380eac332f8b",
        "OwnerId": "192643247659",
        "InstanceTenancy": "default",
        "Ipv6CidrBlockAssociationSet": [],
        "CidrBlockAssociationSet": [
            {
                "AssociationId": "vpc-cidr-assoc-0fa856235edb702fb",
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
} 
```

- Any extra challenges faced?  
None

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)
