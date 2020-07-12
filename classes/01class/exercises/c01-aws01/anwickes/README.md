## c01-aws01

- Use the CLI to create a new EC2 Instance inside the default VPC with a public IP address and connect to it though SSH.
- Create another EC2, also using the CLI instance in the same VPC but with private address only and connect to it.

# Use CLI to create a new EC2 instance (Public Address)

- Determine id of default VPC
> aws ec2 describe-vpcs --filters "Name=isDefault, Values=true"

```
{
    "Vpcs": [
        {
            "CidrBlock": "172.31.0.0/16",
            "DhcpOptionsId": "dopt-1972557e",
            "State": "available",
            "VpcId": "vpc-0015f19f38173b298",
            "OwnerId": "595178663294",
            "InstanceTenancy": "default",
            "CidrBlockAssociationSet": [
                {
                    "AssociationId": "vpc-cidr-assoc-0e16bf395f867cd1e",
                    "CidrBlock": "172.31.0.0/16",
                    "CidrBlockState": {
                        "State": "associated"
                    }
                }
            ],
            "IsDefault": true,
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "default_VPC"
                }
            ]
        }
    ]
}
```
