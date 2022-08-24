# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```
aws ec2 run-instances \
--image-id ami-02538f8925e3aa27a \
--instance-type t2.micro \
--subnet-id subnet-005acc9c005fd6a97 \
--associate-public-ip-address \
--key-name james-contino-nvirginia \
--security-group-ids sg-033f7c661e95f132f \
--region us-east-1

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-02538f8925e3aa27a",
            "InstanceId": "i-0d7e04332eb80a002",
            "InstanceType": "t2.micro",
            "KeyName": "james-contino-nvirginia",
            "LaunchTime": "2022-08-24T21:37:47+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "us-east-1a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-10-88-1-13.ec2.internal",
            "PrivateIpAddress": "10.88.1.13",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-005acc9c005fd6a97",
            "VpcId": "vpc-0d8edf6a0d1104524",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "dc9b263e-909a-4463-8363-98872c523ed4",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-08-24T21:37:47+00:00",
                        "AttachmentId": "eni-attach-0c929d6fcb2f68031",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "public-sg-c02-network09",
                            "GroupId": "sg-033f7c661e95f132f"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "0a:21:16:5f:1c:9f",
                    "NetworkInterfaceId": "eni-0ffcbc16a3f8c0353",
                    "OwnerId": "152848913167",
                    "PrivateIpAddress": "10.88.1.13",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "10.88.1.13"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-005acc9c005fd6a97",
                    "VpcId": "vpc-0d8edf6a0d1104524",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "public-sg-c02-network09",
                    "GroupId": "sg-033f7c661e95f132f"
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
    "ReservationId": "r-0ce57db98c4792dcb"
}
```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```
aws ec2 run-instances \
--image-id ami-02538f8925e3aa27a \
--instance-type t2.micro \
--subnet-id subnet-04b06cb9a346fc451 \
--no-associate-public-ip-address \
--key-name james-contino-nvirginia \
--security-group-ids sg-09cf1a972fd9e5253 \
--region us-east-1

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-02538f8925e3aa27a",
            "InstanceId": "i-04dced2cfc9961ecd",
            "InstanceType": "t2.micro",
            "KeyName": "james-contino-nvirginia",
            "LaunchTime": "2022-08-24T21:48:14+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "us-east-1a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-10-88-11-148.ec2.internal",
            "PrivateIpAddress": "10.88.11.148",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-04b06cb9a346fc451",
            "VpcId": "vpc-0d8edf6a0d1104524",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "438e97d4-4e3b-4f49-ae16-0cc9facfade4",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-08-24T21:48:14+00:00",
                        "AttachmentId": "eni-attach-059db57f65d76e8b5",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "private-sg-c02-network09",
                            "GroupId": "sg-09cf1a972fd9e5253"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "0a:50:8c:59:84:1b",
                    "NetworkInterfaceId": "eni-08c0961c0d0fb15a9",
                    "OwnerId": "152848913167",
                    "PrivateIpAddress": "10.88.11.148",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "10.88.11.148"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-04b06cb9a346fc451",
                    "VpcId": "vpc-0d8edf6a0d1104524",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "private-sg-c02-network09",
                    "GroupId": "sg-09cf1a972fd9e5253"
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
    "ReservationId": "r-0b6c11fbb03227e27"
}

aws ec2 attach-network-interface \
--network-interface-id eni-07e06a7767b225a58 \
--instance-id i-04dced2cfc9961ecd \
--device-index 1 \
--region us-east-1

{
    "AttachmentId": "eni-attach-0cab521e7805fe46d"
}
```

- Commands for accessing your public instance using ssh

```
$ ssh ec2-user@54.163.19.67
The authenticity of host '54.163.19.67 (54.163.19.67)' can't be established.
ED25519 key fingerprint is SHA256:duYfXunCRvl2rYMMCZ98eJ/2zTB5x/DxpwLDgEhiXqU.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '54.163.19.67' (ED25519) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
3 package(s) needed for security, out of 7 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-10-88-1-13 ~]$ 
```

- Commands for accessing your private instance from public one

```
[ec2-user@ip-10-88-1-13 ~]$ ssh ec2-user@10.88.11.9
The authenticity of host '10.88.11.9 (10.88.11.9)' can't be established.
ECDSA key fingerprint is SHA256:V62Fxifb4evqz8EvPPRZHM84HqIoGpmARyd96dApfgw.
ECDSA key fingerprint is MD5:d2:79:89:62:02:3f:67:aa:c0:cc:b7:c4:97:94:bd:8f.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '10.88.11.9' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
3 package(s) needed for security, out of 7 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-10-88-11-148 ~]$
```

- Commands for testing ping to `8.8.8.8` from private instance

```
[ec2-user@ip-10-88-11-148 ~]$ ping -c 4 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=49 time=1.66 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=49 time=0.849 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=49 time=0.930 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=49 time=0.996 ms

--- 8.8.8.8 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3031ms
rtt min/avg/max/mdev = 0.849/1.109/1.662/0.324 ms
[ec2-user@ip-10-88-11-148 ~]$
```

- Any extra challenges faced?
I need to use another region (in this example is `us-east-1`) because `ap-southeast-2` has been reached the number of VPC limit already.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)