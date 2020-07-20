# c01-aws01

- Use the CLI to create a new EC2 Instance inside the default VPC with a public IP address and connect to it through SSH.

```bash
#Create key pair
$ aws ec2 create-key-pair --key-name AlbertoKeyPair --query "KeyMaterial" --output text > AlbertoKeyPair.pem

#Check key pair created
$ aws ec2 describe-key-pairs --key-name AlbertoKeyPair
{
    "KeyPairs": [
        {
            "KeyPairId": "key-0d57f9f62901bd97c",
            "KeyFingerprint": "86:4c:fb:df:1a:53:6b:ae:a5:80:bf:e5:8b:05:13:da:75:85:85:ae",
            "KeyName": "AlbertoKeyPair",
            "Tags": []
        }
    ]
}

#Create security group for first EC2
$ aws ec2 create-security-group --group-name SG-PUBLIC --description "SG-PUBLIC for first EC2"
{
    "GroupId": "sg-0db7b9ef1a468cd10"
}

#Enable SSH for security group
$ aws ec2 authorize-security-group-ingress --group-id sg-0db7b9ef1a468cd10 --protocol tcp --port 22 --cidr 0.0.0.0/0 --region ap-southeast-2

#Create EC2 1 (subnet-id has got through aws console)
$ aws ec2 run-instances --image-id ami-04fcc97b5f6edcd89 --instance-type t2.micro --count 1  --security-group-ids sg-0db7b9ef1a468cd10 --subnet-id subnet-701e7c28 --region ap-southeast-2 --associate-public-ip-address --key-name AlbertoKeyPair
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-04fcc97b5f6edcd89",
            "InstanceId": "i-0516010a71de48f5d",
            "InstanceType": "t2.micro",
            "KeyName": "AlbertoKeyPair",
            "LaunchTime": "2020-07-18T06:21:27+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2c",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-19-236.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.19.236",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-701e7c28",
            "VpcId": "vpc-c6aba3a1",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "2746b8b2-6b8d-4b15-b38e-15658f2348cb",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-07-18T06:21:27+00:00",
                        "AttachmentId": "eni-attach-076eec64cd138c27d",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "SG-PUBLIC",
                            "GroupId": "sg-0db7b9ef1a468cd10"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "0a:84:65:aa:00:56",
                    "NetworkInterfaceId": "eni-0ef0817436a4ac61e",
                    "OwnerId": "059642851259",
                    "PrivateDnsName": "ip-172-31-19-236.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.19.236",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-19-236.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.19.236"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-701e7c28",
                    "VpcId": "vpc-c6aba3a1",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/sda1",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "SG-PUBLIC",
                    "GroupId": "sg-0db7b9ef1a468cd10"
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
    "OwnerId": "059642851259",
    "ReservationId": "r-0119ff3890b14d90a"
}

# Change the permission for AlbertoKeyPair.pem
$ chmod 400 AlbertoKeyPair.pem

#Access the EC2 instance via ssh (checked the public IP on AWS console)
$ ssh -i AlbertoKeyPair.pem ubuntu@13.54.171.156

Welcome to Ubuntu 18.04.4 LTS (GNU/Linux 4.15.0-1065-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Sat Jul 18 06:27:45 UTC 2020

  System load:  0.02              Processes:           88
  Usage of /:   13.9% of 7.69GB   Users logged in:     0
  Memory usage: 18%               IP address for eth0: 172.31.19.236
  Swap usage:   0%

 * Canonical Livepatch is available for installation.
   - Reduce system reboots and improve kernel security. Activate at:
     https://ubuntu.com/livepatch

0 packages can be updated.
0 updates are security updates.



The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@ip-172-31-19-236:~$
```

- Create another EC2, also using the CLI instance in the same VPC but with private address only and connect to it.

```bash
#Create security group for second EC2
$ aws ec2 create-security-group --group-name SG-PRIVATE --description "SG-PRIVATE for second EC2"
{
    "GroupId": "sg-04a8651999ca43673"
}

#Enable SSH for security group
$ aws ec2 authorize-security-group-ingress --group-id sg-04a8651999ca43673 --protocol tcp --port 22 --cidr 0.0.0.0/0 --region ap-southeast-2

#Create EC2 2 (subnet-id has got through aws console)
$ aws ec2 run-instances --image-id ami-04fcc97b5f6edcd89 --instance-type t2.micro --count 1  --security-group-ids sg-04a8651999ca43673 --subnet-id subnet-701e7c28 --region ap-southeast-2 --no-associate-public-ip-address --key-name AlbertoKeyPair
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-04fcc97b5f6edcd89",
            "InstanceId": "i-083e5e28467466ff3",
            "InstanceType": "t2.micro",
            "KeyName": "AlbertoKeyPair",
            "LaunchTime": "2020-07-18T06:47:48+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2c",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-19-49.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.19.49",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-701e7c28",
            "VpcId": "vpc-c6aba3a1",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "fa4010fb-4e3e-46eb-86d2-d5e67e790dab",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-07-18T06:47:48+00:00",
                        "AttachmentId": "eni-attach-04b51dd6bca518956",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "SG-PRIVATE",
                            "GroupId": "sg-04a8651999ca43673"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "0a:24:09:a0:03:84",
                    "NetworkInterfaceId": "eni-090d94cc90eaaaa7b",
                    "OwnerId": "059642851259",
                    "PrivateDnsName": "ip-172-31-19-49.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.19.49",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-19-49.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.19.49"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-701e7c28",
                    "VpcId": "vpc-c6aba3a1",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/sda1",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "SG-PRIVATE",
                    "GroupId": "sg-04a8651999ca43673"
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
    "OwnerId": "059642851259",
    "ReservationId": "r-02e93754ee259de10"
}

#Add the key into SSH agent
$ ssh-add AlbertoKeyPair.pem
Could not open a connection to your authentication agent.

#Due to the error above, I had to run the following command then go ready to add my key
$ eval "$(ssh-agent)"
Agent pid 179

$ ssh-add AlbertoKeyPair.pem
Identity added: AlbertoKeyPair.pem (AlbertoKeyPair.pem)

#Access the first EC2 instance via ssh again aimed to connect to the second EC2 from there (-A parameter means enable forwarding of the authentication agent connection)
$ ssh -A ubuntu@13.54.171.156

#Finally, access the second EC2 instance through your private IP (172.31.19.49)
ubuntu@ip-172-31-19-236:~$ ssh ubuntu@172.31.19.49

Welcome to Ubuntu 18.04.4 LTS (GNU/Linux 4.15.0-1065-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Sat Jul 18 08:17:08 UTC 2020

  System load:  0.0               Processes:           86
  Usage of /:   13.7% of 7.69GB   Users logged in:     0
  Memory usage: 15%               IP address for eth0: 172.31.19.49
  Swap usage:   0%

0 packages can be updated.
0 updates are security updates.



The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@ip-172-31-19-49:~$
```