# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```
## Reusing the previous key pair.

> aws ec2 run-instances \
    --image-id resolve:ssm:/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 \
    --instance-type t2.micro \
    --count 1 \
    --associate-public-ip-address \
    --subnet-id subnet-05ba54dadeae3a83c\
    --security-group-ids sg-0d522f9270aa71522 \
    --key-name PubHostKeyPair

    {
        "Groups": [],
        "Instances": [
            {
                "AmiLaunchIndex": 0,
                "ImageId": "ami-088ff0e3bde7b3fdf",
                "InstanceId": "i-0fd4f40e3e1d26368",
                "InstanceType": "t2.micro",
                "KeyName": "PubHostKeyPair",
                "LaunchTime": "2020-06-27T06:47:30+00:00",
                "Monitoring": {
                    "State": "disabled"
                },
                "Placement": {
                    "AvailabilityZone": "ap-southeast-2a",
                    "GroupName": "",
                    "Tenancy": "default"
                },
                "PrivateDnsName": "ip-192-168-107-191.ap-southeast-2.compute.internal",
                "PrivateIpAddress": "192.168.107.191",
                "ProductCodes": [],
                "PublicDnsName": "",
                "State": {
                    "Code": 0,
                    "Name": "pending"
                },
                "StateTransitionReason": "",
                "SubnetId": "subnet-05ba54dadeae3a83c",
                "VpcId": "vpc-007774900b7f4c596",
                "Architecture": "x86_64",
                "BlockDeviceMappings": [],
                "ClientToken": "0eae37c0-55e9-4a82-84f7-d6db446da46e",
                "EbsOptimized": false,
                "Hypervisor": "xen",
                "NetworkInterfaces": [
                    {
                        "Attachment": {
                            "AttachTime": "2020-06-27T06:47:30+00:00",
                            "AttachmentId": "eni-attach-03c6cdeab29f91868",
                            "DeleteOnTermination": true,
                            "DeviceIndex": 0,
                            "Status": "attaching"
                        },
                        "Description": "",
                        "Groups": [
                            {
                                "GroupName": "public-sg",
                                "GroupId": "sg-0d522f9270aa71522"
                            }
                        ],
                        "Ipv6Addresses": [],
                        "MacAddress": "02:9e:e8:76:59:9a",
                        "NetworkInterfaceId": "eni-0c2d71de5b0848eba",
                        "OwnerId": "907095435092",
                        "PrivateIpAddress": "192.168.107.191",
                        "PrivateIpAddresses": [
                            {
                                "Primary": true,
                                "PrivateIpAddress": "192.168.107.191"
                            }
                        ],
                        "SourceDestCheck": true,
                        "Status": "in-use",
                        "SubnetId": "subnet-05ba54dadeae3a83c",
                        "VpcId": "vpc-007774900b7f4c596",
                        "InterfaceType": "interface"
                    }
                ],
                "RootDeviceName": "/dev/xvda",
                "RootDeviceType": "ebs",
                "SecurityGroups": [
                    {
                        "GroupName": "public-sg",
                        "GroupId": "sg-0d522f9270aa71522"
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
        "OwnerId": "907095435092",
        "ReservationId": "r-03d6143c50965ff50"
    }

```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```
## Reusing the existing key pair.

> aws ec2 run-instances \
    --image-id resolve:ssm:/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 \
    --instance-type t2.micro \
    --count 1 \
    --network-interfaces '[{"DeviceIndex":0,"NetworkInterfaceId":"eni-026389c444ebacbb6"}]' \
    --key-name PrivateHostKeyPair

    {
        "Groups": [],
        "Instances": [
            {
                "AmiLaunchIndex": 0,
                "ImageId": "ami-088ff0e3bde7b3fdf",
                "InstanceId": "i-09b9fd3a1e15f18e9",
                "InstanceType": "t2.micro",
                "KeyName": "PrivateHostKeyPair",
                "LaunchTime": "2020-06-26T07:28:04+00:00",
                "Monitoring": {
                    "State": "disabled"
                },
                "Placement": {
                    "AvailabilityZone": "ap-southeast-2a",
                    "GroupName": "",
                    "Tenancy": "default"
                },
                "PrivateDnsName": "ip-192-168-10-10.ap-southeast-2.compute.internal",
                "PrivateIpAddress": "192.168.10.10",
                "ProductCodes": [],
                "PublicDnsName": "",
                "State": {
                    "Code": 0,
                    "Name": "pending"
                },
                "StateTransitionReason": "",
                "SubnetId": "subnet-0ee93ecd696d65414",
                "VpcId": "vpc-007774900b7f4c596",
                "Architecture": "x86_64",
                "BlockDeviceMappings": [],
                "ClientToken": "bc0f20ed-62a0-4cf6-86db-9ff5f0bad301",
                "EbsOptimized": false,
                "Hypervisor": "xen",
                "NetworkInterfaces": [
                    {
                        "Attachment": {
                            "AttachTime": "2020-06-26T07:28:04+00:00",
                            "AttachmentId": "eni-attach-0a8df812c0a8356a1",
                            "DeleteOnTermination": false,
                            "DeviceIndex": 0,
                            "Status": "attaching"
                        },
                        "Description": "DOA ENI",
                        "Groups": [
                            {
                                "GroupId": "sg-06519b6fe81ef49d3"
                            }
                        ],
                        "Ipv6Addresses": [],
                        "MacAddress": "02:39:3f:81:cf:d2",
                        "NetworkInterfaceId": "eni-026389c444ebacbb6",
                        "OwnerId": "907095435092",
                        "PrivateIpAddress": "192.168.10.10",
                        "PrivateIpAddresses": [
                            {
                                "Primary": true,
                                "PrivateIpAddress": "192.168.10.10"
                            }
                        ],
                        "SourceDestCheck": true,
                        "Status": "in-use",
                        "SubnetId": "subnet-0ee93ecd696d65414",
                        "VpcId": "vpc-007774900b7f4c596",
                        "InterfaceType": "interface"
                    }
                ],
                "RootDeviceName": "/dev/xvda",
                "RootDeviceType": "ebs",
                "SecurityGroups": [
                    {
                        "GroupId": "sg-06519b6fe81ef49d3"
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
        "OwnerId": "907095435092",
        "ReservationId": "r-03ceadd5badbb7c64"
    }

```

- Commands for accessing your public instance using ssh

```
➜  jay ssh-add -K PrivateHostKeyPair.pem
Identity added: PrivateHostKeyPair.pem (PrivateHostKeyPair.pem)
➜  jay ssh-add -K PubHostKeyPair.pem
Identity added: PubHostKeyPair.pem (PubHostKeyPair.pem)
➜  jay cat ~/.ssh/config
Host *
  AddKeysToAgent yes
  UseKeychain yes
  ForwardAgent yes
  IdentityFile ~/.ssh/id_rsa
  IdentityFile ~/.ssh/PubHostKeyPair.pem
  IdentityFile ~/.ssh/PrivateHostKeyPair.pem

➜  jay ssh ec2-user@13.236.136.201
Last login: Sat Jun 27 07:23:35 2020 from 121-200-5-117.79c805.syd.nbn.aussiebb.net

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 10 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-192-168-107-191 ~]$
[ec2-user@ip-192-168-107-191 ~]$

```

- Commands for accessing your private instance from public one

```
## ssh private instance from within the public ec2

[ec2-user@ip-192-168-107-191 ~]$
[ec2-user@ip-192-168-107-191 ~]$
[ec2-user@ip-192-168-107-191 ~]$ ssh ec2-user@192.168.10.10
Last login: Sat Jun 27 07:25:03 2020 from 192.168.107.191

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-192-168-10-10 ~]$
[ec2-user@ip-192-168-10-10 ~]$

```

- Commands for testing ping to `8.8.8.8` from private instance

```
[ec2-user@ip-192-168-10-10 ~]$
[ec2-user@ip-192-168-10-10 ~]$
[ec2-user@ip-192-168-10-10 ~]$ curl http://google.com
<HTML><HEAD><meta http-equiv="content-type" content="text/html;charset=utf-8">
<TITLE>301 Moved</TITLE></HEAD><BODY>
<H1>301 Moved</H1>
The document has moved
<A HREF="http://www.google.com/">here</A>.
</BODY></HTML>
[ec2-user@ip-192-168-10-10 ~]$
[ec2-user@ip-192-168-10-10 ~]$
[ec2-user@ip-192-168-10-10 ~]$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=107 time=1.45 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=107 time=1.12 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=107 time=1.19 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=107 time=1.18 ms
64 bytes from 8.8.8.8: icmp_seq=5 ttl=107 time=1.14 ms
64 bytes from 8.8.8.8: icmp_seq=6 ttl=107 time=1.20 ms
64 bytes from 8.8.8.8: icmp_seq=7 ttl=107 time=1.11 ms
^C
--- 8.8.8.8 ping statistics ---
7 packets transmitted, 7 received, 0% packet loss, time 6008ms
rtt min/avg/max/mdev = 1.119/1.203/1.457/0.116 ms
[ec2-user@ip-192-168-10-10 ~]$
[ec2-user@ip-192-168-10-10 ~]$
[ec2-user@ip-192-168-10-10 ~]$

```

- Any extra challenges faced?
```
Created a new NGW as I deleted the previous one :-)
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)