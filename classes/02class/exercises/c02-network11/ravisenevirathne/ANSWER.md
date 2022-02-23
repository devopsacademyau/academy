# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```
    aws ec2 run-instances \
    --image-id ami-0a4e637babb7b0a86 \
    --instance-type t2.micro \
    --associate-public-ip-address \
    --key-name ravisenevirathne \
    --security-group-ids sg-02968252763c487c5 \
    --subnet-id subnet-0518abea8303fc4cb \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=EC2-Public-RS}]'

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-0a4e637babb7b0a86",
            "InstanceId": "i-0ed56e39ca6ce6739",
            "InstanceType": "t2.micro",
            "KeyName": "ravisenevirathne",
            "LaunchTime": "2022-02-23T05:21:17+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-10-10-11-36.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "10.10.11.36",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0518abea8303fc4cb",
            "VpcId": "vpc-09b37d389cf1e7937",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "114707a9-e059-42ae-8d16-bac5a3c50ec0",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-02-23T05:21:17+00:00",
                        "AttachmentId": "eni-attach-0ed358f1059e48186",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "public-sg-ravi",
                            "GroupId": "sg-02968252763c487c5"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:28:e1:97:2d:de",
                    "NetworkInterfaceId": "eni-0517a023d2318dea2",
                    "OwnerId": "152848913167",
                    "PrivateIpAddress": "10.10.11.36",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "10.10.11.36"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0518abea8303fc4cb",
                    "VpcId": "vpc-09b37d389cf1e7937",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "public-sg-ravi",
                    "GroupId": "sg-02968252763c487c5"
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
                    "Value": "EC2-Public-RS"
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
    "ReservationId": "r-031568d62b1c586d4"
}

```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```
 aws ec2 run-instances \
    --image-id ami-0a4e637babb7b0a86 \
    --instance-type t2.micro \
    --key-name ravisenevirathne \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=EC2-Private-RS}]' \
    --network-interfaces '[{"DeviceIndex":0,"NetworkInterfaceId":"eni-0e06a9b5f9573b9d5"}]'

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-0a4e637babb7b0a86",
            "InstanceId": "i-0e7ef1e0ab0ada27a",
            "InstanceType": "t2.micro",
            "KeyName": "ravisenevirathne",
            "LaunchTime": "2022-02-23T05:23:35+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-10-10-1-10.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "10.10.1.10",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0bdd0e96fc5faab89",
            "VpcId": "vpc-09b37d389cf1e7937",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "5bd57d2d-1c8c-4acf-806c-d7f3dd8d7166",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-02-23T05:23:35+00:00",
                        "AttachmentId": "eni-attach-0fb50e745a7765378",
                        "DeleteOnTermination": false,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "Elastic network interface",
                    "Groups": [
                        {
                            "GroupId": "sg-02e108749814f1c16"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:26:16:07:31:e0",
                    "NetworkInterfaceId": "eni-0e06a9b5f9573b9d5",
                    "OwnerId": "152848913167",
                    "PrivateIpAddress": "10.10.1.10",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "10.10.1.10"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0bdd0e96fc5faab89",
                    "VpcId": "vpc-09b37d389cf1e7937",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupId": "sg-02e108749814f1c16"
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
                    "Value": "EC2-Private-RS"
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
    "ReservationId": "r-0211f84767d6623f7"
}
```

- Commands for accessing your public instance using ssh

```
ravi.senevirathne@contino.io@Ravis-MacBook-Pro exercises % ssh ec2-user@13.239.83.210
Last login: Wed Feb 23 05:24:55 2022 from 72.246-26-211.dyn.dsl.vic.iprimus.net.au

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
8 package(s) needed for security, out of 14 available
Run "sudo yum update" to apply all updates.
```

- Commands for accessing your private instance from public one

```
[ec2-user@ip-10-10-11-36 ~]$ ssh ec2-user@10.10.1.10
Last login: Wed Feb 23 05:26:59 2022 from 10.10.11.36

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
8 package(s) needed for security, out of 14 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-10-10-1-10 ~]$ 
```

- Commands for testing ping to `8.8.8.8` from private instance

```
[ec2-user@ip-10-10-1-10 ~]$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=109 time=2.47 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=109 time=1.70 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=109 time=1.99 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=109 time=3.21 ms
64 bytes from 8.8.8.8: icmp_seq=5 ttl=109 time=1.65 ms
64 bytes from 8.8.8.8: icmp_seq=6 ttl=109 time=1.74 ms
64 bytes from 8.8.8.8: icmp_seq=7 ttl=109 time=1.65 ms
64 bytes from 8.8.8.8: icmp_seq=8 ttl=109 time=1.65 ms
64 bytes from 8.8.8.8: icmp_seq=9 ttl=109 time=7.55 ms
64 bytes from 8.8.8.8: icmp_seq=10 ttl=109 time=1.78 ms
^C
--- 8.8.8.8 ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 9014ms
rtt min/avg/max/mdev = 1.653/2.544/7.554/1.736 ms
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)