# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:
```
aws ec2 create-vpc \
    --cidr-block 10.10.0.0/16 \
    --no-amazon-provided-ipv6-cidr-block \
    --instance-tenancy default \
    --region ap-southeast-2 \
    --tag-specifications ResourceType=vpc,Tags='{Key=Name,Value="devopsacademy-vpc"}'

    {
    "Vpc": {
        "CidrBlock": "10.10.0.0/16",
        "DhcpOptionsId": "dopt-3f26dd58",
        "State": "pending",
        "VpcId": "vpc-09b37d389cf1e7937",
        "OwnerId": "152848913167",
        "InstanceTenancy": "default",
        "Ipv6CidrBlockAssociationSet": [],
        "CidrBlockAssociationSet": [
            {
                "AssociationId": "vpc-cidr-assoc-0948ff9345ef44991",
                "CidrBlock": "10.10.0.0/16",
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


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)