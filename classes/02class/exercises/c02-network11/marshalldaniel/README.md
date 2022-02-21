# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```
aws ec2 run-instances \
    --image-id ami-04fc979a55e14b094 \
    --instance-type t3.micro \
    --security-group-ids sg-0c4202b20e3c79654 \
    --subnet-id subnet-0e9f13962485ddfe9 \
    --associate-public-ip-address \
    --key-name marshalldaniel-singapore \
    --region ap-southeast-1
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-04fc979a55e14b094",
            "InstanceId": "i-0865edc01e0cc227b",
            "InstanceType": "t3.micro",
            "KeyName": "marshalldaniel-singapore",
            "LaunchTime": "2022-02-21T04:58:56+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-1a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-10-0-10-198.ap-southeast-1.compute.internal",
            "PrivateIpAddress": "10.0.10.198",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0e9f13962485ddfe9",
            "VpcId": "vpc-0a002c0e5a418e381",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "cb039671-0e9a-4aba-b3d9-f7abff0d4a5c",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-02-21T04:58:56+00:00",
                        "AttachmentId": "eni-attach-05bc2d88e837d9209",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "public-sg",
                            "GroupId": "sg-0c4202b20e3c79654"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "02:8e:41:28:9f:f0",
                    "NetworkInterfaceId": "eni-08b820229f43301f2",
                    "OwnerId": "152848913167",
                    "PrivateIpAddress": "10.0.10.198",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "10.0.10.198"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0e9f13962485ddfe9",
                    "VpcId": "vpc-0a002c0e5a418e381",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "public-sg",
                    "GroupId": "sg-0c4202b20e3c79654"
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
                "ThreadsPerCore": 2
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
    "ReservationId": "r-0df808e213e397ab4"
}
```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```
aws ec2 run-instances \
    --image-id ami-04fc979a55e14b094 \
    --instance-type t3.micro \
    --network-interfaces '[{"DeviceIndex":0,"NetworkInterfaceId":"eni-0e4c3eeca9fdd7907"}]' \
    --key-name marshalldaniel-singapore \
    --region ap-southeast-1
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-04fc979a55e14b094",
            "InstanceId": "i-04d4bf74922bb6366",
            "InstanceType": "t3.micro",
            "KeyName": "marshalldaniel-singapore",
            "LaunchTime": "2022-02-21T04:59:13+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-1a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-10-0-0-10.ap-southeast-1.compute.internal",
            "PrivateIpAddress": "10.0.0.10",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-014271f4eb5ba8d27",
            "VpcId": "vpc-0a002c0e5a418e381",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "4eefd617-55f1-4b7f-a605-6458cc61f27c",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-02-21T04:59:13+00:00",
                        "AttachmentId": "eni-attach-09ef4932f1102dab4",
                        "DeleteOnTermination": false,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupId": "sg-039156288d7a1dece"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "02:7c:89:a8:a7:e4",
                    "NetworkInterfaceId": "eni-0e4c3eeca9fdd7907",
                    "OwnerId": "152848913167",
                    "PrivateIpAddress": "10.0.0.10",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "10.0.0.10"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-014271f4eb5ba8d27",
                    "VpcId": "vpc-0a002c0e5a418e381",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupId": "sg-039156288d7a1dece"
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
                "ThreadsPerCore": 2
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
    "ReservationId": "r-04d92ebabf5b2ecf6"
}
```

- Commands for accessing your public instance using ssh

```
ssh -A ec2-user@18.141.56.189


       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
3 package(s) needed for security, out of 6 available
Run "sudo yum update" to apply all updates.
```

- Commands for accessing your private instance from public one

```
[ec2-user@ip-10-0-10-198 ~]$ ssh -A ec2-user@10.0.0.10
The authenticity of host '10.0.0.10 (10.0.0.10)' can't be established.
ECDSA key fingerprint is SHA256:zM1xTFr7OtDsLyOMLxKfaYrHA0Qhkik0iGKkeDGDE2k.
ECDSA key fingerprint is MD5:62:de:ad:2c:aa:99:d3:78:92:8d:61:1d:f0:27:0d:9f.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '10.0.0.10' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
3 package(s) needed for security, out of 6 available
Run "sudo yum update" to apply all updates.
```

- Commands for testing ping to `8.8.8.8` from private instance

```
[ec2-user@ip-10-0-0-10 ~]$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=51 time=1.77 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=51 time=1.38 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=51 time=1.37 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=51 time=1.37 ms
64 bytes from 8.8.8.8: icmp_seq=5 ttl=51 time=1.36 ms
64 bytes from 8.8.8.8: icmp_seq=6 ttl=51 time=1.44 ms
64 bytes from 8.8.8.8: icmp_seq=7 ttl=51 time=1.37 ms
^C
--- 8.8.8.8 ping statistics ---
7 packets transmitted, 7 received, 0% packet loss, time 6009ms
rtt min/avg/max/mdev = 1.361/1.440/1.772/0.145 ms
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)