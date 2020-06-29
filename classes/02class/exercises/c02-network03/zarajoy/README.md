# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:


192.168.0.0 – 192.168.255.255	65536ips	192.168.0.0/16 (255.255.0.0) class C network

Create VPC
```
z@bacon:~$ aws ec2 create-vpc --cidr-block 192.168.0.0/16
{
    "Vpc": {
        "CidrBlock": "192.168.0.0/16",
        "DhcpOptionsId": "dopt-344d6653",
        "State": "pending",
        "VpcId": "vpc-09d2f2719d50d1f7f",
        "OwnerId": "512742231244",
        "InstanceTenancy": "default",
        "Ipv6CidrBlockAssociationSet": [],
        "CidrBlockAssociationSet": [
            {
                "AssociationId": "vpc-cidr-assoc-0e1e0767427bd1b98",
                "CidrBlock": "192.168.0.0/16",
                "CidrBlockState": {
                    "State": "associated"
                }
            }
        ],
        "IsDefault": false
    }
}
```
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html

You cannot add tags to VPC upon creation though VPC supports tags being added after creation. (Link above has nice table showing what can have taags created upon creation)
```
z@bacon:~$ aws ec2 create-tags --resources vpc-09d2f2719d50d1f7f --tags Key=Name, Value=devopsacademy-vpc

Error parsing parameter '--tags': Expected: '<second>', received: '<none>' for input:
Key=Name,
         ^
z@bacon:~$ aws ec2 create-tags --tags  Key=Name,Value=devopsacademy-vpc --resources vpc-09d2f2719d50d1f7f
```
Show the finished VPC details
```
z@bacon:~$ aws ec2 describe-vpcs --vpc-ids vpc-09d2f2719d50d1f7f
{
    "Vpcs": [
        {
            "CidrBlock": "192.168.0.0/16",
            "DhcpOptionsId": "dopt-344d6653",
            "State": "available",
            "VpcId": "vpc-09d2f2719d50d1f7f",
            "OwnerId": "512742231244",
            "InstanceTenancy": "default",
            "CidrBlockAssociationSet": [
                {
                    "AssociationId": "vpc-cidr-assoc-0e1e0767427bd1b98",
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

took a bit of googleing to realise creating tags does not like space inbetween Key Value and Value Value.
 
Key=Greeting,Value=Hello is accepted

Key=Greeting, Value=Hello will not be accepted.
<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)