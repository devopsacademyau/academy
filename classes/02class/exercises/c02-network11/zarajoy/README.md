# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```
z@bacon:~$ aws ec2 create-key-pair --key-name c02-net11 --query 'KeyMaterial' --output text > c02-net11.pem
z@bacon:~$ sudo chmod 400 c02-net11.pem 
[sudo] password for z: 
z@bacon:~$ aws ec2 describe-key-pairs --key-name c02-net11
{
    "KeyPairs": [
        {
            "KeyPairId": "key-09c97948248119bfb",
            "KeyFingerprint": "73:0e:9c:9f:61:9f:17:69:18:86:41:69:5f:ea:23:22:41:4c:b9:ef",
            "KeyName": "c02-net11",
            "Tags": []
        }
    ]
}
z@bacon:~$ aws ec2 create-tags --resource key-09c97948248119bfb --tags Key=Description,Value=KeyPairForC02Network11
z@bacon:~$ aws ec2 describe-key-pairs --key-name c02-net11
{
    "KeyPairs": [
        {
            "KeyPairId": "key-09c97948248119bfb",
            "KeyFingerprint": "73:0e:9c:9f:61:9f:17:69:18:86:41:69:5f:ea:23:22:41:4c:b9:ef",
            "KeyName": "c02-net11",
            "Tags": [
                {
                    "Key": "Description",
                    "Value": "KeyPairForC02Network11"
                }
            ]
        }
    ]
}
z@bacon:~$ 

#run instance with public security group (c02-network09) and public subnet (public-a)
z@bacon:~$ aws ec2 run-instances   --image-id ami-088ff0e3bde7b3fdf  --instance-type t2.micro   --key-name c02-net11  --subnet-id subnet-0907f22726c996fd5 --security-group-ids sg-02bf4e3d095f418fa --associate-public-ip-address 
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-0796246ab7f8315f5",
            "InstanceType": "t2.micro",
            "KeyName": "c02-net11",
            "LaunchTime": "2020-07-03T06:08:22.000Z",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-192-168-112-214.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "192.168.112.214",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0907f22726c996fd5",
            "VpcId": "vpc-09d2f2719d50d1f7f",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-07-03T06:08:22.000Z",
                        "AttachmentId": "eni-attach-08f44527d8bc08733",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "public-sg",
                            "GroupId": "sg-02bf4e3d095f418fa"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:59:6f:51:4a:44",
                    "NetworkInterfaceId": "eni-0d184ba295745a1df",
                    "OwnerId": "512742231244",
                    "PrivateIpAddress": "192.168.112.214",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "192.168.112.214"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0907f22726c996fd5",
                    "VpcId": "vpc-09d2f2719d50d1f7f",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "public-sg",
                    "GroupId": "sg-02bf4e3d095f418fa"
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
    "OwnerId": "512742231244",
    "ReservationId": "r-0244d78e65d8cb633"
}


```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```
#run instance with ENI (c02-network10 (linked to private-a and security group private-sg))
z@bacon:~$ aws ec2 run-instances --image-id ami-088ff0e3bde7b3fdf  --instance-type t2.micro   --key-name c02-net11  --network-interfaces '[{"DeviceIndex":0,"NetworkInterfaceId":"eni-0e958326f6f210b9c"}]' 
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-038c0ee3053446527",
            "InstanceType": "t2.micro",
            "KeyName": "c02-net11",
            "LaunchTime": "2020-07-03T06:14:50.000Z",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-192-168-13-37.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "192.168.13.37",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-07cd3a9c8c7c3634e",
            "VpcId": "vpc-09d2f2719d50d1f7f",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-07-03T06:14:50.000Z",
                        "AttachmentId": "eni-attach-05afdf0e71bbf1e13",
                        "DeleteOnTermination": false,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "DevopsAcademy Network Interface",
                    "Groups": [
                        {
                            "GroupId": "sg-0f9b7a15d80e0ad02"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:f7:01:3a:22:78",
                    "NetworkInterfaceId": "eni-0e958326f6f210b9c",
                    "OwnerId": "512742231244",
                    "PrivateIpAddress": "192.168.13.37",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "192.168.13.37"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-07cd3a9c8c7c3634e",
                    "VpcId": "vpc-09d2f2719d50d1f7f",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupId": "sg-0f9b7a15d80e0ad02"
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
    "OwnerId": "512742231244",
    "ReservationId": "r-02c7103737f7eeb6f"
}

```

- Commands for accessing your public instance using ssh

```
#get public ip
z@bacon:~$ aws ec2 describe-instances --instance-ids i-0796246ab7f8315f5
{
    "Reservations": [
        {
            "Groups": [],
            "Instances": [
                {
                    "AmiLaunchIndex": 0,
                    "ImageId": "ami-088ff0e3bde7b3fdf",
                    "InstanceId": "i-0796246ab7f8315f5",
                    "InstanceType": "t2.micro",
                    "KeyName": "c02-net11",
                    "LaunchTime": "2020-07-03T06:08:22.000Z",
                    "Monitoring": {
                        "State": "disabled"
                    },
                    "Placement": {
                        "AvailabilityZone": "ap-southeast-2a",
                        "GroupName": "",
                        "Tenancy": "default"
                    },
                    "PrivateDnsName": "ip-192-168-112-214.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "192.168.112.214",
                    "ProductCodes": [],
                    "PublicDnsName": "",
                    "PublicIpAddress": "13.210.214.32",
                    "State": {
                        "Code": 16,
                        "Name": "running"
                    },
                    "StateTransitionReason": "",
                    "SubnetId": "subnet-0907f22726c996fd5",
                    "VpcId": "vpc-09d2f2719d50d1f7f",
                    "Architecture": "x86_64",
                    "BlockDeviceMappings": [
                        {
                            "DeviceName": "/dev/xvda",
                            "Ebs": {
                                "AttachTime": "2020-07-03T06:08:24.000Z",
                                "DeleteOnTermination": true,
                                "Status": "attached",
                                "VolumeId": "vol-00b2785307932004f"
                            }
                        }
                    ],
                    "ClientToken": "",
                    "EbsOptimized": false,
                    "EnaSupport": true,
                    "Hypervisor": "xen",
                    "NetworkInterfaces": [
                        {
                            "Association": {
                                "IpOwnerId": "amazon",
                                "PublicDnsName": "",
                                "PublicIp": "13.210.214.32"
                            },
                            "Attachment": {
                                "AttachTime": "2020-07-03T06:08:22.000Z",
                                "AttachmentId": "eni-attach-08f44527d8bc08733",
                                "DeleteOnTermination": true,
                                "DeviceIndex": 0,
                                "Status": "attached"
                            },
                            "Description": "",
                            "Groups": [
                                {
                                    "GroupName": "public-sg",
                                    "GroupId": "sg-02bf4e3d095f418fa"
                                }
                            ],
                            "Ipv6Addresses": [],
                            "MacAddress": "06:59:6f:51:4a:44",
                            "NetworkInterfaceId": "eni-0d184ba295745a1df",
                            "OwnerId": "512742231244",
                            "PrivateIpAddress": "192.168.112.214",
                            "PrivateIpAddresses": [
                                {
                                    "Association": {
                                        "IpOwnerId": "amazon",
                                        "PublicDnsName": "",
                                        "PublicIp": "13.210.214.32"
                                    },
                                    "Primary": true,
                                    "PrivateIpAddress": "192.168.112.214"
                                }
                            ],
                            "SourceDestCheck": true,
                            "Status": "in-use",
                            "SubnetId": "subnet-0907f22726c996fd5",
                            "VpcId": "vpc-09d2f2719d50d1f7f",
                            "InterfaceType": "interface"
                        }
                    ],
                    "RootDeviceName": "/dev/xvda",
                    "RootDeviceType": "ebs",
                    "SecurityGroups": [
                        {
                            "GroupName": "public-sg",
                            "GroupId": "sg-02bf4e3d095f418fa"
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
                        "HttpEndpoint": "enabled"
                    }
                }
            ],
            "OwnerId": "512742231244",
            "ReservationId": "r-0244d78e65d8cb633"
        }
    ]
}
z@bacon:~$ ssh-add c02-net11.pem
Identity added: c02-net11.pem (c02-net11.pem)
z@bacon:~$ ssh -i c02-net11.pem ec2-user@13.210.214.32
The authenticity of host '13.210.214.32 (13.210.214.32)' can't be established.
ECDSA key fingerprint is SHA256:3t7IgSce9PAyw2hZ3lFkThfQ9MqMo5Sn+CNOz8yyPOc.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '13.210.214.32' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
13 package(s) needed for security, out of 22 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-192-168-112-214 ~]$ 


```

- Commands for accessing your private instance from public one

```
[ec2-user@ip-192-168-112-214 ~]$ ssh ec2-user@192.168.13.37

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
13 package(s) needed for security, out of 22 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-192-168-13-37 ~]$ 

```

- Commands for testing ping to `8.8.8.8` from private instance

```
[ec2-user@ip-192-168-13-37 ~]$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=107 time=2.66 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=107 time=2.44 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=107 time=2.39 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=107 time=2.44 ms
64 bytes from 8.8.8.8: icmp_seq=5 ttl=107 time=2.43 ms
64 bytes from 8.8.8.8: icmp_seq=6 ttl=107 time=2.43 ms
64 bytes from 8.8.8.8: icmp_seq=7 ttl=107 time=2.45 ms
64 bytes from 8.8.8.8: icmp_seq=8 ttl=107 time=2.44 ms
^C
--- 8.8.8.8 ping statistics ---
8 packets transmitted, 8 received, 0% packet loss, time 7011ms
rtt min/avg/max/mdev = 2.391/2.465/2.663/0.077 ms
[ec2-user@ip-192-168-13-37 ~]$ 

```

- Any extra challenges faced?

```
[ec2-user@ip-192-168-112-214 ~]$ ssh 192.168.13.37
Permission denied (publickey,gssapi-keyex,gssapi-with-mic).
```
kept getting the above until i changed it to 
```
[ec2-user@ip-192-168-112-214 ~]$ ssh ec2-user@192.168.13.37
```
I am not overly sure why...

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)