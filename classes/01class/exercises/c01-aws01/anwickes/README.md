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

- Create keys

> aws ec2 create-key-pair --key-name anwickesPub --output text > anwickesPub.pem
> aws ec2 create-key-pair --key-name anwickesPri --output text > anwickesPri.pem

- Create public security group

> aws ec2 create-security-group --group-name myPublicSG --description "Security Group to provide access to public IP of EC2" --vpc-id "vpc-0015f19f38173b298" 
> aws ec2 describe-security-groups

```
{
    "SecurityGroups": [
        {
            "Description": "Security Group to provide access to public IP of EC2",
            "GroupName": "myPublicSG",
            "IpPermissions": [],
            "OwnerId": "595178663294",
            "GroupId": "sg-0cdc71b508bad29af",
            "IpPermissionsEgress": [
                {
                    "IpProtocol": "-1",
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    "Ipv6Ranges": [],
                    "UserIdGroupPairs": []
                }
            ],
            "VpcId": "vpc-0015f19f38173b298"
        }
    ]
}
```

- Create public ingress for my IP Address (121.200.12.94)

> aws ec2 authorize-security-group-ingress --group-id sg-0cdc71b508bad29af --protocol tcp --port 22 --cidr 121.200.12.94/24

- Create EC2 instance (ami-0a58e22c727337c51, t2.micro)

> aws ec2 run-instances \
>       --image-id ami-0a58e22c727337c51 \
>       --instance-type t2.micro \
>       --key anwickesPub \
>       --security-group-ids sg-0cdc71b508bad29af \
>       --associate-public-ip-address

'''
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-0a58e22c727337c51",
            "InstanceId": "i-0eb95b5ec77d4ed6d",
            "InstanceType": "t2.micro",
            "KeyName": "anwickesPub",
            "LaunchTime": "2020-07-12T03:41:48+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-3-22.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.3.22",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0bb753563c4c039f4",
            "VpcId": "vpc-0015f19f38173b298",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "24ccbb41-d6ef-4b9f-bc41-391a2665deb8",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-07-12T03:41:48+00:00",
                        "AttachmentId": "eni-attach-0cc9249210eb1f4d7",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "myPublicSG",
                            "GroupId": "sg-0cdc71b508bad29af"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "02:6f:eb:d1:20:3c",
                    "NetworkInterfaceId": "eni-00318f6fb78bdcf80",
                    "OwnerId": "595178663294",
                    "PrivateDnsName": "ip-172-31-3-22.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.3.22",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-3-22.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.3.22"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0bb753563c4c039f4",
                    "VpcId": "vpc-0015f19f38173b298",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "myPublicSG",
                    "GroupId": "sg-0cdc71b508bad29af"
                }
            ],
            "SourceDestCheck": true,
            "StateReason": {
                "Code": "pending",
                "Message": "pending"
            },
            "VirtualizationType": "hvm",
            "CpuOptions": {
                "CoreCount": 1,
                "ThreadsPerCore": 1
            },
            "CapacityReservationSpecification": {
                "CapacityReservationPreference": "open"
            },
            "MetadataOptions": {
                "State": "pending",
                "HttpTokens": "optional",
                "HttpPutResponseHopLimit": 1,
                "HttpEndpoint": "enabled"
            }
        }
    ],
    "OwnerId": "595178663294",
    "ReservationId": "r-0987c9aa6ebda88f7"
}
'''

- Return public IP

> aws ec2 describe-instances --query "Reservations[*].Instances[*].PublicIpAddress"

```
[
    [
        "54.206.35.181"
    ]
]
```

- SSH to public EC2
Note: Had issues with my key permissions being too open on Windows 10 to followed the instructions in the below link to fix.
https://superuser.com/a/1296046

> ssh -i anwickesPub ec2_user@54.206.35.181

```
PS D:\Work\Training\devopsacademyau> ssh -i anwickesPub.pem ec2-user@54.206.35.181

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
9 package(s) needed for security, out of 16 available
Run "sudo yum update" to apply all updates.
```

- Create private security group

> aws ec2 create-security-group --group-name myPrivateSG --description "Security Group to provide access to private IP of EC2 from another EC2" --vpc-id "vpc-0015f19f38173b298" 
> aws ec2 describe-security-groups

```
{
    "SecurityGroups": [
        {
            "Description": "Security Group to provide access to private IP of EC2 from another EC2",
            "GroupName": "myPrivateSG",
            "IpPermissions": [],
            "OwnerId": "595178663294",
            "GroupId": "sg-077b3c70c7c5b9735",
            "IpPermissionsEgress": [
                {
                    "IpProtocol": "-1",
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "UserIdGroupPairs": []
                }
            ],
            "VpcId": "vpc-0015f19f38173b298"
        }
    ]
}
```

- Create private ingress

> aws ec2 authorize-security-group-ingress --group-id sg-077b3c70c7c5b9735 --protocol tcp --port 22 --source-group sg-0cdc71b508bad29af

- Create EC2 instance (ami-0a58e22c727337c51, t2.micro)

> aws ec2 run-instances \
>       --image-id ami-0a58e22c727337c51 \
>       --instance-type t2.micro \
>       --key anwickesPri \
>       --security-group-ids sg-077b3c70c7c5b9735 \
>       --no-associate-public-ip-address

```
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-0a58e22c727337c51",
            "InstanceId": "i-03fee117aa50bee98",
            "InstanceType": "t2.micro",
            "KeyName": "anwickesPri",
            "LaunchTime": "2020-07-12T04:16:46+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-8-76.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.8.76",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0bb753563c4c039f4",
            "VpcId": "vpc-0015f19f38173b298",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "9efee49c-cc86-4b00-a1b5-86e15606d728",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-07-12T04:16:46+00:00",
                        "AttachmentId": "eni-attach-007ad115359dcd351",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "myPrivateSG",
                            "GroupId": "sg-077b3c70c7c5b9735"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "02:ca:e4:a1:11:9a",
                    "NetworkInterfaceId": "eni-0fdf5862d0175d6eb",
                    "OwnerId": "595178663294",
                    "PrivateDnsName": "ip-172-31-8-76.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.8.76",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-8-76.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.8.76"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0bb753563c4c039f4",
                    "VpcId": "vpc-0015f19f38173b298",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "myPrivateSG",
                    "GroupId": "sg-077b3c70c7c5b9735"
                }
            ],
            "SourceDestCheck": true,
            "StateReason": {
                "Code": "pending",
                "Message": "pending"
                "HttpEndpoint": "enabled"
            }
        }
    ],
    "OwnerId": "595178663294",
    "ReservationId": "r-0f41b3a084c7782ae"
}
```

- SSH to private EC2 from public EC2

Proving that we can't connect externally

> ssh -i anwickesPri.pem ec2-user@172.31.8.76

```
ssh: connect to host 172.31.8.76 port 22: Connection timed out
```

Connecting to public EC2 and then ssh to private EC2

Run on localhost

> scp -i anwickesPub.pem anwickesPri.pem ec2-user@54.206.35.181:anwickesPri.pem
> ssh -i anwickesPub.pem ec2-user@54.206.35.181

Run on public EC2

> chmod 400 anwickesPri.pem
> ssh -i anwickesPri.pem ec2-user@172.31.8.76

```
[ec2-user@ip-172-31-3-22 ~]$ ssh -i anwickesPri.pem ec2-user@172.31.8.76

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-172-31-8-76 ~]$ 
```