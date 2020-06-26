# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:
```
> aws ec2 create-vpc \
    --cidr-block 192.168.0.0/16 \
    --no-amazon-provided-ipv6-cidr-block

    {
        "Vpc": {
            "CidrBlock": "192.168.0.0/16",
            "DhcpOptionsId": "dopt-3d63485a",
            "State": "pending",
            "VpcId": "vpc-007774900b7f4c596",
            "OwnerId": "907095435092",
            "InstanceTenancy": "default",
            "Ipv6CidrBlockAssociationSet": [],
            "CidrBlockAssociationSet": [
                {
                    "AssociationId": "vpc-cidr-assoc-0f9df6822051d04d6",
                    "CidrBlock": "192.168.0.0/16",
                    "CidrBlockState": {
                        "State": "associated"
                    }
                }
            ],
            "IsDefault": false
        }
    }

> aws ec2 create-tags \
    --resources vpc-007774900b7f4c596 \
    --tags Key=Name,Value=devopsacademy-vpc

> aws ec2 describe-vpcs \
    --vpc-ids vpc-007774900b7f4c596

    {
        "Vpcs": [
            {
                "CidrBlock": "192.168.0.0/16",
                "DhcpOptionsId": "dopt-3d63485a",
                "State": "available",
                "VpcId": "vpc-007774900b7f4c596",
                "OwnerId": "907095435092",
                "InstanceTenancy": "default",
                "CidrBlockAssociationSet": [
                    {
                        "AssociationId": "vpc-cidr-assoc-0f9df6822051d04d6",
                        "CidrBlock": "192.168.0.0/16",
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
```
AWS CLI does not allow to name a VPC during its creation.
It has to be done as a separate step using create-tags command.
Also Key=myKey, Value=myValue does not work as there is a space
after the comma. It has to be Key=myKey,Value=myValue.
```


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)