# C01-AWS01

## Commands Execution Output
conor.chisholm-ray@contino.io@Conors-MacBook-Pro contin-dev % aws ec2 create-security-group \
    --group-name ccr-devopsacademy-ec2-101-sg \
    --description "CCR devops academy security group" \
    --vpc-id vpc-e5bc1a82
{
    "GroupId": "sg-079abae329612febd"
}
conor.chisholm-ray@contino.io@Conors-MacBook-Pro contin-dev % aws ec2 authorize-security-group-ingress \
    --group-id sg-079abae329612febd\
    --protocol tcp \
    --port 22 \
    --cidr 220.233.169.30/24
{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-0e936e0ca898299ab",
            "GroupId": "sg-079abae329612febd",
            "GroupOwnerId": "152848913167",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "CidrIpv4": "220.233.169.0/24"
        }
    ]
}
conor.chisholm-ray@contino.io@Conors-MacBook-Pro contin-dev % aws ec2 run-instances \
    --image-id ami-042c4533fa25c105a \
    --instance-type t2.micro \
    --subnet-id subnet-70851a39 \
    --security-group-ids sg-079abae329612febd \
    --associate-public-ip-address \
    --key-name conorcr-kp
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-042c4533fa25c105a",
            "InstanceId": "i-02c167cc949ded115",
            "InstanceType": "t2.micro",
            "KeyName": "conorcr-kp",
            "LaunchTime": "2022-02-16T05:43:44+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-40-176.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.40.176",
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
            "ClientToken": "1364f8fc-cdd2-4c2d-9ccb-65a16d175fac",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-02-16T05:43:44+00:00",
                        "AttachmentId": "eni-attach-0bf5667733393f421",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "ccr-devopsacademy-ec2-101-sg",
                            "GroupId": "sg-079abae329612febd"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:ec:83:3c:72:6a",
                    "NetworkInterfaceId": "eni-0edf2971b9380b171",
                    "OwnerId": "152848913167",
                    "PrivateDnsName": "ip-172-31-40-176.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.40.176",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-40-176.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.40.176"
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
                    "GroupName": "ccr-devopsacademy-ec2-101-sg",
                    "GroupId": "sg-079abae329612febd"
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
            }
        }
    ],
    "OwnerId": "152848913167",
    "ReservationId": "r-018089b9c9db75567"
}
conor.chisholm-ray@contino.io@Conors-MacBook-Pro contin-dev % aws ec2 describe-instances --instance-ids i-02c167cc949ded115
{
    "Reservations": [
        {
            "Groups": [],
            "Instances": [
                {
                    "AmiLaunchIndex": 0,
                    "ImageId": "ami-042c4533fa25c105a",
                    "InstanceId": "i-02c167cc949ded115",
                    "InstanceType": "t2.micro",
                    "KeyName": "conorcr-kp",
                    "LaunchTime": "2022-02-16T05:43:44+00:00",
                    "Monitoring": {
                        "State": "disabled"
                    },
                    "Placement": {
                        "AvailabilityZone": "ap-southeast-2a",
                        "GroupName": "",
                        "Tenancy": "default"
                    },
                    "PrivateDnsName": "ip-172-31-40-176.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.40.176",
                    "ProductCodes": [],
                    "PublicDnsName": "ec2-13-211-146-161.ap-southeast-2.compute.amazonaws.com",
                    "PublicIpAddress": "13.211.146.161",
                    "State": {
                        "Code": 16,
                        "Name": "running"
                    },
                    "StateTransitionReason": "",
                    "SubnetId": "subnet-70851a39",
                    "VpcId": "vpc-e5bc1a82",
                    "Architecture": "x86_64",
                    "BlockDeviceMappings": [
                        {
                            "DeviceName": "/dev/xvda",
                            "Ebs": {
                                "AttachTime": "2022-02-16T05:43:45+00:00",
                                "DeleteOnTermination": true,
                                "Status": "attached",
                                "VolumeId": "vol-04e08cb3f36a85b3f"
                            }
                        }
                    ],
                    "ClientToken": "1364f8fc-cdd2-4c2d-9ccb-65a16d175fac",
                    "EbsOptimized": false,
                    "EnaSupport": true,
                    "Hypervisor": "xen",
                    "NetworkInterfaces": [
                        {
                            "Association": {
                                "IpOwnerId": "amazon",
                                "PublicDnsName": "ec2-13-211-146-161.ap-southeast-2.compute.amazonaws.com",
                                "PublicIp": "13.211.146.161"
                            },
                            "Attachment": {
                                "AttachTime": "2022-02-16T05:43:44+00:00",
                                "AttachmentId": "eni-attach-0bf5667733393f421",
                                "DeleteOnTermination": true,
                                "DeviceIndex": 0,
                                "Status": "attached",
                                "NetworkCardIndex": 0
                            },
                            "Description": "",
                            "Groups": [
                                {
                                    "GroupName": "ccr-devopsacademy-ec2-101-sg",
                                    "GroupId": "sg-079abae329612febd"
                                }
                            ],
                            "Ipv6Addresses": [],
                            "MacAddress": "06:ec:83:3c:72:6a",
                            "NetworkInterfaceId": "eni-0edf2971b9380b171",
                            "OwnerId": "152848913167",
                            "PrivateDnsName": "ip-172-31-40-176.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.40.176",
                            "PrivateIpAddresses": [
                                {
                                    "Association": {
                                        "IpOwnerId": "amazon",
                                        "PublicDnsName": "ec2-13-211-146-161.ap-southeast-2.compute.amazonaws.com",
                                        "PublicIp": "13.211.146.161"
                                    },
                                    "Primary": true,
                                    "PrivateDnsName": "ip-172-31-40-176.ap-southeast-2.compute.internal",
                                    "PrivateIpAddress": "172.31.40.176"
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
                            "GroupName": "ccr-devopsacademy-ec2-101-sg",
                            "GroupId": "sg-079abae329612febd"
                        }
                    ],
                    "SourceDestCheck": true,
                    "VirtualizationType": "hvm",
                    "CpuOptions": {
                        "CoreCount": 1,
                        "ThreadsPerCore": 1
                    },
                    "CapacityReservationSpecification": {
                        "CapacityReservationPreference": "open"
                    },
                    "HibernationOptions": {
                        "Configured": false
                    },
                    "MetadataOptions": {
                        "State": "applied",
                        "HttpTokens": "optional",
                        "HttpPutResponseHopLimit": 1,
                        "HttpEndpoint": "enabled",
                        "HttpProtocolIpv6": "disabled",
                        "InstanceMetadataTags": "disabled"
                    },
                    "EnclaveOptions": {
                        "Enabled": false
                    },
                    "PlatformDetails": "Linux/UNIX",
                    "UsageOperation": "RunInstances",
                    "UsageOperationUpdateTime": "2022-02-16T05:43:44+00:00",
                    "PrivateDnsNameOptions": {
                        "HostnameType": "ip-name",
                        "EnableResourceNameDnsARecord": false,
                        "EnableResourceNameDnsAAAARecord": false
                    }
                }
            ],
            "OwnerId": "152848913167",
            "ReservationId": "r-018089b9c9db75567"
        }
    ]
}

- ### Commands to create the first EC2 instance and any additional resource required:

- Create security group
```
    aws ec2 create-security-group \
    --group-name ccr-devopsacademy-ec2-101-sg \
    --description "CCR devops academy security group" \
    --vpc-id vpc-e5bc1a82
```

- And allow ssh traffic from my IP
```
    aws ec2 authorize-security-group-ingress \
    --group-id sg-079abae329612febd\
    --protocol tcp \
    --port 22 \
    --cidr 220.233.169.30/24`
```

- Create ec2 instance
```
    aws ec2 run-instances \
    --image-id ami-042c4533fa25c105a \
    --instance-type t2.micro \
    --subnet-id subnet-70851a39 \
    --security-group-ids sg-079abae329612febd \
    --associate-public-ip-address \
    --key-name conorcr-kp
```


* ### Commands to connect to the first EC2 instance:

`ssh -i conorcr-kp.pem ec2-user@ec2-13-211-146-161.ap-southeast-2.compute.amazonaws.com`

- ### Commands to create the second EC2 instance and any additional resource required:

- Create 2nd ec2 instance
```
    aws ec2 run-instances \
    --image-id ami-042c4533fa25c105a \
    --instance-type t2.micro \
    --subnet-id subnet-70851a39 \
    --security-group-ids sg-079abae329612febd \
    --key-name conorcr-kp \
    --no-associate-public-ip-address
```

- Create security group rule to allow ssh from subnet cidr
```
    aws ec2 authorize-security-group-ingress \
    --group-id sg-079abae329612febd\
    --protocol tcp \
    --port 22 \
    --cidr 172.31.0.0/16
```

- ### Commands to connect to the second EC2 instance:
    - Connect to 2nd ec2 instance
`ssh -i conorcr-kp.pem -J ec2-user@ec2-13-211-146-161.ap-southeast-2.compute.amazonaws.com ec2-user@172.31.42.119`
    
    - Command output
```
The authenticity of host '172.31.42.119 (<no hostip for proxy command>)' can't be established.
ED25519 key fingerprint is SHA256:n4VkXmV24dssmC7mSKNqDooBWfPw+AS8HznXUTXUMt0.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '172.31.42.119' (ED25519) to the list of known hosts.
Last login: Wed Feb 16 05:56:26 2022 from ip-172-31-40-176.ap-southeast-2.compute.internal

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
3 package(s) needed for security, out of 6 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-42-119 ~]$ 
```
---

Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws01/README.md)
