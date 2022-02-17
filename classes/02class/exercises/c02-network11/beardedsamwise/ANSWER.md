# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```
$ aws ec2 run-instances \
    --image-id ami-0a4e637babb7b0a86 \
    --instance-type t2.micro \
    --associate-public-ip-address \
    --key-name jumphost \
    --security-group-ids sg-03306f8d0577a09d5 \
    --subnet-id subnet-087f588f03b7ad0c1 \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=jumphost}]' 

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-0a4e637babb7b0a86",
            "InstanceId": "i-008a0528606f97635",
            "InstanceType": "t2.micro",
            "KeyName": "jumphost",
            "LaunchTime": "2022-02-17T00:14:27+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-10-0-0-166.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "10.0.0.166",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-087f588f03b7ad0c1",
            "VpcId": "vpc-09666fb121d6ae087",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "e5f2eb56-17ce-42ce-b99e-d716b8473956",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-02-17T00:14:27+00:00",
                        "AttachmentId": "eni-attach-0365dbd06256ad20f",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "public-sg",
                            "GroupId": "sg-03306f8d0577a09d5"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:41:ab:70:86:80",
                    "NetworkInterfaceId": "eni-0e9b67329dc7a8850",
                    "OwnerId": "639247960747",
                    "PrivateIpAddress": "10.0.0.166",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "10.0.0.166"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-087f588f03b7ad0c1",
                    "VpcId": "vpc-09666fb121d6ae087",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "public-sg",
                    "GroupId": "sg-03306f8d0577a09d5"
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
                    "Value": "jumphost"
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
    "OwnerId": "639247960747",
    "ReservationId": "r-035cacf60ed62027d"
}
```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```
$ aws ec2 run-instances \
    --image-id ami-0a4e637babb7b0a86 \
    --instance-type t2.micro \
    --key-name webserver \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=webserver}]' \
    --network-interfaces '[{"DeviceIndex":0,"NetworkInterfaceId":"eni-0fb129032f2492f72"}]'

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-0a4e637babb7b0a86",
            "InstanceId": "i-0790bb9bf66235bbf",
            "InstanceType": "t2.micro",
            "KeyName": "webserver",
            "LaunchTime": "2022-02-17T00:18:50+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-10-0-10-20.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "10.0.10.20",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0a05ed9c8336c5f07",
            "VpcId": "vpc-09666fb121d6ae087",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "748d5f2f-d07e-472d-8840-0703d445ffce",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-02-17T00:18:50+00:00",
                        "AttachmentId": "eni-attach-04a2ed54c7d5333a1",
                        "DeleteOnTermination": false,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "private-a-eni-01",
                    "Groups": [
                        {
                            "GroupId": "sg-0f83244d342a2c680"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:17:07:d4:fa:84",
                    "NetworkInterfaceId": "eni-0fb129032f2492f72",
                    "OwnerId": "639247960747",
                    "PrivateIpAddress": "10.0.10.20",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "10.0.10.20"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0a05ed9c8336c5f07",
                    "VpcId": "vpc-09666fb121d6ae087",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupId": "sg-0f83244d342a2c680"
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
                    "Value": "webserver"
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
    "OwnerId": "639247960747",
    "ReservationId": "r-07c5c3f65792b16f2"
}
```

- Commands for accessing your public instance using ssh

```
$ ssh -A ec2-user@3.26.47.76                                                                                                      ok | 11:23:17 am

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
3 package(s) needed for security, out of 6 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-10-0-0-166 ~]$
[ec2-user@ip-10-0-0-166 ~]$
```

- Commands for accessing your private instance from public one

```
[ec2-user@ip-10-0-0-166 ~]$ ssh ec2-user@10.0.10.20
The authenticity of host '10.0.10.20 (10.0.10.20)' can't be established.
ECDSA key fingerprint is SHA256:xOOp0noIr/KrRYWbCR2KU7w9scEnNZ3Qzqa6CVdoYYI.
ECDSA key fingerprint is MD5:3f:15:4e:72:42:b3:b5:c0:ed:0b:e7:4a:60:82:9f:a3.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '10.0.10.20' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
3 package(s) needed for security, out of 6 available
Run "sudo yum update" to apply all updates.
```

- Commands for testing ping to `8.8.8.8` from private instance

```
[ec2-user@ip-10-0-10-20 ~]$
[ec2-user@ip-10-0-10-20 ~]$
[ec2-user@ip-10-0-10-20 ~]$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=106 time=1.65 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=106 time=1.15 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=106 time=1.17 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=106 time=1.18 ms
^C
--- 8.8.8.8 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3004ms
rtt min/avg/max/mdev = 1.158/1.295/1.659/0.214 ms
[ec2-user@ip-10-0-10-20 ~]$
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)