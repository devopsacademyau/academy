# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:
```bash
#Create VPC without IPv6, with tenancy default
aws ec2 create-vpc --cidr-block 172.16.0.0/16 --no-amazon-provided-ipv6-cidr-block --instance-tenancy default
#Tag VPC with Name: devopsacademy-vpc
aws ec2 create-tags --tags Key=Name,Value=devopsacademy-vpc --resources vpc-0a2b7db4956438d22
#Check the VPC
aws ec2 describe-vpcs --vpc-id vpc-0a2b7db4956438d22
```

Add your commands and their outputs here
```bash
 🐳 :: 📦 2  📑 :: 1   👉 /home/fer/repos/academy/classes/02class/exercises/c02-network03  
  frdvo/c02-network03  fer 🐧  >  aws ec2 create-vpc --cidr-block 172.16.0.0/16 --no-amazon-provided-ipv6-cidr-block --instance-tenancy default
{
    "Vpc": {
        "CidrBlock": "172.16.0.0/16",
        "DhcpOptionsId": "dopt-fd1f919a",
        "State": "pending",
        "VpcId": "vpc-0a2b7db4956438d22",
        "OwnerId": "165765640813",
        "InstanceTenancy": "default",
        "Ipv6CidrBlockAssociationSet": [],
        "CidrBlockAssociationSet": [
            {
                "AssociationId": "vpc-cidr-assoc-02936f24cf8acc078",
                "CidrBlock": "172.16.0.0/16",
                "CidrBlockState": {
                    "State": "associated"
                }
            }
        ],
        "IsDefault": false
    }
}
 🐳 :: 📦 2  📑 :: 1   👉 /home/fer/repos/academy/classes/02class/exercises/c02-network03  
  frdvo/c02-network03  fer 🐧  >  aws ec2 create-tags --tags Key=Name,Value=devopsacademy-vpc --resources vpc-0a2b7db4956438d22
 🐳 :: 📦 2  📑 :: 1   👉 /home/fer/repos/academy/classes/02class/exercises/c02-network03  
  frdvo/c02-network03  fer 🐧  >  aws ec2 describe-vpcs --vpc-id vpc-0a2b7db4956438d22
{
    "Vpcs": [
        {
            "CidrBlock": "172.16.0.0/16",
            "DhcpOptionsId": "dopt-fd1f919a",
            "State": "available",
            "VpcId": "vpc-0a2b7db4956438d22",
            "OwnerId": "165765640813",
            "InstanceTenancy": "default",
            "CidrBlockAssociationSet": [
                {
                    "AssociationId": "vpc-cidr-assoc-02936f24cf8acc078",
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
 🐳 :: 📦 2  📑 :: 1   👉 /home/fer/repos/academy/classes/02class/exercises/c02-network03  
  frdvo/c02-network03  fer 🐧  >  
```

- Any extra challenges faced?
First challenge was to find how to name a VPC using AWS CLI. After I realized you need to use tags, I fouind there is no option to create and name the VPC in one go.


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)