# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```
tags=(--tag-specifications                                                                           
'ResourceType=instance,Tags=[
{Key=Name,Value=ccr-dojo-public-ec2}
]') && \
    aws ec2 run-instances \
    --image-id ami-042c4533fa25c105a \
    --instance-type t2.micro \
    --subnet-id subnet-0b2f8b5bb39b96759 \
    --security-group-ids sg-03e715b77dc425518 \
    --associate-public-ip-address \
    --key-name conorcr-kp \
     "${tags[@]}" | tee /dev/tty

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-042c4533fa25c105a",
            "InstanceId": "i-00d8782178c32866c",
            "InstanceType": "t2.micro",
            "KeyName": "conorcr-kp",
            "LaunchTime": "2022-02-21T03:11:06+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-10-0-11-252.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "10.0.11.252",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0b2f8b5bb39b96759",
            "VpcId": "vpc-091f1866ec064400e",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "ae7699e6-1db5-416d-a788-3093fa4ce6e8",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-02-21T03:11:06+00:00",
                        "AttachmentId": "eni-attach-0fe05108a445324f8",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "ccr-dojo-public-sg",
                            "GroupId": "sg-03e715b77dc425518"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:95:97:16:0b:e0",
                    "NetworkInterfaceId": "eni-0c38f6093019d0a08",
                    "OwnerId": "152848913167",
                    "PrivateIpAddress": "10.0.11.252",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "10.0.11.252"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0b2f8b5bb39b96759",
                    "VpcId": "vpc-091f1866ec064400e",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "ccr-dojo-public-sg",
                    "GroupId": "sg-03e715b77dc425518"
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
    "ReservationId": "r-0b36207ac3ae8142c"
}
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-042c4533fa25c105a",
            "InstanceId": "i-00d8782178c32866c",
            "InstanceType": "t2.micro",
            "KeyName": "conorcr-kp",
            "LaunchTime": "2022-02-21T03:11:06+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-10-0-11-252.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "10.0.11.252",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0b2f8b5bb39b96759",
            "VpcId": "vpc-091f1866ec064400e",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "ae7699e6-1db5-416d-a788-3093fa4ce6e8",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-02-21T03:11:06+00:00",
                        "AttachmentId": "eni-attach-0fe05108a445324f8",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "ccr-dojo-public-sg",
                            "GroupId": "sg-03e715b77dc425518"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:95:97:16:0b:e0",
                    "NetworkInterfaceId": "eni-0c38f6093019d0a08",
                    "OwnerId": "152848913167",
                    "PrivateIpAddress": "10.0.11.252",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "10.0.11.252"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0b2f8b5bb39b96759",
                    "VpcId": "vpc-091f1866ec064400e",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "ccr-dojo-public-sg",
                    "GroupId": "sg-03e715b77dc425518"
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
    "ReservationId": "r-0b36207ac3ae8142c"
}
```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```
tags=(--tag-specifications                                                                           
'ResourceType=instance,Tags=[
{Key=Name,Value=ccr-dojo-private-ec2}
]') && \
    aws ec2 run-instances \
    --image-id ami-042c4533fa25c105a \
    --instance-type t2.micro \
    --network-interfaces '[ { "DeviceIndex": 0, "NetworkInterfaceId": "eni-0d07753ba6578fb2f" } ]' \
    --key-name conorcr-kp \
     "${tags[@]}" | tee /dev/tty
{

    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-042c4533fa25c105a",
            "InstanceId": "i-0df4f5cfee76cdaf1",
            "InstanceType": "t2.micro",
            "KeyName": "conorcr-kp",
            "LaunchTime": "2022-02-21T04:46:27+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-10-0-1-5.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "10.0.1.5",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0a728ec3b7e79f619",
            "VpcId": "vpc-091f1866ec064400e",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "436ca019-26e8-456c-bdcb-a5a2ebce15b3",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-02-21T04:46:27+00:00",
                        "AttachmentId": "eni-attach-0e7f752c686f7b5f0",
                        "DeleteOnTermination": false,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "my network interface",
                    "Groups": [
                        {
                            "GroupId": "sg-0b6b4303beb0693c3"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:97:8c:00:aa:9c",
                    "NetworkInterfaceId": "eni-0d07753ba6578fb2f",
                    "OwnerId": "152848913167",
                    "PrivateIpAddress": "10.0.1.5",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "10.0.1.5"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0a728ec3b7e79f619",
                    "VpcId": "vpc-091f1866ec064400e",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupId": "sg-0b6b4303beb0693c3"
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
                    "Value": "ccr-dojo-private-ec2"
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
    "OwnerId": "152848913167",
    "ReservationId": "r-00ef2c6f416548370"
}
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-042c4533fa25c105a",
            "InstanceId": "i-0df4f5cfee76cdaf1",
            "InstanceType": "t2.micro",
            "KeyName": "conorcr-kp",
            "LaunchTime": "2022-02-21T04:46:27+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-10-0-1-5.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "10.0.1.5",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0a728ec3b7e79f619",
            "VpcId": "vpc-091f1866ec064400e",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "436ca019-26e8-456c-bdcb-a5a2ebce15b3",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-02-21T04:46:27+00:00",
                        "AttachmentId": "eni-attach-0e7f752c686f7b5f0",
                        "DeleteOnTermination": false,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "my network interface",
                    "Groups": [
                        {
                            "GroupId": "sg-0b6b4303beb0693c3"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:97:8c:00:aa:9c",
                    "NetworkInterfaceId": "eni-0d07753ba6578fb2f",
                    "OwnerId": "152848913167",
                    "PrivateIpAddress": "10.0.1.5",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "10.0.1.5"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0a728ec3b7e79f619",
                    "VpcId": "vpc-091f1866ec064400e",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupId": "sg-0b6b4303beb0693c3"
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
                    "Value": "ccr-dojo-private-ec2"
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
    "OwnerId": "152848913167",
    "ReservationId": "r-00ef2c6f416548370"
}


```    
```    --subnet-id subnet-0a728ec3b7e79f619 \ "SubnetId": "subnet-0a728ec3b7e79f619" \ "AssociatePublicIpAddress": false \ "Groups": ["sg-0b6b4303beb0693c3"]
aws ec2 attach-network-interface \
    --network-interface-id eni-0d07753ba6578fb2f \
    --instance-id i-00b6265c552a58ae6 \
    --network-card-index 1 \
    --device-index 1

```

- Commands for accessing your public instance using ssh

```
ssh -J ec2-user@ec2-3-26-190-126.ap-southeast-2.compute.amazonaws.com ec2-user@10.0.1.5
```
```   
The authenticity of host 'ec2-3-26-190-126.ap-southeast-2.compute.amazonaws.com (3.26.190.126)' can't be established.
ED25519 key fingerprint is SHA256:bRFPa1Qa3psqWalVKUBUOPSzAAySjMFWNjeBMXwyVKQ.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'ec2-3-26-190-126.ap-southeast-2.compute.amazonaws.com' (ED25519) to the list of known hosts.
The authenticity of host '10.0.1.5 (<no hostip for proxy command>)' can't be established.
ED25519 key fingerprint is SHA256:IfcSeHY6uhbU0hbDilsd/YphI2PnDNeUdtv1pzLBP/0.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '10.0.1.5' (ED25519) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
3 package(s) needed for security, out of 6 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-10-0-1-5 ~]$ 
```

- Commands for accessing your private instance from public one

```
As above
```

- Commands for testing ping to `8.8.8.8` from private instance

```
[ec2-user@ip-10-0-1-5 ~]$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=109 time=1.49 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=109 time=1.14 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=109 time=1.16 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=109 time=1.17 ms
64 bytes from 8.8.8.8: icmp_seq=5 ttl=109 time=1.15 ms
^C
--- 8.8.8.8 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4005ms
rtt min/avg/max/mdev = 1.146/1.226/1.494/0.141 ms
[ec2-user@ip-10-0-1-5 ~]$ 
```

- Any extra challenges faced?

```
It was annoying trying to associate the eni to the private instance in the launch command, took many tries to get the syntax correct with the --network-interfaces option. 
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)