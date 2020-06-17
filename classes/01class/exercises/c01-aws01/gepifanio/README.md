# C01-AWS01

## Commands Execution Output

- Setup Aws, added my private keys and used the command to set the CLI up.

```
aws configure

AWS Access Key ID [****************TBMQ]:
AWS Secret Access Key [****************W0Z2]:
Default region name [us-west-2]:
Default output format [json]:

1. aws ec2 create-key-pair --key-name MyKeyPair --query 'KeyMaterial' --output text > MyKeyPair.pem
1. chmod 400 MyKeyPair.pem
1. aws ec2 describe-key-pairs --key-name MyKeyPair

{
    "KeyPairs": [
        {
            "KeyPairId": "key-0e0c986ce96b9f55a",
            "KeyFingerprint": "92:50:9c:cf:23:a4:25:36:5c:05:a3:13:d6:e7:f5:2d:fa:88:8a:02",
            "KeyName": "MyKeyPair",
            "Tags": []
        }
    ]
}
```

- Had to fix the region to be able to create the security group with the correct vpc id

```
1. aws ec2 create-security-group --group-name my-sg --description "My security group" --vpc-id vpc-fc9fee84

{
    "GroupId": "sg-03e80096433013264"
}
```

- Commands to create the first EC2 instance and any additional resource required:

```
aws ec2 run-instances \
    --image-id ami-003634241a8fcdec0 \
    --instance-type t2.micro \
    --count 1 \
    --subnet-id subnet-2df43655 \
    --key-name MyKeyPair \
    --security-group-ids sg-03e80096433013264 \
    --associate-public-ip-address

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-003634241a8fcdec0",
            "InstanceId": "i-0bfad0697a93cdf94",
            "InstanceType": "t2.micro",
            "KeyName": "MyKeyPair",
            "LaunchTime": "2020-06-13T02:43:40+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "us-west-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-28-92.us-west-2.compute.internal",
            "PrivateIpAddress": "172.31.28.92",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-2df43655",
            "VpcId": "vpc-fc9fee84",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-06-13T02:43:40+00:00",
                        "AttachmentId": "eni-attach-0ee453105dbfa20cd",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "my-sg",
                            "GroupId": "sg-03e80096433013264"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "02:aa:89:c9:25:2a",
                    "NetworkInterfaceId": "eni-087cd78478697446f",
                    "OwnerId": "873547843801",
                    "PrivateDnsName": "ip-172-31-28-92.us-west-2.compute.internal",
                    "PrivateIpAddress": "172.31.28.92",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-28-92.us-west-2.compute.internal",
                            "PrivateIpAddress": "172.31.28.92"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-2df43655",
                    "VpcId": "vpc-fc9fee84",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/sda1",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "my-sg",
                    "GroupId": "sg-03e80096433013264"
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
    "OwnerId": "873547843801",
    "ReservationId": "r-0985febcc00c96cef"
}
```

- Commands to connect to the first EC2 instance:

```

1. aws ec2 authorize-security-group-ingress --group-id sg-03e80096433013264 --protocol tcp --port 22 --cidr 0.0.0.0/0

1. ssh -i "MyKeyPair.pem" ubuntu@ec2-54-184-101-243.us-west-2.compute.amazonaws.com

load pubkey "MyKeyPair.pem": invalid format
The authenticity of host 'ec2-54-184-101-243.us-west-2.compute.amazonaws.com (54.184.101.243)' can't be established.
ECDSA key fingerprint is SHA256:IymAsI+0Wk54Or5GoNuEtxYn9p5hzeofBbbJlA6Px84.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'ec2-54-184-101-243.us-west-2.compute.amazonaws.com,54.184.101.243' (ECDSA) to the list of known hosts.
Welcome to Ubuntu 18.04.4 LTS (GNU/Linux 4.15.0-1065-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Sat Jun 13 02:52:07 UTC 2020

  System load:  0.0               Processes:           86
  Usage of /:   13.8% of 7.69GB   Users logged in:     0
  Memory usage: 15%               IP address for eth0: 172.31.28.92
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

```

- Commands to create the second EC2 instance and any additional resource required:

```
aws ec2 run-instances \
    --image-id ami-003634241a8fcdec0 \
    --instance-type t2.micro \
    --count 1 \
    --key-name MyKeyPair \
    --security-group-ids sg-03e80096433013264 \
    --no-associate-public-ip-address


{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-003634241a8fcdec0",
            "InstanceId": "i-0f4ac6c8519868f78",
            "InstanceType": "t2.micro",
            "KeyName": "MyKeyPair",
            "LaunchTime": "2020-06-16T10:36:54+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "us-west-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-22-150.us-west-2.compute.internal",
            "PrivateIpAddress": "172.31.22.150",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-2df43655",
            "VpcId": "vpc-fc9fee84",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-06-16T10:36:54+00:00",
                        "AttachmentId": "eni-attach-0b17fea8a0694b5f1",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "my-sg",
                            "GroupId": "sg-03e80096433013264"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "02:f0:46:d5:4e:12",
                    "NetworkInterfaceId": "eni-019e275e8f96e792e",
                    "OwnerId": "873547843801",
                    "PrivateDnsName": "ip-172-31-22-150.us-west-2.compute.internal",
                    "PrivateIpAddress": "172.31.22.150",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-22-150.us-west-2.compute.internal",
                            "PrivateIpAddress": "172.31.22.150"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-2df43655",
                    "VpcId": "vpc-fc9fee84",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/sda1",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "my-sg",
                    "GroupId": "sg-03e80096433013264"
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
    "OwnerId": "873547843801",
    "ReservationId": "r-05043599fd5e11d8c"
}

```

- Commands to connect to the second EC2 instance:

```

eval `ssh-agent`
ssh-add MyKeyPair.pem
ssh -A ubuntu@ec2-34-212-252-59.us-west-2.compute.amazonaws.com

Welcome to Ubuntu 18.04.4 LTS (GNU/Linux 4.15.0-1065-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Tue Jun 16 11:46:09 UTC 2020

  System load:  0.0               Processes:           91
  Usage of /:   20.3% of 7.69GB   Users logged in:     0
  Memory usage: 18%               IP address for eth0: 172.31.28.92
  Swap usage:   0%

 * MicroK8s gets a native Windows installer and command-line integration.

     https://ubuntu.com/blog/microk8s-installers-windows-and-macos

30 packages can be updated.
0 updates are security updates.


*** System restart required ***
Last login: Tue Jun 16 11:15:04 2020 from 115.64.184.146

```

```
ssh ubuntu@172.31.22.150

Welcome to Ubuntu 18.04.4 LTS (GNU/Linux 4.15.0-1065-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Tue Jun 16 11:47:03 UTC 2020

  System load:  0.0               Processes:           86
  Usage of /:   13.7% of 7.69GB   Users logged in:     0
  Memory usage: 15%               IP address for eth0: 172.31.22.150
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

```

- Improve security group rules

```
aws ec2 revoke-security-group-ingress --group-id sg-03e80096433013264 --protocol tcp --port 22 --cidr 0.0.0.0/0

aws ec2 authorize-security-group-ingress --group-id sg-03e80096433013264 --protocol tcp --port 22 --cidr 115.64.184.146/32


// allow the connection between public and private ec2 instance.

aws ec2 authorize-security-group-ingress --group-id sg-03e80096433013264 --protocol tcp --port 22 --cidr 172.31.28.92/32


```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines-->
***
Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws01/README.md)
