# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```
> aws ec2 run-instances --image-id ami-03686c686b463366b --count 1 --instance-type t1.micro --key-name EC2KeyPair --security-group-ids sg-086cc2f38056a639a --associate-public-ip-address --subnet-id  subnet-0ff0ad4440d0df64

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-03686c686b463366b",
            "InstanceId": "i-0cf94d9693680feb2",
            "InstanceType": "t1.micro",
            "KeyName": "EC2KeyPair",
            "LaunchTime": "2020-07-08T10:18:21+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-10-0-101-142.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "10.0.101.142",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0ff0ad4440d0df64e",
            "VpcId": "vpc-076a05ec0f3be4895",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "ef73f3aa-e7bc-4c0b-bd4d-d88a231dbfaa",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-07-08T10:18:21+00:00",
                        "AttachmentId": "eni-attach-0c20564067a429be0",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "public-sg",
                            "GroupId": "sg-086cc2f38056a639a"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "02:1a:3b:94:be:52",
                    "NetworkInterfaceId": "eni-0dde43dad705f678e",
                    "OwnerId": "361529347535",
                    "PrivateIpAddress": "10.0.101.142",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "10.0.101.142"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0ff0ad4440d0df64e",
                    "VpcId": "vpc-076a05ec0f3be4895",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "public-sg",
                    "GroupId": "sg-086cc2f38056a639a"
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
    "OwnerId": "361529347535",
    "ReservationId": "r-0eca336fe54fc6408"
}

```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```
Create instance using networkinterface which has private sg attached

> aws ec2 run-instances  --image-id ami-03686c686b463366b --count 1 --instance-type t1.micro --key-name EC2KeyPair  --network-interfaces '[{"DeviceIndex":0,"NetworkInterfaceId":"eni-0cfef972aa7334b23"}]'

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-03686c686b463366b",
            "InstanceId": "i-0ffc63db3fbe0b31f",
            "InstanceType": "t1.micro",
            "KeyName": "EC2KeyPair",
            "LaunchTime": "2020-07-08T12:27:17+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-10-0-1-35.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "10.0.1.35",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0b93b57d95a2de8d4",
            "VpcId": "vpc-076a05ec0f3be4895",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "cf9ed48d-ed80-492a-a869-44969a78440a",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-07-08T12:27:17+00:00",
                        "AttachmentId": "eni-attach-0a02a43f35c7bfa0a",
                        "DeleteOnTermination": false,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupId": "sg-01ae6489e38ada216"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "02:d5:a2:57:5b:f2",
                    "NetworkInterfaceId": "eni-0cfef972aa7334b23",
                    "OwnerId": "361529347535",
                    "PrivateIpAddress": "10.0.1.35",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "10.0.1.35"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0b93b57d95a2de8d4",
                    "VpcId": "vpc-076a05ec0f3be4895",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupId": "sg-01ae6489e38ada216"
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
    "OwnerId": "361529347535",
    "ReservationId": "r-0214851bda9d8971e"
}

```

- Commands for accessing your public instance using ssh

```
Find out the public ip address 
aws ec2 describe-instances --instance-ids i-0cf94d9693680feb2 --query 'Reservations[*].Instances[*].PublicIpAddress' --output text
    3.24.242.177

Connect to public instance using key from home network
> ssh -i "EC2KeyPair.pem" ec2-user@3.24.242.177

Last login: Wed Jul  8 12:40:26 2020 from 89.95.96.58.static.exetel.com.au

       __|  __|_  )
       _|  (     /   Amazon Linux AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-ami/2018.03-release-notes/
6 package(s) needed for security, out of 10 available
Run "sudo yum update" to apply all updates.

```

- Commands for accessing your private instance from public one

Add Key ssh agent
sudo ssh-add -k EC2KeyPair.pem

Connect to public instance using ssh forward
> ssh -A ec2-user@3.24.242.177
Last login: Wed Jul  8 12:42:21 2020 from 89.95.96.58.static.exetel.com.au

       __|  __|_  )
       _|  (     /   Amazon Linux AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-ami/2018.03-release-notes/
6 package(s) needed for security, out of 10 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-10-0-101-142 ~]$ 


Connect to Private instance from public instance using ENI IP (10.0.1.35)
[ec2-user@ip-10-0-101-142 ~]$ ssh 10.0.1.35
The authenticity of host '10.0.1.35 (10.0.1.35)' can't be established.
ECDSA key fingerprint is SHA256:HWcpiqvqPENCbZ3dA2WqnitQPnO62R+mWlGq2GrQ0tk.
ECDSA key fingerprint is MD5:fe:b3:e5:fc:45:ca:d9:c1:3a:27:fe:0d:2f:4d:11:be.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '10.0.1.35' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-ami/2018.03-release-notes/
[ec2-user@ip-10-0-1-35 ~]$ 


- Commands for testing ping to `8.8.8.8` from private instance

```
[ec2-user@ip-10-0-1-35 ~]$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=108 time=2.45 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=108 time=1.29 ms
64 bytes from 8.8.8.8: icmp_seq=12 ttl=108 time=1.26 ms
```

- Any extra challenges faced?
```
I have faced below challenges
Finding out network inferface id sytanx.
Network interfaces and an instance security group cant be attached on the same request.I had to change the previous lab command to make changes in network interface creation command to pass security group.
I had to recreate NAT gateway again as i have deleted this before
````

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)