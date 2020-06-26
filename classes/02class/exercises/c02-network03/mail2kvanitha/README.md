# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:

>  aws ec2 create-vpc --cidr-block 10.10.0.0/16 --no-amazon-provided-ipv6-cidr-block

     {
         "Vpc": {
             "CidrBlock": "10.10.0.0/16",
             "DhcpOptionsId": "dopt-9d2a63fa",
             "State": "pending",
             "VpcId": "vpc-0d4cd22a6e87c698a",
             "OwnerId": "823151257518",
             "InstanceTenancy": "default",
             "Ipv6CidrBlockAssociationSet": [],
             "CidrBlockAssociationSet": [
                 {
                     "AssociationId": "vpc-cidr-assoc-0d2825d065b51eea3",
                     "CidrBlock": "10.10.0.0/16",
                     "CidrBlockState": {
                         "State": "associated"
                     }
                 }
             ],
             "IsDefault": false
         }
     }

> aws ec2 create-tags --resources vpc-0d4cd22a6e87c698a --tags Key=Name,Value=devopsacademy-vpc

> aws ec2 describe-vpcs --vpc-ids vpc-0d4cd22a6e87c698a
     
     {
         "Vpcs": [
             {
                 "CidrBlock": "10.10.0.0/16",
                 "DhcpOptionsId": "dopt-9d2a63fa",
                 "State": "available",
                 "VpcId": "vpc-0d4cd22a6e87c698a",
                 "OwnerId": "823151257518",
                 "InstanceTenancy": "default",
                 "CidrBlockAssociationSet": [
                     {
                         "AssociationId": "vpc-cidr-assoc-0d2825d065b51eea3",
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
         ]
     }


- Any extra challenges faced?

  No Challenges yet, and hope i covered the vpc creation correctly.


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)
