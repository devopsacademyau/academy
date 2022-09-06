## Use the CLI to create a new EC2 Instance inside the default VPC with a public IP address and connect to it though SSH.

### Create SSH Key Pair for Jumpbox and Webapp EC2 Instances
```
aws ec2 create-key-pair --key-name james-contino-sydney \
> --query 'KeyMaterial' \
> --output text > ~/.ssh/aws/james-contino-sydney.pem
```

### Create Security Groups for Jumbpx EC2 Instance
```
$ aws ec2 create-security-group --group-name jumpbox-sg --description "Jumpbox SG"

{
    "GroupId": "sg-04afd3dcb71f79051"
}
```

### Add Rules to the Created Security Groups for Jumbpx EC2 Instance
```
$ aws ec2 authorize-security-group-ingress \
> --group-name jumpbox-sg  \
> --protocol tcp \
> --port 22 \
> --cidr "$(curl checkip.amazonaws.com)/32"

{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-068987286dbba4130",
            "GroupId": "sg-04afd3dcb71f79051",
            "GroupOwnerId": "152848913167",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "CidrIpv4": "<my-public-ip-address-here>/32"
        }
    ]
}
```

### Query latest Amazon Linux 2
```
aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2

{
    "Parameters": [
        {
            "Name": "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2",
            "Type": "String",
            "Value": "ami-0336d88ead51a9210",
            "Version": 72,
            "LastModifiedDate": "2022-08-23T05:41:19.863000+10:00",
            "ARN": "arn:aws:ssm:ap-southeast-2::parameter/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2",
            "DataType": "text"
        }
    ],
    "InvalidParameters": []
}
```

### Create Jumbpx EC2 Instance
```
aws ec2 run-instances \
    --image-id ami-0336d88ead51a9210 \
    --instance-type t2.micro \
    --associate-public-ip-address \
    --key-name james-contino-sydney \
    --security-group-ids sg-04afd3dcb71f79051


{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-0336d88ead51a9210",
            "InstanceId": "i-0c547ef7d41b2e8b3",
            "InstanceType": "t2.micro",
            "KeyName": "james-contino-sydney",
            "LaunchTime": "2022-08-23T06:47:15+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-38-3.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.38.3",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "StateTransitionReason": "",
            "SubnetId": "subnet-70851a39",
            "VpcId": "vpc-e5bc1a82",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "a0b8a80b-695e-459e-8875-55c518a60672",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-08-23T06:47:15+00:00",
                        "AttachmentId": "eni-attach-0af979f097a13346f",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "jumpbox-sg",
                            "GroupId": "sg-04afd3dcb71f79051"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:4c:ed:22:33:2a",
                    "NetworkInterfaceId": "eni-0868e45c91f40ea4e",
                    "OwnerId": "152848913167",
                    "PrivateDnsName": "ip-172-31-38-3.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.38.3",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-38-3.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.38.3"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-70851a39",
                    "VpcId": "vpc-e5bc1a82",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "jumpbox-sg",
                    "GroupId": "sg-04afd3dcb71f79051"
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
                "HttpEndpoint": "enabled",
                "HttpProtocolIpv6": "disabled",
                "InstanceMetadataTags": "disabled"
            },
            "EnclaveOptions": {
                "Enabled": false
            },
            "PrivateDnsNameOptions": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            },
            "MaintenanceOptions": {
                "AutoRecovery": "default"
            }
        }
    ],
    "OwnerId": "152848913167",
    "ReservationId": "r-09f7c3fd26706a12e"
}
```

### Get the Public IP Address for Jumbpx EC2 Instance
```
aws ec2 describe-instances --instance-ids i-0c547ef7d41b2e8b3
```

### SSH to Jumbpx EC2 Instance
```
$ ssh ec2-user@3.26.185.236
The authenticity of host '3.26.185.236 (3.26.185.236)' can't be established.
ED25519 key fingerprint is SHA256:ho7S7lpHcuXS1QNwI8Q8jqyFr6r8ildzCbbrrpBSSVE.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '3.26.185.236' (ED25519) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
3 package(s) needed for security, out of 7 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-38-3 ~]$
```


## Create another EC2, also using the CLI instance in the same VPC but with private address only and connect to it.


### Create Security Groups for Webapp EC2 Instance
```
$ aws ec2 create-security-group --group-name webapp-sg --description "webapp SG"

{
    "GroupId": "sg-0cc25ce233e5e929b"
}
```

### Add Rules to the Created Security Groups for Webapp EC2 Instance
```
$ aws ec2 authorize-security-group-ingress \
> --group-name webapp-sg  \
> --protocol tcp \
> --port 22 \
> --source-group jumpbox-sg

{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-0a6da99ab030a7a54",
            "GroupId": "sg-0cc25ce233e5e929b",
            "GroupOwnerId": "152848913167",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "ReferencedGroupInfo": {
                "GroupId": "sg-04afd3dcb71f79051"
            }
        }
    ]
}
```

### Create Webapp EC2 Instance
```
aws ec2 run-instances \
    --image-id ami-0336d88ead51a9210 \
    --instance-type t2.micro \
    --no-associate-public-ip-address \
    --key-name james-contino-sydney \
    --security-group-ids sg-0cc25ce233e5e929b


{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-0336d88ead51a9210",
            "InstanceId": "i-079add56d606c9c72",
            "InstanceType": "t2.micro",
            "KeyName": "james-contino-sydney",
            "LaunchTime": "2022-08-23T07:02:16+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-46-58.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.46.58",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-70851a39",
            "VpcId": "vpc-e5bc1a82",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "911877f7-de8f-4528-897f-77aa5202d59f",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-08-23T07:02:16+00:00",
                        "AttachmentId": "eni-attach-04188333d13a80e16",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "webapp-sg",
                            "GroupId": "sg-0cc25ce233e5e929b"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:f3:52:96:8c:f6",
                    "NetworkInterfaceId": "eni-0b6df9477da4e3cef",
                    "OwnerId": "152848913167",
                    "PrivateDnsName": "ip-172-31-46-58.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.46.58",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-46-58.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.46.58"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-70851a39",
                    "VpcId": "vpc-e5bc1a82",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "webapp-sg",
                    "GroupId": "sg-0cc25ce233e5e929b"
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
                "HttpEndpoint": "enabled",
                "HttpProtocolIpv6": "disabled",
                "InstanceMetadataTags": "disabled"
            },
            "EnclaveOptions": {
                "Enabled": false
            },
            "PrivateDnsNameOptions": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            },
            "MaintenanceOptions": {
                "AutoRecovery": "default"
            }
        }
    ],
    "OwnerId": "152848913167",
    "ReservationId": "r-0b4c7577e3d1bde66"
}
```

### Get the Public IP Address of Webapp EC2 Instance
```
aws ec2 describe-instances --instance-ids i-079add56d606c9c72
```

### SSH to Webapp EC2 Instance from Jumpbox.
```
[ec2-user@ip-172-31-38-3 ~]$ ssh ec2-user@172.31.46.58
Last login: Tue Aug 23 07:11:18 2022 from ip-172-31-38-3.ap-southeast-2.compute.internal

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
```