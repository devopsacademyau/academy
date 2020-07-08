# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:
```CLI
$VPC_ID=$(aws ec2 create-vpc \
    --cidr-block 10.128.0.0/16 \
    --no-amazon-provided-ipv6-cidr-block \
    --instance-tenancy default \
    --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=da-c02-vpc}]' \
    --query Vpc.VpcId \
    --output text)

$aws ec2 create-tags --resources $VPC_ID --tags Key=Env,Value=test

$aws ec2 describe-vpcs --vpc-ids $VPC_ID

--output:
{
    "Vpcs": [
        {
            "CidrBlock": "10.128.0.0/16",
            "DhcpOptionsId": "dopt-5b144a3c",
            "State": "available",
            "VpcId": "vpc-08a33ecff54c2607a",
            "OwnerId": "421117346104",
            "InstanceTenancy": "default",
            "CidrBlockAssociationSet": [
                {
                    "AssociationId": "vpc-cidr-assoc-0df916ef99535169f",
                    "CidrBlock": "10.128.0.0/16",
                    "CidrBlockState": {
                        "State": "associated"
                    }
                }
            ],
            "IsDefault": false,
            "Tags": [
                {
                    "Key": "Env",
                    "Value": "test"
                },
                {
                    "Key": "Name",
                    "Value": "da-c02-vpc"
                }
            ]
        }
    ]
}

--clean when needless
$aws ec2 delete-vpc --vpc-id $VPC_ID

```

- Any extra challenges faced?  
Thanks to Roperto's sugestion, after upgrating my CLI and then I can successfully use --tag-specifications ResourceType=vpc,Tags=[{Key=Name,Value=da-c02-vpc}] to add tags.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)
