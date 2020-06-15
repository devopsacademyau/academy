# C01-AWS01

## Commands Execution Output

- Commands to create the first EC2 instance and any additional resource required:
```
>>>Command to create a key-pair to ssh into the EC2 instance; [--query option and the --output text option to pipe your private key directly into a file with the .pem extension]

aws ec2 create-key-pair \
 --key-name C01-AWS01KeyPair\
 --query 'KeyMaterial'\
 --output text > C01-AWS01KeyPair.pem

>>>Command to Create a security group in your VPC, and add a rule that allows SSH access from anywhere.
aws ec2 create-security-group \
--group-name C01-AWS01SSHAccess \
--description "Security group for SSH access"

>The command returns:
{
    "GroupId": "sg-0619b1745d16f5cb6"
}

>>>Command to add a rule in that security group that allows SSH access from anywhere.
aws ec2 authorize-security-group-ingress \
--group-id sg-0619b1745d16f5cb6 \
--protocol tcp --port 22 --cidr 0.0.0.0/0

>>>Command to launch an instance into your public subnet, using the security group and key pair you've created.The ami id should be according to your region and by default, a public ip will be assigned to your instance. 
aws ec2 run-instances \
--image-id ami-088ff0e3bde7b3fdf --count 1 \
--instance-type t2.micro --key-name C01-AWS01KeyPair \
--security-group-ids sg-0619b1745d16f5cb6 

>It returns a long json with all your instance parameters:
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-05d7620963b672ca0",
            "InstanceType": "t2.micro",
            "KeyName": "C01-AWS01KeyPair",
            "LaunchTime": "2020-06-15T07:08:04+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2b",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-32-188.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.32.188",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-53b6a71a",
            "VpcId": "vpc-12497675",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "f869043e-ce58-4498-8d7c-c72b7543a94d",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-06-15T07:08:04+00:00",
                        "AttachmentId": "eni-attach-003de7577008cd0e7",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "C01-AWS01SSHAccess",
                            "GroupId": "sg-0619b1745d16f5cb6"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:da:4e:da:2d:14",
                    "NetworkInterfaceId": "eni-0b4a2b7706af6b9a8",
                    "OwnerId": "438549961569",
                    "PrivateDnsName": "ip-172-31-32-188.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.32.188",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-32-188.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.32.188"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-53b6a71a",
                    "VpcId": "vpc-12497675",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "C01-AWS01SSHAccess",
                    "GroupId": "sg-0619b1745d16f5cb6"
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
    "OwnerId": "438549961569",
    "ReservationId": "r-0f504e968c8d0a14f"
}{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-05d7620963b672ca0",
            "InstanceType": "t2.micro",
            "KeyName": "C01-AWS01KeyPair",
            "LaunchTime": "2020-06-15T07:08:04+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2b",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-32-188.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.32.188",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-53b6a71a",
            "VpcId": "vpc-12497675",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "f869043e-ce58-4498-8d7c-c72b7543a94d",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-06-15T07:08:04+00:00",
                        "AttachmentId": "eni-attach-003de7577008cd0e7",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "C01-AWS01SSHAccess",
                            "GroupId": "sg-0619b1745d16f5cb6"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:da:4e:da:2d:14",
                    "NetworkInterfaceId": "eni-0b4a2b7706af6b9a8",
                    "OwnerId": "438549961569",
                    "PrivateDnsName": "ip-172-31-32-188.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.32.188",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-32-188.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.32.188"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-53b6a71a",
                    "VpcId": "vpc-12497675",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "C01-AWS01SSHAccess",
                    "GroupId": "sg-0619b1745d16f5cb6"
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
    "OwnerId": "438549961569",
    "ReservationId": "r-0f504e968c8d0a14f"
}
```

- Commands to connect to the first EC2 instance:
```
>>>Command to describe your instances using the instance id returned in the above command
aws ec2 describe-instances \
--instance-id i-05d7620963b672ca0

>The json output shows instance in running state along with other parameters.
 "PublicIpAddress": "52.64.28.243",
                    "State": {
                        "Code": 16,
                        "Name": "running"

>>>Command to SSH into the instance with the public ip returned and the key pair you created.
ssh -i C01-AWS01KeyPair.pem ec2-user@52.64.28.243

Note: If it returns an error ec2-user@52.64.28.243: Permission denied (publickey,gssapi-keyex,gssapi-with-mic)., you need to provide permmissions to read your SSH key
chmod 400 C01-AWS01KeyPair.pem

Run SSH Command again to get into EC2 Instance successfully!!!!!!!!!!!

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 8 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-32-188 ~]$ uname -a
Linux ip-172-31-32-188.ap-southeast-2.compute.internal 4.14.177-139.254.amzn2.x86_64 #1 SMP Thu May 7 18:48:23 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
```

- Commands to create the second EC2 instance and any additional resource required:
```
>>>Command to launch a private instance[no-associate-public-ip-address] into your subnet, using the security group and key pair you've created.The ami id should be according to your region. 
Can use the same security group,key-pair or create new one .
aws ec2 run-instances \
--image-id ami-088ff0e3bde7b3fdf --count 1 \
--instance-type t2.micro --key-name C01-AWS01KeyPair \
--security-group-ids sg-0619b1745d16f5cb6
--no-associate-public-ip-address 

>It returns a json with instance parameters:
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-089b910f9af45f6b1",
            "InstanceType": "t2.micro",
            "KeyName": "C01-AWS01KeyPair",
            "LaunchTime": "2020-06-15T07:38:35+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2b",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-40-65.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.40.65",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-53b6a71a",
            "VpcId": "vpc-12497675",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "62bb88ee-1bd5-44c6-a3be-97ebf42c73f5",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-06-15T07:38:35+00:00",
                        "AttachmentId": "eni-attach-09320b3f48e4caab9",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "C01-AWS01SSHAccess",
                            "GroupId": "sg-0619b1745d16f5cb6"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:63:91:06:02:00",
                    "NetworkInterfaceId": "eni-0bc57b1cee3fa6cad",
                    "OwnerId": "438549961569",
                    "PrivateDnsName": "ip-172-31-40-65.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.40.65",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-40-65.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.40.65"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-53b6a71a",
                    "VpcId": "vpc-12497675",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "C01-AWS01SSHAccess",
                    "GroupId": "sg-0619b1745d16f5cb6"
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
    "OwnerId": "438549961569",
    "ReservationId": "r-0a7b30b9fd486a5e8"
}

Once the instance is in running state, proceed further

```

- Commands to connect to the second EC2 instance:
```
Since the instance does not have a public ip, it is not possible to connect directly via ssh. The only way is to connect to the public instance first, it verifies our credentials and then we SSH from there
>>>Command to start the ssh agent
eval $(ssh-agent -s)
>It returns:
Agent pid 517

>>>Command to add your keypair to the keychain application 
ssh-add C01-AWS01KeyPair.pem
>It returns:
Identity added: C01-AWS01KeyPair.pem (C01-AWS01KeyPair.pem)

>>>Command to enable[-A option] SSH agent forwarding and lets the local SSH agent respond to a public-key challenge when you use SSH to connect from the bastion to a target instance in your VPC.
ssh -A -i C01-AWS01KeyPair.pem ec2-user@52.64.28.243
>It opens the public ec2 bash
Last login: Mon Jun 15 07:22:26 2020 from 14-201-149-89.static.tpgi.com.au

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 8 available
Run "sudo yum update" to apply all updates.


>>>Command to ssh into private instance from the public instance
ssh ec2-user@172.31.40.65
>It returns

[ec2-user@ip-172-31-32-188 ~]$ ssh ec2-user@172.31.40.65
The authenticity of host '172.31.40.65 (172.31.40.65)' can't be established.
ECDSA key fingerprint is SHA256:lykH4MfvdeVk3CpfzP0b2VS5cHLeOlaPrDyxAdJnjF4.
ECDSA key fingerprint is MD5:65:52:65:c0:37:82:f3:20:f5:6a:9a:27:3f:ff:38:d0.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '172.31.40.65' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 8 available
Run "sudo yum update" to apply all updates.

Launched into private EC2 Instance successfully!!!!!!!!!!!

```

***
Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws01/README.md)
