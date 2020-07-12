# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:
```
Create VPC with default tenancy and no IPV6
> aws ec2  create-vpc  --instance-tenancy default --cidr-block 10.0.0.0/16 --no-amazon-provided-ipv6-cidr-block 

{
    "Vpc": {
        "CidrBlock": "10.0.0.0/16",
        "DhcpOptionsId": "dopt-f585d092",
        "State": "pending",
        "VpcId": "vpc-076a05ec0f3be4895",
        "OwnerId": "361529347535",
        "InstanceTenancy": "default",
        "Ipv6CidrBlockAssociationSet": [],
        "CidrBlockAssociationSet": [
            {
                "AssociationId": "vpc-cidr-assoc-03cddb8e65665da1e",
                "CidrBlock": "10.0.0.0/16",
                "CidrBlockState": {
                    "State": "associated"
                }
            }
        ],
        "IsDefault": false
    }
}

AWS create tags as devopsacademy
> aws ec2 create-tags --resources vpc-076a05ec0f3be4895 --tags Key=Name,Value=devopsacademy-vpc

Verify using describe vpcs command to check if tags are created properly
> aws ec2 describe-vpcs --vpc-ids vpc-076a05ec0f3be4895

{
    "Vpcs": [
        {
            "CidrBlock": "10.0.0.0/16",
            "DhcpOptionsId": "dopt-f585d092",
            "State": "available",
            "VpcId": "vpc-076a05ec0f3be4895",
            "OwnerId": "361529347535",
            "InstanceTenancy": "default",
            "CidrBlockAssociationSet": [
                {
                    "AssociationId": "vpc-cidr-assoc-03cddb8e65665da1e",
                    "CidrBlock": "10.0.0.0/16",
                    "CidrBlockState": {
                        "State": "associated"
                    }
                }
            ],
            "IsDefault": false,
            "Tags": [
                {
                    "Key": "devopsacademy",
                    "Value": "devopsacademy-vpc"
                },
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
I was  unable to create VPC with a name then I found out we dont have an option to pass name when creating VPC . Aws will automatically create vpc id .We can only give the name to VPC using the tag option.
I was trying to --tag-specifications command with VPC creation but due to AWS cli issue I was not able to run that.Then I created VPC first and then created the tag later
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)