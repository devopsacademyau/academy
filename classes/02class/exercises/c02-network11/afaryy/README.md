# c02-network11


## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```bash
# Set variables
AMI_ID=ami-088ff0e3bde7b3fdf;
KEY_PUBLIC_NAME=JupmBoxKeyForFirstEC2Instance;
KEY_PRIATE_NMAE=KeyForPrivateEC2Instance;
SUBNET_PUBLIC_A_ID=subnet-04709dce111382a62;
SUBNET_PRIVATE_A_ID=subnet-080d66f82c68fe96b;
SG_PUBLIC_ID=sg-03c842207ddde4f96;
SG_PRIVATE_ID=sg-08b73628e191c4bd8;
EC2_PUBLIC_NAME=da-c02-ec2-public1;
EC2_RPIVATE_NAME=da-c02-ec2-private1;
NI_ID=eni-0fa58587730752578

# Lauch an EC2 instance on public subnet with public SG attached
aws ec2 run-instances \
    --image-id $AMI_ID \
    --instance-type t2.micro \
    --key-name $KEY_PUBLIC_NAME \
    --subnet-id $SUBNET_PUBLIC_A_ID \
    --security-group-ids $SG_PUBLIC_ID \
    --associate-public-ip-address \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$EC2_PUBLIC_NAME}]"
# Output:

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-0127f8eb785574e58",
            "InstanceType": "t2.micro",
            "KeyName": "JupmBoxKeyForFirstEC2Instance",
            "LaunchTime": "2020-07-11T06:35:46+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-10-128-10-137.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "10.128.10.137",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-04709dce111382a62",
            "VpcId": "vpc-02ec2836691642ace",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "fc5ffdcc-fbdb-46b8-8aa0-e3920c8db5b3",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-07-11T06:35:46+00:00",
                        "AttachmentId": "eni-attach-01adf15036dd47d71",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "da-c02-public-sg",
                            "GroupId": "sg-03c842207ddde4f96"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:3f:71:5e:60:8a",
                    "NetworkInterfaceId": "eni-0ba33d2b27b343419",
                    "OwnerId": "421117346104",
                    "PrivateIpAddress": "10.128.10.137",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "10.128.10.137"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-04709dce111382a62",
                    "VpcId": "vpc-02ec2836691642ace",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "da-c02-public-sg",
                    "GroupId": "sg-03c842207ddde4f96"
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
                    "Value": "da-c02-ec2-public1"
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
                "HttpEndpoint": "enabled"
            }
        }
    ],
    "OwnerId": "421117346104",
    "ReservationId": "r-0106ba19377e4a0e9"
}

```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```bash
# In c02-network10, the network interface had been created with private subnet and security group attached to it
# To launch an EC2 instance on private subnet using custom ENI and private SG attached
aws ec2 run-instances \
    --image-id $AMI_ID \
    --instance-type t2.micro \
    --key-name $KEY_PRIATE_NMAE \
    --network-interfaces "[{\"NetworkInterfaceId\":\"$NI_ID\",\"DeviceIndex\":0}]"\
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$EC2_RPIVATE_NAME}]" 
# Output:
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-05e99fe3a95cd7ae3",
            "InstanceType": "t2.micro",
            "KeyName": "KeyForPrivateEC2Instance",
            "LaunchTime": "2020-07-11T06:37:16+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-10-128-20-10.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "10.128.20.10",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-080d66f82c68fe96b",
            "VpcId": "vpc-02ec2836691642ace",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "8fb9d600-e14c-4517-89d5-31a8753bf6b5",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-07-11T06:37:16+00:00",
                        "AttachmentId": "eni-attach-0ad0aad941fd3f4e2",
                        "DeleteOnTermination": false,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "DA C02N10 ENI",
                    "Groups": [
                        {
                            "GroupId": "sg-08b73628e191c4bd8"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:2f:67:a5:5a:c2",
                    "NetworkInterfaceId": "eni-0fa58587730752578",
                    "OwnerId": "421117346104",
                    "PrivateIpAddress": "10.128.20.10",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "10.128.20.10"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-080d66f82c68fe96b",
                    "VpcId": "vpc-02ec2836691642ace",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupId": "sg-08b73628e191c4bd8"
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
                    "Value": "da-c02-ec2-private1"
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
                "HttpEndpoint": "enabled"
            }
        }
    ],
    "OwnerId": "421117346104",
    "ReservationId": "r-0573d1c82ece7ea15"
}

```

- Commands for accessing your public instance using ssh

```bash
# Get the public IP of Public EC2 instance
aws ec2 describe-instances \
    --filter "Name=tag:Name,Values=$EC2_PUBLIC_NAME" \
    --query "Reservations[*].Instances[*].PublicIpAddress" --output text
# Output: 3.25.113.153
# This time, use PuTTy tools to ssh into EC2 instances as follows:
    # 1.Use PUTTY Key Generator to import .pem format key and save .ppk format private key; 
    # 2.use Pageant to add keys of two EC2 instance into the key lists;
    # 3.configure the connections for SSH in PuTTY(Host name or IP address ec2-user@3.25.113.153), click "SSH->Auth" option and check the Allow agent forwarding box and leave the Private key file for authentication field empty, then connect from the Public instance first.
Ref: https://www.youtube.com/watch?v=Mwf17O45IA0
# Output:
Using username "ec2-user".
Authenticating with public key "imported-openssh-key" from agent
Last login: Sat Jul 11 06:48:52 2020 from 110.144.1.179

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
13 package(s) needed for security, out of 22 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-10-128-10-137 ~]$
```

- Commands for accessing your private instance from public one
```bash
[ec2-user@ip-10-128-10-137 ~]$ ssh ec2-user@10.128.20.10
The authenticity of host '10.128.20.10 (10.128.20.10)' can't be established.
ECDSA key fingerprint is SHA256:FT0SpXzmYGrZSscML+E5YkF9Qmly1fRWgoCEMlHmYX0.
ECDSA key fingerprint is MD5:7a:c0:6d:c7:6d:99:fc:fb:83:35:28:84:93:2a:d4:06.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '10.128.20.10' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
13 package(s) needed for security, out of 22 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-10-128-20-10 ~]$

```

- Commands for testing ping to `8.8.8.8` from private instance

```bash
[ec2-user@ip-10-128-20-10 ~]$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=113 time=2.45 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=113 time=1.87 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=113 time=1.86 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=113 time=1.94 ms
64 bytes from 8.8.8.8: icmp_seq=5 ttl=113 time=1.85 ms
64 bytes from 8.8.8.8: icmp_seq=6 ttl=113 time=1.86 ms
^C
--- 8.8.8.8 ping statistics ---
16 packets transmitted, 16 received, 0% packet loss, time 15028ms
rtt min/avg/max/mdev = 1.836/1.906/2.451/0.155 ms

```


- Clean when needless
```
aws ec2 terminate-instances --instance-ids i-0127f8eb785574e58
aws ec2 terminate-instances --instance-ids i-05e99fe3a95cd7ae3

```

- Any extra challenges faced?

Ok.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)