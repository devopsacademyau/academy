# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:
```
>>>Command to set default region[if not already set; check in ~/.aws/config file]
aws configure set default.region ap-southeast-2

>>>Command to create a vpc with parameters cidr block, no ipv6 and default tenancy.
aws ec2 create-vpc \
 --cidr-block 172.16.0.0/16 \
 --no-amazon-provided-ipv6-cidr-block \
 --instance-tenancy default 

>The command returns:
{
    "Vpc": {
        "CidrBlock": "172.16.0.0/16",
        "DhcpOptionsId": "dopt-905900f7",
        "State": "pending",
        "VpcId": "vpc-081afcee350babdf5",
        "OwnerId": "438549961569",
        "InstanceTenancy": "default",
        "Ipv6CidrBlockAssociationSet": [],
        "CidrBlockAssociationSet": [
            {
                "AssociationId": "vpc-cidr-assoc-0b738c5300c02590d",
                "CidrBlock": "172.16.0.0/16",
                "CidrBlockState": {
                    "State": "associated"
                }
            }
        ],
        "IsDefault": false
    }
}

>>>Command to give a name to vpc as adding tags while creating a vpc is not supported.
aws ec2 create-tags \
 --resources vpc-081afcee350babdf5 \
 --tags Key=Name,Value=devopsacademy-vpc


>>>Command to describe the vpc you created
aws ec2 describe-vpcs \
 --vpc-ids vpc-081afcee350babdf5
>The command returns:
{
    "Vpcs": [
        {
            "CidrBlock": "172.16.0.0/16",
            "DhcpOptionsId": "dopt-905900f7",
            "State": "available",
            "VpcId": "vpc-081afcee350babdf5",
            "OwnerId": "438549961569",
            "InstanceTenancy": "default",
            "CidrBlockAssociationSet": [
                {
                    "AssociationId": "vpc-cidr-assoc-0b738c5300c02590d",
                    "CidrBlock": "172.16.0.0/16",
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
>>>As VPC aws created, a route table, default local routes and network acls are automatically deployed. It can be checked through describe command
Example:aws ec2 describe-route-tables
```

- Any extra challenges faced?
>>>Figuring out how to assign a name to the vpc and finding the create tag command for the same.


***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)
