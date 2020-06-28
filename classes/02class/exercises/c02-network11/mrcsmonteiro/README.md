# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```
$ aws ec2 create-key-pair \
    --key-name DevOpsAcademy \
    | jq -r ".KeyMaterial" > ~/.ssh/devops-academy.pem && chmod 400 ~/.ssh/devops-academy.pem

$ aws ec2 run-instances \
    --image-id ami-088ff0e3bde7b3fdf \
    --instance-type t2.micro \
    --key-name DevOpsAcademy \
    --subnet-id subnet-012cc488da2a78bcd \
    --security-group-ids sg-0eda88d126367fb83 \
    --associate-public-ip-address \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value="DevOps Academy - Public"}]'

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-01dde1f8800da41a8",
            "InstanceType": "t2.micro",
            "KeyName": "DevOpsAcademy",
            "LaunchTime": "2020-06-26T16:36:33+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-10-11-11-41.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "10.11.11.41",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-012cc488da2a78bcd",
            "VpcId": "vpc-0721e28436cea8410",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-06-26T16:36:33+00:00",
                        "AttachmentId": "eni-attach-0bde7bc5f85a45acf",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "public-sg",
                            "GroupId": "sg-0eda88d126367fb83"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "02:40:29:77:8b:4c",
                    "NetworkInterfaceId": "eni-0052a727fefea619c",
                    "OwnerId": "149613515908",
                    "PrivateIpAddress": "10.11.11.41",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "10.11.11.41"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-012cc488da2a78bcd",
                    "VpcId": "vpc-0721e28436cea8410",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "public-sg",
                    "GroupId": "sg-0eda88d126367fb83"
                }
            ],
            "SourceDestCheck": true,
            "StateReason": {
                "Code": "pending",
                "Message": "pending"
            },
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "DevOps Academy - Public"
                }
            ],
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
    "OwnerId": "149613515908",
    "ReservationId": "r-06ea7eca17709a223"
}
```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```
$ aws ec2 run-instances \
    --image-id ami-088ff0e3bde7b3fdf \
    --instance-type t2.micro \
    --key-name DevOpsAcademy \
    --network-interfaces '[{"DeviceIndex":0,"NetworkInterfaceId":"eni-0fab763805ac2c997"}]' \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value="DevOps Academy - Private"}]'

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-015b584b84fb5adb5",
            "InstanceType": "t2.micro",
            "KeyName": "DevOpsAcademy",
            "LaunchTime": "2020-06-27T08:01:25+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-10-11-1-4.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "10.11.1.4",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-062fa33492cd979a6",
            "VpcId": "vpc-0721e28436cea8410",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-06-27T08:01:25+00:00",
                        "AttachmentId": "eni-attach-05d262289d3392feb",
                        "DeleteOnTermination": false,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "DevOps Academy ENI",
                    "Groups": [
                        {
                            "GroupId": "sg-01331d649596fcd01"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "02:90:bb:78:c7:52",
                    "NetworkInterfaceId": "eni-0fab763805ac2c997",
                    "OwnerId": "149613515908",
                    "PrivateIpAddress": "10.11.1.4",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "10.11.1.4"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-062fa33492cd979a6",
                    "VpcId": "vpc-0721e28436cea8410",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupId": "sg-01331d649596fcd01"
                }
            ],
            "SourceDestCheck": true,
            "StateReason": {
                "Code": "pending",
                "Message": "pending"
            },
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "DevOps Academy - Private"
                }
            ],
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
    "OwnerId": "149613515908",
    "ReservationId": "r-0b955e0eb2a2827c4"
}
```

- Commands for accessing your public instance using ssh

```
$ ssh-add devops-academy.pem
Identity added: devops-academy.pem (devops-academy.pem)

$ ssh -A ec2-user@3.25.64.226
Last login: Sat Jun 27 09:35:51 2020 from 120-88-137-206.tpgi.com.au

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 10 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-10-11-11-41 ~]$
```

- Commands for accessing your private instance from public one

```
[ec2-user@ip-10-11-11-41 ~]$ ssh 10.11.1.4
Last login: Sat Jun 27 09:35:54 2020 from 10.11.11.41

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 10 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-10-11-1-4 ~]$
```

- Commands for testing ping to `8.8.8.8` from private instance

```
[ec2-user@ip-10-11-1-4 ~]$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=108 time=1.49 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=108 time=1.17 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=108 time=1.12 ms
```

- Any extra challenges faced?

Yes, I had issues to attach the ENI to the private EC2 during the instance launch (cold attach): 

```
$ aws ec2 run-instances \
    --image-id ami-088ff0e3bde7b3fdf \
    --instance-type t2.micro \
    --key-name DevOpsAcademy \
    --subnet-id subnet-062fa33492cd979a6 \
    --network-interfaces 'DeviceIndex=1,NetworkInterfaceId=eni-0fab763805ac2c997' \
    --security-group-ids sg-01331d649596fcd01 \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value="DevOps Academy - Private"}]'

An error occurred (InvalidParameterCombination) when calling the RunInstances operation: Network interfaces and an instance-level subnet ID may not be specified on the same request
```

I had a chat with Jay and he was able to do that. I managed to tackle the issue by removing the subnet-id and security-group-ids parameters, and also changing the network-interfaces syntax:

```
$ aws ec2 run-instances \
    --image-id ami-088ff0e3bde7b3fdf \
    --instance-type t2.micro \
    --key-name DevOpsAcademy \
    --network-interfaces '[{"DeviceIndex":0,"NetworkInterfaceId":"eni-0fab763805ac2c997"}]' \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value="DevOps Academy - Private"}]'
```

Looks like the subnet and SG are inherited from the ENI, hence they shouldn't be informed on the same request to avoid the invalid parameter combination error!

***
Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)
