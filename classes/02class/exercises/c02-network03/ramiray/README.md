# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:
```
1.Creating VPC with  deafult tenancy, cidr block and no-ipv6: 

aws ec2 create-vpc --cidr-block 172.16.0.0/16 --no-amazon-provided-ipv6-cidr-block --instance-tenancy default
{
    "Vpc": {
        "VpcId": "vpc-0351acfbc7aed9c1f",
        "InstanceTenancy": "default",
        "CidrBlockAssociationSet": [
            {
                "AssociationId": "vpc-cidr-assoc-0ab167c08ad1170cb",
                "CidrBlock": "172.16.0.0/16",
                "CidrBlockState": {
                    "State": "associated"
                }
            }
        ],
        "Ipv6CidrBlockAssociationSet": [],
        "State": "pending",
        "DhcpOptionsId": "dopt-1ff7df78",
        "CidrBlock": "172.16.0.0/16",
        "IsDefault": false
    }
}

2. Creating tag value as devopsacademy for the vpc : 
 aws ec2 create-tags --tags Key=Name,Value=devopsacademy-vpc --resources vpc-0351acfbc7aed9c1f

3.Describing the newly created vpc: 
aws ec2 describe-vpcs --vpc-ids vpc-0351acfbc7aed9c1f
{
    "Vpcs": [
        {
            "VpcId": "vpc-0351acfbc7aed9c1f",
            "InstanceTenancy": "default",
            "Tags": [
                {
                    "Value": "devopsacademy-vpc",
                    "Key": "Name"
                }
            ],
            "CidrBlockAssociationSet": [
                {
                    "AssociationId": "vpc-cidr-assoc-0ab167c08ad1170cb",
                    "CidrBlock": "172.16.0.0/16",
                    "CidrBlockState": {
                        "State": "associated"
                    }
                }
            ],
            "State": "available",
            "DhcpOptionsId": "dopt-1ff7df78",
            "CidrBlock": "172.16.0.0/16",
            "IsDefault": false
        }
    ]
}
```

- Any extra challenges faced?

No Challenges faced.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)