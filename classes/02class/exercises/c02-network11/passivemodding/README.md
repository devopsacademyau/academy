# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```yaml
# Create EC2 instance on public-a subnet and public securty group
aws ec2 run-instances \
--image-id ami-0c641f2290e9cd048 --instance-type t2.micro \
--key-name lj_c04_iac01 \
--subnet-id subnet-08face2dbefdaa808 \
--security-group-ids sg-0d1e969bd74611af7 \
--associate-public-ip-address

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-0c641f2290e9cd048",
            "InstanceId": "i-05a5e538801699ed7",
            "InstanceType": "t2.micro",
            "KeyName": "lj_c04_iac01",
            "LaunchTime": "2022-08-22T06:04:38.000Z",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-10-10-4-75.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "10.10.4.75",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-08face2dbefdaa808",
            "VpcId": "vpc-09b37d389cf1e7937",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "5a448b63-8d5e-4331-8ae7-6c85cf1bbece",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-08-22T06:04:38.000Z",
                        "AttachmentId": "eni-attach-0a29cb3a3251f40f9",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "public-sg",
                            "GroupId": "sg-0d1e969bd74611af7"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:2a:14:86:a0:aa",
                    "NetworkInterfaceId": "eni-08335cbbd6f4f850a",
                    "OwnerId": "152848913167",
                    "PrivateIpAddress": "10.10.4.75",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "10.10.4.75"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-08face2dbefdaa808",
                    "VpcId": "vpc-09b37d389cf1e7937",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "public-sg",
                    "GroupId": "sg-0d1e969bd74611af7"
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
    "OwnerId": "152848913167",
    "ReservationId": "r-0ac0dcd04b5d7cc54"
}
```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```yaml
# Using ENI from c02-network10 which already has the private sg sttached
aws ec2 run-instances \
  --image-id ami-0c641f2290e9cd048 --instance-type t2.micro \
  --key-name lj_c04_iac01 \
  --network-interfaces "[{\"NetworkInterfaceId\":\"eni-0fe58d4ec76fd4f2d\",\"DeviceIndex\":0}]"

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-0c641f2290e9cd048",
            "InstanceId": "i-0bb0c6d6bed17ee94",
            "InstanceType": "t2.micro",
            "KeyName": "lj_c04_iac01",
            "LaunchTime": "2022-08-22T06:08:47.000Z",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-10-10-1-20.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "10.10.1.20",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0bde38b7afdbd6944",
            "VpcId": "vpc-09b37d389cf1e7937",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "743e057a-a863-4263-ba0c-c7c3cecae70f",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-08-22T06:08:47.000Z",
                        "AttachmentId": "eni-attach-0c770d09261f751ea",
                        "DeleteOnTermination": false,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupId": "sg-02b2fcad404a76fc9"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:ad:aa:88:45:d6",
                    "NetworkInterfaceId": "eni-0fe58d4ec76fd4f2d",
                    "OwnerId": "152848913167",
                    "PrivateIpAddress": "10.10.1.20",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "10.10.1.20"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0bde38b7afdbd6944",
                    "VpcId": "vpc-09b37d389cf1e7937",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupId": "sg-02b2fcad404a76fc9"
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
    "OwnerId": "152848913167",
    "ReservationId": "r-0046d716c12d994ac"
}
```

- Commands for accessing your public instance using ssh

```yaml
# get public ip of instance
aws ec2 describe-instances

# using ssh client with the .ppk key used during creation
IP: 3.27.38.75
Port: 22
Username: ec2-user
Key: lj_c04_iac01.ppk


       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
5 package(s) needed for security, out of 17 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-10-10-4-75 ~]$
```

- Commands for accessing your private instance from public one

```yaml
# after connecting to public instance, ftp pem file to home directory on public instance
[ec2-user@ip-10-10-4-75 ~]$ chmod 400 lj_c04_iac01.pem
[ec2-user@ip-10-10-4-75 ~]$ ssh -i "lj_c04_iac01.pem" ec2-user@10.10.1.20

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
5 package(s) needed for security, out of 17 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-10-10-1-20 ~]$
```

- Commands for testing ping to `8.8.8.8` from private instance

```yaml
[ec2-user@ip-10-10-1-20 ~]$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=110 time=1.59 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=110 time=1.38 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=110 time=1.13 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=110 time=1.06 ms
64 bytes from 8.8.8.8: icmp_seq=5 ttl=110 time=1.10 ms
64 bytes from 8.8.8.8: icmp_seq=6 ttl=110 time=1.07 ms
64 bytes from 8.8.8.8: icmp_seq=7 ttl=110 time=1.13 ms
64 bytes from 8.8.8.8: icmp_seq=8 ttl=110 time=1.14 ms
^C
--- 8.8.8.8 ping statistics ---
8 packets transmitted, 8 received, 0% packet loss, time 7009ms
rtt min/avg/max/mdev = 1.063/1.204/1.595/0.178 ms
[ec2-user@ip-10-10-1-20 ~]$
```

- Any extra challenges faced?

Forgot to specify the pem file initially when connecting to private instance, leading to permission denied


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)