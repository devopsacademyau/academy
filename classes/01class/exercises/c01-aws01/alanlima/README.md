# C01-AWS01

## Commands Execution Output

- Commands to create the first EC2 instance and any additional resource required:
```bash

# to connect to the linux instance via ssh, we need to have a keypair certificate
# let's create it ;)
$ aws ec2 create-key-pair \
    --key-name kp-devops-c01-aws \
    --query 'KeyMaterial' \
    --output text > kp-devops-c01-aws01.pem

# we will need to allocate a security group for our future brand new linux instance
$ aws ec2 create-security-group \
    --group-name devops-c01-aws01-sg \
    --description "Security Group for C01-AWS01"
    
    {
        "GroupId": "sg-048e97696bfacfb41"
    }

# the security group is too protective. That's FANTASTIC, but we need to talk with our somehow
# let's open the port 22 (SSH Protocol) so we can say `hi` to our linux instance
$ aws ec2 authorize-security-group-ingress \
    --group-id sg-048e97696bfacfb41 \
    --protocol tcp
    --port 22
    --cidr 0.0.0.0/0
    
# okey, all set !! let's create our VM, shall we?? 😁

$ aws ec2 run-instances \
--image-id ami-04fcc97b5f6edcd89 \
--count 1 \
--instance-type t2.micro \
--key-name kp-devops-c01-aws \
--security-group-ids sg-048e97696bfacfb41

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-04fcc97b5f6edcd89",
            "InstanceId": "i-04b2cc772c8ca4c36",
            "InstanceType": "t2.micro",
            "KeyName": "kp-devops-c01-aws",
            "LaunchTime": "2020-06-09T14:51:15+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-44-32.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.44.32",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-957b9bdd",
            "VpcId": "vpc-fc020c9b",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "1655fb69-237c-4f22-b176-34dfc97dc42b",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-06-09T14:51:15+00:00",
                        "AttachmentId": "eni-attach-068974630e0856509",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "devops-c01-aws01-sg",
                            "GroupId": "sg-048e97696bfacfb41"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:23:59:8f:00:48",
                    "NetworkInterfaceId": "eni-0b436f34e2e018de3",
                    "OwnerId": "097922957316",
                    "PrivateDnsName": "ip-172-31-44-32.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.44.32",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-44-32.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.44.32"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-957b9bdd",
                    "VpcId": "vpc-fc020c9b",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/sda1",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "devops-c01-aws01-sg",
                    "GroupId": "sg-048e97696bfacfb41"
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
    "OwnerId": "097922957316",
    "ReservationId": "r-045858dc0ae7d2429"
}


# WoW, I believe that this long text means what the VM was created.
# Let's talk with it to send some love.

```

- Commands to connect to the first EC2 instance:
```bash
# Hey, I can't find the public ip address to connect.
# Right, looks like that AWS did not assign the public ip just yet.
# Let's count till 3 and list the instances to check.... 1... 2.. 3..

$ aws ec2 describe-instances \
    --query "Reservations[].Instances[].[InstanceId, PublicIpAddress]" \
    --output text
i-04b2cc772c8ca4c36     54.206.74.41

# that's better, let's create a secure connection ;)

$ ssh -i kp-devops-c01-aws01.pem ubuntu@54.206.74.41
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@         WARNING: UNPROTECTED PRIVATE KEY FILE!          @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Permissions 0644 for 'kp-devops-c01-aws01.pem' are too open.
It is required that your private key files are NOT accessible by others.
This private key will be ignored.
Load key "kp-devops-c01-aws01.pem": bad permissions
ubuntu@54.206.74.41: Permission denied (publickey).

# Wow, that's rude. 
# Okey okey, let's give read only permission, and remove all other permission and try again.

$ chmod 400 kp-devops-c01-aws01.pem

$ ssh -i kp-devops-c01-aws01.pem ubuntu@54.206.74.41
Welcome to Ubuntu 18.04.4 LTS (GNU/Linux 4.15.0-1065-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Tue Jun  9 15:01:26 UTC 2020

  System load:  0.0               Processes:           86
  Usage of /:   13.7% of 7.69GB   Users logged in:     0
  Memory usage: 15%               IP address for eth0: 172.31.44.32
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

ubuntu@ip-172-31-44-32:~$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 18.04.4 LTS
Release:        18.04
Codename:       bionic
```

- Commands to create the second EC2 instance and any additional resource required:
```bash

# oky doki, let's create a second instance but with a special addon.
# no public ip address!! --no-associate-public-ip-address will do the trick.

$ aws ec2 run-instances \
    --image-id ami-04fcc97b5f6edcd89 \
    --count 1 \
    --instance-type t2.micro \
    --key-name kp-devops-c01-aws \
    --security-group-ids sg-048e97696bfacfb41 \
    --no-associate-public-ip-address
    
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-04fcc97b5f6edcd89",
            "InstanceId": "i-024cf9ca1cd926bec",
            "InstanceType": "t2.micro",
            "KeyName": "kp-devops-c01-aws",
            "LaunchTime": "2020-06-09T15:12:12+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-43-32.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.43.32",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-957b9bdd",
            "VpcId": "vpc-fc020c9b",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "1e7331fd-c128-4f14-8017-1f56e6024aa3",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-06-09T15:12:12+00:00",
                        "AttachmentId": "eni-attach-054197280a892fa93",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "devops-c01-aws01-sg",
                            "GroupId": "sg-048e97696bfacfb41"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:c4:29:0b:67:aa",
                    "NetworkInterfaceId": "eni-0fe78d3f36ae43236",
                    "OwnerId": "097922957316",
                    "PrivateDnsName": "ip-172-31-43-32.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.43.32",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-43-32.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.43.32"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-957b9bdd",
                    "VpcId": "vpc-fc020c9b",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/sda1",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "devops-c01-aws01-sg",
                    "GroupId": "sg-048e97696bfacfb41"
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
    "OwnerId": "097922957316",
    "ReservationId": "r-01debe23843febebc"
}

# WoW, another long text, we know what it means, we have our instance. Yupi 🚀
```

- Commands to connect to the second EC2 instance:
```bash
# Hey, smart buddy, if the second instance doesn't have Public IpAddress, how we are going to connect??
# Much to learn you still have, my young padawan... we are going to connect thought the first instance.

# We just need to do some work in our host first.
# The second instance have no idea who we are (I know that's rude).
# We need to forward our credentials to the first instance so it will be allowed to make a 
# call to the second instance. Let's do that.
# We need to ensure that our ssh-agent is started and add our certificate to it.
$ eval $(ssh-agent -s)
Agent pid 4888
$ ssh-add kp-devops-c01-aws01.pem
Identity added: kp-devops-c01-aws01.pem (kp-devops-c01-aws01.pem)

# Okey, now we should be able to connect. Just remember to -A to forward the certificate
$ ssh -A ubuntu@54.206.74.41
Welcome to Ubuntu 18.04.4 LTS (GNU/Linux 4.15.0-1065-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Tue Jun  9 15:36:55 UTC 2020

  System load:  0.32              Processes:           86
  Usage of /:   13.9% of 7.69GB   Users logged in:     0
  Memory usage: 15%               IP address for eth0: 172.31.44.32
  Swap usage:   0%


0 packages can be updated.
0 updates are security updates.


Last login: Tue Jun  9 15:24:11 2020 from 122.148.135.233
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@ip-172-31-44-32:~$ ssh ubuntu@172.31.43.32
Welcome to Ubuntu 18.04.4 LTS (GNU/Linux 4.15.0-1065-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Tue Jun  9 15:37:17 UTC 2020

  System load:  0.0               Processes:           86
  Usage of /:   13.9% of 7.69GB   Users logged in:     0
  Memory usage: 14%               IP address for eth0: 172.31.43.32
  Swap usage:   0%


0 packages can be updated.
0 updates are security updates.

Failed to connect to https://changelogs.ubuntu.com/meta-release-lts. Check your Internet connection or proxy settings


Last login: Tue Jun  9 15:24:39 2020 from 172.31.44.32
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@ip-172-31-43-32:~$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 18.04.4 LTS
Release:        18.04
Codename:       bionic

# job done, see you next time 🤗
```

***
Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws01/README.md)