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
    --subnet-id subnet-062fa33492cd979a6 \
    --security-group-ids sg-01331d649596fcd01 \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value="DevOps Academy - Private"}]'

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-03dcef5153124f729",
            "InstanceType": "t2.micro",
            "KeyName": "DevOpsAcademy",
            "LaunchTime": "2020-06-26T16:40:08+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-10-11-1-6.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "10.11.1.6",
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
                        "AttachTime": "2020-06-26T16:40:08+00:00",
                        "AttachmentId": "eni-attach-0b551c73de6426439",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "private-sg",
                            "GroupId": "sg-01331d649596fcd01"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "02:58:43:5b:18:e6",
                    "NetworkInterfaceId": "eni-017ce64d8aadd4ced",
                    "OwnerId": "149613515908",
                    "PrivateIpAddress": "10.11.1.6",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "10.11.1.6"
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
                    "GroupName": "private-sg",
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
    "ReservationId": "r-0e6ed2752253828df"
}

$ aws ec2 attach-network-interface \
    --network-interface-id eni-0fab763805ac2c997 \
    --instance-id i-03dcef5153124f729 \
    --device-index 1

{
    "AttachmentId": "eni-attach-09b1f173eee91b321"
}
```

- Commands for accessing your public instance using ssh

```
$ ssh-add devops-academy.pem
Identity added: devops-academy.pem (devops-academy.pem)

$ ssh -A ec2-user@13.55.143.119
The authenticity of host '13.55.143.119 (13.55.143.119)' can't be established.
ECDSA key fingerprint is SHA256:LFex5HrHI65hQ25vm7/W9ckxMSn/KpgJnhjSYWETCgk.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '13.55.143.119' (ECDSA) to the list of known hosts.

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
The authenticity of host '10.11.1.4 (10.11.1.4)' can't be established.
ECDSA key fingerprint is SHA256:vWL1kqAJlVwpjmZ6XNVCNxJdRtBe8lS+bcjSuKsovWI.
ECDSA key fingerprint is MD5:9c:2e:fc:69:ad:5a:74:18:76:90:c6:36:48:24:fb:a5.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '10.11.1.4' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 10 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-10-11-1-6 ~]$

[ec2-user@ip-10-11-1-6 ~]$ ifconfig eth1
eth1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 9001
        inet 10.11.1.4  netmask 255.255.255.0  broadcast 10.11.1.255
        inet6 fe80::90:bbff:fe78:c752  prefixlen 64  scopeid 0x20<link>
        ether 02:90:bb:78:c7:52  txqueuelen 1000  (Ethernet)
        RX packets 99  bytes 10123 (9.8 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 90  bytes 13745 (13.4 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

- Commands for testing ping to `8.8.8.8` from private instance

```
[ec2-user@ip-10-11-1-6 ~]$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=108 time=1.56 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=108 time=1.29 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=108 time=1.28 ms
```

- Any extra challenges faced?

Yes, I haven't found a way to attach the ENI to the private EC2 while the instance is being launched (cold attach). Just curious to know if it is possible somehow.

This is what I tried:

$ aws ec2 run-instances \
    --image-id ami-088ff0e3bde7b3fdf \
    --instance-type t2.micro \
    --key-name DevOpsAcademy \
    --subnet-id subnet-062fa33492cd979a6 \
    --network-interfaces 'DeviceIndex=1,NetworkInterfaceId=eni-0fab763805ac2c997' \
    --security-group-ids sg-01331d649596fcd01 \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value="DevOps Academy - Private"}]'

An error occurred (InvalidParameterCombination) when calling the RunInstances operation: Network interfaces and an instance-level subnet ID may not be specified on the same request

***
Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)
