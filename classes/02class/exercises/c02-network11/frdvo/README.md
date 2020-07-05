# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```
$ aws ec2 run-instances --image-id resolve:ssm:/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --instance-type t2.micro --count 1 --key-name da --security-group-ids sg-074c76a5868b6d0a1 --subnet-id subnet-0dbb2205880974071 --associate-public-ip-address
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-0b3e3f7c5df12e8c8",
            "InstanceType": "t2.micro",
            "KeyName": "da",
            "LaunchTime": "2020-07-05T12:43:18.000Z",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2b",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-16-121-26.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.16.121.26",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0dbb2205880974071",
            "VpcId": "vpc-0a2b7db4956438d22",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "a55d7b9d-d3e8-48b0-a846-4ba1ed46df07",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-07-05T12:43:18.000Z",
                        "AttachmentId": "eni-attach-0cf09a2622c5557eb",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "public-sg",
                            "GroupId": "sg-074c76a5868b6d0a1"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:83:ae:bc:54:36",
                    "NetworkInterfaceId": "eni-0175d4bde3969c730",
                    "OwnerId": "165765640813",
                    "PrivateIpAddress": "172.16.121.26",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "172.16.121.26"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0dbb2205880974071",
                    "VpcId": "vpc-0a2b7db4956438d22",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "public-sg",
                    "GroupId": "sg-074c76a5868b6d0a1"
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
    "OwnerId": "165765640813",
    "ReservationId": "r-0dd24e4c8060cca42"
}
$ aws ec2 create-tags --resources i-0b3e3f7c5df12e8c8 --tags Key=Name,Value=DA-Public
```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```
$ aws ec2 run-instances --image-id resolve:ssm:/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --instance-type t2.micro --count 1 --key-name da --network-interfaces '[{"NetworkInterfaceId":"eni-06843a9d81d573a08","DeviceIndex":0}]'
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-0937e8c9e1c141c26",
            "InstanceType": "t2.micro",
            "KeyName": "da",
            "LaunchTime": "2020-07-05T12:48:18.000Z",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2b",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-16-20-100.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.16.20.100",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0b9349fa56d76afb7",
            "VpcId": "vpc-0a2b7db4956438d22",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "d72cca58-37fd-4db2-ba15-4f49f2f6944b",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-07-05T12:48:18.000Z",
                        "AttachmentId": "eni-attach-0bbfba694a006b1cb",
                        "DeleteOnTermination": false,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "DA ENI",
                    "Groups": [
                        {
                            "GroupId": "sg-0f13d66af24816cf5"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:fb:8e:85:a1:9e",
                    "NetworkInterfaceId": "eni-06843a9d81d573a08",
                    "OwnerId": "165765640813",
                    "PrivateIpAddress": "172.16.20.100",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "172.16.20.100"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0b9349fa56d76afb7",
                    "VpcId": "vpc-0a2b7db4956438d22",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupId": "sg-0f13d66af24816cf5"
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
    "OwnerId": "165765640813",
    "ReservationId": "r-04d0f648ea7d84298"
}
$ aws ec2 create-tags --resources i-0937e8c9e1c141c26 --tags Key=Name,Value=DA-Private
```

- Commands for accessing your public instance using ssh

```
$ aws ec2 describe-instances --instance-ids i-0b3e3f7c5df12e8c8 | grep -i publicipad
                    "PublicIpAddress": "3.25.96.243",
$ ssh -i ~/.ssh/da.pem -L 2022:172.16.20.100:22 ec2-user@3.25.96.243
ssh -i da.pem ec2-user@3.25.96.243
load pubkey "da.pem": invalid format

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
13 package(s) needed for security, out of 22 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-16-121-26 ~]$
```

- Commands for accessing your private instance from public one

```
ssh -i ~/.ssh/da.pem -p 2022 ec2-user@localhost
load pubkey "/home/fer/.ssh/da.pem": invalid format
The authenticity of host '[localhost]:2022 ([127.0.0.1]:2022)' can't be established.
ECDSA key fingerprint is SHA256:C3+MAjpLiRNsC/uJ/HKoTV0vLa/lt81onvMdf6VHaxU.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '[localhost]:2022' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
13 package(s) needed for security, out of 22 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-16-20-100 ~]$ping 8.8.8.8
```

- Commands for testing ping to `8.8.8.8` from private instance

```
$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=112 time=2.86 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=112 time=2.15 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=112 time=2.17 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=112 time=2.10 ms
64 bytes from 8.8.8.8: icmp_seq=5 ttl=112 time=2.26 ms
```

- Any extra challenges faced?
load pubkey "/home/fer/.ssh/da.pem": invalid format
I had to come back and fix issues with SGs.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)