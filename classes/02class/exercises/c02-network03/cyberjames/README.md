# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:
```
✗ aws ec2 create-vpc \
--cidr-block 10.88.0.0/16 \
--tag-specification 'ResourceType=vpc,Tags=[{Key=Name,Value=devopsacademy-vpc}]' \
--no-amazon-provided-ipv6-cidr-block --region us-east-1

{
    "Vpc": {
        "CidrBlock": "10.88.0.0/16",
        "DhcpOptionsId": "dopt-15a88b6d",
        "State": "pending",
        "VpcId": "vpc-0d8edf6a0d1104524",
        "OwnerId": "152848913167",
        "InstanceTenancy": "default",
        "Ipv6CidrBlockAssociationSet": [],
        "CidrBlockAssociationSet": [
            {
                "AssociationId": "vpc-cidr-assoc-0a37911929270aa63",
                "CidrBlock": "10.88.0.0/16",
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
I was getting an error message below when executing the aws cli for creating VPC at the ap-southeast-2 region.

```
An error occurred (VpcLimitExceeded) when calling the CreateVpc operation: The maximum number of VPCs has been reached.
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)