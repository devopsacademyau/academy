# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```
$ aws ec2 run-instances --image-id ami-088ff0e3bde7b3fdf --count 1 --instance-type t2.micro --key-name Devopsacademy --security-group-ids sg-09bccdac9778bb908 --associate-public-ip-address --subnet-id subnet-04c9d82c36567dcc6
{
    "Instances": [
        {
            "Monitoring": {
                "State": "disabled"
            },
            "PublicDnsName": "",
            "StateReason": {
                "Message": "pending",
                "Code": "pending"
            },
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "EbsOptimized": false,
            "LaunchTime": "2020-07-03T10:20:36.000Z",
            "PrivateIpAddress": "172.16.53.6",
            "ProductCodes": [],
            "VpcId": "vpc-0351acfbc7aed9c1f",
            "CpuOptions": {
                "CoreCount": 1,
                "ThreadsPerCore": 1
            },
            "StateTransitionReason": "",
            "InstanceId": "i-0a5114a212eb3f0e3",
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "PrivateDnsName": "ip-172-16-53-6.ap-southeast-2.compute.internal",
            "KeyName": "Devopsacademy",
            "SecurityGroups": [
                {
                    "GroupName": "public-sg",
                    "GroupId": "sg-09bccdac9778bb908"
                }
            ],
            "ClientToken": "",
            "SubnetId": "subnet-04c9d82c36567dcc6",
            "InstanceType": "t2.micro",
            "NetworkInterfaces": [
                {
                    "Status": "in-use",
                    "MacAddress": "02:e5:bc:d3:c5:16",
                    "SourceDestCheck": true,
                    "VpcId": "vpc-0351acfbc7aed9c1f",
                    "Description": "",
                    "NetworkInterfaceId": "eni-027ebcf62505df8d9",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "172.16.53.6"
                        }
                    ],
                    "SubnetId": "subnet-04c9d82c36567dcc6",
                    "Attachment": {
                        "Status": "attaching",
                        "DeviceIndex": 0,
                        "DeleteOnTermination": true,
                        "AttachmentId": "eni-attach-01f7ee3d7d132c9c3",
                        "AttachTime": "2020-07-03T10:20:36.000Z"
                    },
                    "Groups": [
                        {
                            "GroupName": "public-sg",
                            "GroupId": "sg-09bccdac9778bb908"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "OwnerId": "348662207501",
                    "PrivateIpAddress": "172.16.53.6"
                }
            ],
            "SourceDestCheck": true,
            "Placement": {
                "Tenancy": "default",
                "GroupName": "",
                "AvailabilityZone": "ap-southeast-2a"
            },
            "Hypervisor": "xen",
            "BlockDeviceMappings": [],
            "Architecture": "x86_64",
            "RootDeviceType": "ebs",
            "RootDeviceName": "/dev/xvda",
            "VirtualizationType": "hvm",
            "AmiLaunchIndex": 0
        }
    ],
    "ReservationId": "r-0cd9570ccd310faeb",
    "Groups": [],
    "OwnerId": "348662207501"
}

```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```
$ aws ec2 run-instances --region ap-southeast-2 --image-id ami-088ff0e3bde7b3fdf --key-name Devopsacademy --instance-type t2.micro --instance-initiated-shutdown-behavior stop --network-interface '[{"DeviceIndex":0,"NetworkInterfaceId":"eni-0627bb821b8118e05"}]' --count 1                     {
    {
    "Instances": [
        {
            "Monitoring": {
                "State": "disabled"
            },
            "PublicDnsName": "",
            "StateReason": {
                "Message": "pending",
                "Code": "pending"
            },
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "EbsOptimized": false,
            "LaunchTime": "2020-07-03T10:43:38.000Z",
            "PrivateIpAddress": "172.16.0.8",
            "ProductCodes": [],
            "VpcId": "vpc-0351acfbc7aed9c1f",
            "CpuOptions": {
                "CoreCount": 1,
                "ThreadsPerCore": 1
            },
            "StateTransitionReason": "",
            "InstanceId": "i-036ad0533e7893bdb",
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "PrivateDnsName": "ip-172-16-0-8.ap-southeast-2.compute.internal",
            "KeyName": "Devopsacademy",
            "SecurityGroups": [
                {
                    "GroupId": "sg-0ceb8e72908d2449c"
                }
            ],
            "ClientToken": "",
            "SubnetId": "subnet-06cf55d01bbed75dc",
            "InstanceType": "t2.micro",
            "NetworkInterfaces": [
                {
                    "Status": "in-use",
                    "MacAddress": "02:3f:ff:00:ab:ce",
                    "SourceDestCheck": true,
                    "VpcId": "vpc-0351acfbc7aed9c1f",
                    "Description": "my ENI network",
                    "NetworkInterfaceId": "eni-0627bb821b8118e05",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "172.16.0.8"
                        }
                    ],
                    "SubnetId": "subnet-06cf55d01bbed75dc",
                    "Attachment": {
                        "Status": "attaching",
                        "DeviceIndex": 0,
                        "DeleteOnTermination": false,
                        "AttachmentId": "eni-attach-0aae2340921fbb56f",
                        "AttachTime": "2020-07-03T10:43:38.000Z"
                    },
                    "Groups": [
                        {
                            "GroupId": "sg-0ceb8e72908d2449c"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "OwnerId": "348662207501",
                    "PrivateIpAddress": "172.16.0.8"
                }
            ],
            "SourceDestCheck": true,
            "Placement": {
                "Tenancy": "default",
                "GroupName": "",
                "AvailabilityZone": "ap-southeast-2a"
            },
            "Hypervisor": "xen",
            "BlockDeviceMappings": [],
            "Architecture": "x86_64",
            "RootDeviceType": "ebs",
            "RootDeviceName": "/dev/xvda",
            "VirtualizationType": "hvm",
            "AmiLaunchIndex": 0
        }
    ],
    "ReservationId": "r-09d18fa745208d176",
    "Groups": [],
    "OwnerId": "348662207501"
}


```

- Commands for accessing your public instance using ssh

```
ssh -i "Devopsacademy.pem" ec2-user@54.206.104.198
The authenticity of host '54.206.104.198 (54.206.104.198)' can't be established.
ECDSA key fingerprint is SHA256:uyOkwWn+7SkQTh5a2xIE/zlOWudDfJrlnQ3aHkugzvg.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '54.206.104.198' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
13 package(s) needed for security, out of 22 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-16-53-6 ~]$
```

- Commands for accessing your private instance from public one

```
Received this error when im trying to ssh from public instance :

ssh -i "Devopsacademy.pem" ec2-user@172.16.0.8
Warning: Identity file Devopsacademy.pem not accessible: No such file or directory.
The authenticity of host '172.16.0.8 (172.16.0.8)' can't be established.
ECDSA key fingerprint is SHA256:lva9BSmO4DPNGWcw1mVfSg/z+rc6rCrmwtDYU2pXELM.
ECDSA key fingerprint is MD5:03:d0:46:e9:02:9c:b6:f5:48:57:f9:d3:e6:c5:dc:13.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '172.16.0.8' (ECDSA) to the list of known hosts.
Permission denied (publickey,gssapi-keyex,gssapi-with-mic).

So copied the pem file from my local desktop to the public server using SCP command and changed the file permerssion to 400 

scp -i "Devopsacademy.pem" Devopsacademy.pem ec2-user@54.206.104.198:/home/ec2-user/

and Executed the following command to connect to the Private Instance.

ssh -i "Devopsacademy.pem" ec2-user@172.16.0.8

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-172-16-0-8 ~]$


```

- Commands for testing ping to `8.8.8.8` from private instance

```
[ec2-user@ip-172-16-0-8 ~]$ ping -c  4 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=3 ttl=110 time=1.40 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=110 time=1.39 ms

--- 8.8.8.8 ping statistics ---
4 packets transmitted, 2 received, 50% packet loss, time 3040ms
rtt min/avg/max/mdev = 1.397/1.399/1.401/0.002 ms
```

- Any extra challenges faced?
 1. Accessing EC2 from public subnet : At Inbound , I have specified only my laptop ip which is a private network ip , So added Router ip(public) in the public SG inbound to connect the EC2. 


2 . test ping on 8.8.8.8 : I deleted the NAT and created a new one and updated the private route table to do the ping test. Also, noticed existing NAT gateway route entry was set to Blackhole. Removed that entry .

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)