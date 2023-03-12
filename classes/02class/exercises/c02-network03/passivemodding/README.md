# c02-network03

## Commands Execution Output



- Commands for creating a new VPC:

# Create new VPC
- CIDR block `/16`
- Name: devopsacademy-vpc
- No IPv6
- Tenancy default

```sh
aws ec2 create-vpc \
    --cidr-block 10.0.0.0/16 \
    --no-amazon-provided-ipv6-cidr-block \
    --instance-tenancy default
```
```json
{
    "Vpc": {
        "CidrBlock": "10.0.0.0/16",
        "DhcpOptionsId": "dopt-15a88b6d",
        "State": "pending",
        "VpcId": "vpc-0ddeb1682eb1c6edf",
        "OwnerId": "152848913167",
        "InstanceTenancy": "default",
        "Ipv6CidrBlockAssociationSet": [],
        "CidrBlockAssociationSet": [
            {
                "AssociationId": "vpc-cidr-assoc-0364312a515dae473",
                "CidrBlock": "10.0.0.0/16",
                "CidrBlockState": {
                    "State": "associated"
                }
            }
        ],
        "IsDefault": false
    }
}
```

# Assign name tag to the VPC
```sh
aws ec2 create-tags --resources vpc-0ddeb1682eb1c6edf --tags Key=Name,Value=devopsacademy-vpc
```

# Check Configuration using describe-vpcs
```sh
aws ec2 describe-vpcs --vpc-ids vpc-0ddeb1682eb1c6edf
```
```json
{
    "Vpcs": [
        {
            "CidrBlock": "10.0.0.0/16",
            "DhcpOptionsId": "dopt-15a88b6d",
            "State": "available",
            "VpcId": "vpc-0ddeb1682eb1c6edf",
            "OwnerId": "152848913167",
            "InstanceTenancy": "default",
            "CidrBlockAssociationSet": [
                {
                    "AssociationId": "vpc-cidr-assoc-0364312a515dae473",
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

Our sandbox account is already at the max vpc limit for ap-southeast-2

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)