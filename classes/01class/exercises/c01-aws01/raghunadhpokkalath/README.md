# C01-AWS01

## Commands Execution Output

- Commands to create the first EC2 instance and any additional resource required:
```
Create keypair to connect to EC2 instance

> aws ec2 create-key-pair --key-name EC2KeyPair --query 'KeyMaterial' --output text > EC2KeyPair.pem

Vertify fingerprint of keyPair

> aws ec2 describe-key-pairs --key-name EC2KeyPair

{
    "KeyPairs": [
        {
            "KeyPairId": "key-0462d8111f72767a7",
            "KeyFingerprint": "40:55:75:5c:06:d8:1a:2d:9c:6b:ae:d0:b9:fd:13:db:68:d6:2e:29",
            "KeyName": "EC2KeyPair",
            "Tags": []
        }
    ]
}

Create a default vpc (I have deleted default vpc before)

> aws ec2 create-default-vpc

Create security group for EC2

> aws ec2 create-security-group --group-name ec2-sg --description "EC2 Security Group"

{
    "GroupId": "sg-0c43ee1f951df16a7"
}

Add CIDR to security group to allow ssh connection

> aws ec2 authorize-security-group-ingress --group-id sg-0c43ee1f951df16a7 --protocol tcp --port 22 --cidr 58.96.95.0/24

Verify Security Group

> aws ec2 describe-security-groups --group-ids sg-0c43ee1f951df16a7 

{
    "SecurityGroups": [
        {
            "Description": "EC2 Security Group",
            "GroupName": "ec2-sg",
            "IpPermissions": [
                {
                    "FromPort": 22,
                    "IpProtocol": "tcp",
                    "IpRanges": [
                        {
                            "CidrIp": "58.96.95.0/24"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 22,
                    "UserIdGroupPairs": []
                }
            ],
            "OwnerId": "361529347535",
            "GroupId": "sg-0c43ee1f951df16a7",
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
            "VpcId": "vpc-07151f902b212800d"
        }
    ]
}

Start EC2 instance with public ip address
aws ec2 run-instances --image-id ami-03686c686b463366b --count 1 --instance-type t1.micro --key-name EC2KeyPair --security-group-ids sg-0c43ee1f951df16a7 --associate-public-ip-address

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-03686c686b463366b",
            "InstanceId": "i-0c98ac03e17a8323b",
            "InstanceType": "t1.micro",
            "KeyName": "EC2KeyPair",
            "LaunchTime": "2020-06-15T13:53:58+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2b",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-47-59.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.47.59",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0be2a4982e35f1cf0",
            "VpcId": "vpc-07151f902b212800d",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "7c269f7f-810a-4904-bd64-b4a77a5bf0ee",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-06-15T13:53:58+00:00",
                        "AttachmentId": "eni-attach-0cc044c66067bfe55",
                        "DeleteOnTermination": true,
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-03686c686b463366b",
            "InstanceId": "i-0c98ac03e17a8323b",
            "InstanceType": "t1.micro",
            "KeyName": "EC2KeyPair",
            "LaunchTime": "2020-06-15T13:53:58+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2b",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-47-59.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.47.59",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0be2a4982e35f1cf0",
            "VpcId": "vpc-07151f902b212800d",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "7c269f7f-810a-4904-bd64-b4a77a5bf0ee",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-06-15T13:53:58+00:00",
                        "AttachmentId": "eni-attach-0cc044c66067bfe55",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "ec2-sg",
                            "GroupId": "sg-0c43ee1f951df16a7"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:8a:ce:36:de:6c",
                    "NetworkInterfaceId": "eni-0f8190eaab4afe944",
                    "OwnerId": "361529347535",
                    "PrivateDnsName": "ip-172-31-47-59.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.47.59",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-47-59.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.47.59"
                        }
    }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0be2a4982e35f1cf0",
                    "VpcId": "vpc-07151f902b212800d",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "ec2-sg",
                    "GroupId": "sg-0c43ee1f951df16a7"
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
    "OwnerId": "361529347535",
    "ReservationId": "r-0fa0e40ec0f1a8e22"
}

Get Public ip address
> aws ec2 describe-instances --instance-ids i-0c98ac03e17a8323b --query 'Reservations[0].Instances[0].PublicIpAddress'
3.25.132.226

```

- Commands to connect to the first EC2 instance:
```
> ssh -i "EC2KeyPair.pem" ec2-user@3.25.132.226

The authenticity of host '3.25.132.226 (3.25.132.226)' can't be established.
ECDSA key fingerprint is SHA256:mshfO7fCSeQ7HJtuVDoMi+a5ehKfI0CaqJasw8FtLrY.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '3.25.132.226' (ECDSA) to the list of known hosts.
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@         WARNING: UNPROTECTED PRIVATE KEY FILE!          @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Permissions 0644 for 'EC2KeyPair.pem' are too open.
It is required that your private key files are NOT accessible by others.
This private key will be ignored.
Load key "EC2KeyPair.pem": bad permissions
ec2-user@3.25.132.226: Permission denied (publickey).

Change permission of Pem file
chmod 400 EC2KeyPair.pem

>ssh -i "EC2KeyPair.pem" ec2-user@3.25.132.226

https://aws.amazon.com/amazon-linux-ami/2018.03-release-notes/
5 package(s) needed for security, out of 7 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-47-59 ~]$ 

```

- Commands to create the second EC2 instance and any additional resource required:
```
Create new security group  to allow ssh only from same VPC 

> aws ec2 create-security-group --group-name ec2-sg-private --description "EC2 Security Group Private connection"

{
    "GroupId": "sg-04a824ffed232066c"
}
Add CIDR to security group to allow ssh connection only from same VPC

> aws ec2 authorize-security-group-ingress --group-id sg-04a824ffed232066c --protocol tcp --port 22 --cidr 172.31.0.0/16

Create second EC2 instance with new security group and no public ip address 

aws ec2 run-instances --image-id ami-03686c686b463366b --count 1 --instance-type t1.micro  --security-group-ids sg-04a824ffed232066c --no-associate-public-ip-address --key-name EC2KeyPair 


{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-03686c686b463366b",
            "InstanceId": "i-0074ea0331289b25d",
            "InstanceType": "t1.micro",
            "KeyName": "EC2KeyPair",
            "LaunchTime": "2020-06-16T02:39:36+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2b",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-42-9.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.42.9",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0be2a4982e35f1cf0",
            "VpcId": "vpc-07151f902b212800d",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "cf4f9401-67f8-4978-82b3-749672ae6e90",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-06-16T02:39:36+00:00",
                        "AttachmentId": "eni-attach-0f5540b42cbe21248",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "ec2-sg-private",
                            "GroupId": "sg-04a824ffed232066c"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:1c:86:62:55:e4",
                    "NetworkInterfaceId": "eni-0948699391eeaabdf",
                    "OwnerId": "361529347535",
                    "PrivateDnsName": "ip-172-31-42-9.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.42.9",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-42-9.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.42.9"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0be2a4982e35f1cf0",
                    "VpcId": "vpc-07151f902b212800d",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "ec2-sg-private",
                    "GroupId": "sg-04a824ffed232066c"
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
    "OwnerId": "361529347535",
    "ReservationId": "r-053a181eaa124d6cb"
}


verify no public ip is available
> aws ec2 describe-instances --instance-ids i-0074ea0331289b25d --query 'Reservations[0].Instances[0].PublicIpAddress'

null

Get the private ip address
>aws ec2 describe-instances --instance-ids i-0074ea0331289b25d --query 'Reservations[0].Instances[0].PrivateIpAddress'
"172.31.42.9"


```

- Commands to connect to the second EC2 instance:
```
Add PEM key to ssh keychain
> ssh-add -k EC2KeyPair.pem
Identity added: EC2KeyPair.pem (EC2KeyPair.pem)



 Connect to First EC2 instance using ssh agent forward
>ssh -A  ec2-user@3.25.132.226
Last login: Tue Jun 16 02:41:29 2020 from 89.95.96.58.static.exetel.com.au

       __|  __|_  )
       _|  (     /   Amazon Linux AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-ami/2018.03-release-notes/
5 package(s) needed for security, out of 7 available
Run "sudo yum update" to apply all updates.


Connect to second EC2 instance
> ssh  ec2-user@172.31.42.9

[ec2-user@ip-172-31-47-59 ~]$ ssh  ec2-user@172.31.42.9

       __|  __|_  )
       _|  (     /   Amazon Linux AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-ami/2018.03-release-notes/



```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws01/README.md)