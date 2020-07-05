# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```
aws ec2 run-instances \
    --image-id ami-088ff0e3bde7b3fdf \
    --instance-type t2.micro \
    --subnet-id subnet-03bbda2e7e877d1fb \
    --security-group-ids sg-040f4db337ffa4cbc \
    --associate-public-ip-address \
    --key-name  C01-AWS01KeyPair \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Public instance}]'
>The command returns:
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-0317b8df59bd071c9",
            "InstanceType": "t2.micro",
            "KeyName": "C01-AWS01KeyPair",
            "LaunchTime": "2020-07-02T06:04:02+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-16-84-76.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.16.84.76",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-03bbda2e7e877d1fb",
            "VpcId": "vpc-081afcee350babdf5",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "9ba398bb-9257-4e61-8dc3-4e0d451aff14",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-07-02T06:04:02+00:00",
                        "AttachmentId": "eni-attach-07a6aeb2033d79fcf",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                                        "Description": "",
                    "Groups": [
                        {
                            "GroupName": "public-sg",
                            "GroupId": "sg-040f4db337ffa4cbc"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "02:1e:82:ee:74:0a",
                    "NetworkInterfaceId": "eni-0e9589f62160b0455",
                    "OwnerId": "438549961569",
                    "PrivateIpAddress": "172.16.84.76",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "172.16.84.76"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-03bbda2e7e877d1fb",
                    "VpcId": "vpc-081afcee350babdf5",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "public-sg",
                    "GroupId": "sg-040f4db337ffa4cbc"
                }
            ],
            "SourceDestCheck": true,
            "StateReason": {
                "Code": "pending",
                "Message": "pending"
            },
            "Tags": [
                {   "Key": "Name",
                    "Value": "Public instance"
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
    "OwnerId": "438549961569",
    "ReservationId": "r-082f1249acc885d44"
}


Add your commands and their outputs here
```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```
aws ec2 run-instances \
    --image-id ami-088ff0e3bde7b3fdf \
    --instance-type t2.micro \
    --network-interfaces  '[{"DeviceIndex":0, "NetworkInterfaceId":"eni-0130b98ffaa477689"}]'\
    --key-name  C01-AWS01KeyPair \
    --tag-specifications \
    'ResourceType=instance,Tags=[{Key=Name, Value=Private instance}]'
>The command returns:
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-061dca43744004884",
            "InstanceType": "t2.micro",
            "KeyName": "C01-AWS01KeyPair",
            "LaunchTime": "2020-07-02T06:48:23+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-16-32-20.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.16.32.20",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-04abf35901ad7a22a",
            "VpcId": "vpc-081afcee350babdf5",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "cfd9edfc-66fe-4b5e-aecd-43e84590cf18",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-07-02T06:48:23+00:00",
                        "AttachmentId": "eni-attach-036187d74506bbbc0",
                        "DeleteOnTermination": false,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "ENI network interface",
                    "Groups": [
                        {
                            "GroupId": "sg-0b64282ceb6c83fb0"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "02:e6:a8:18:18:8e",
                    "NetworkInterfaceId": "eni-0130b98ffaa477689",
                    "OwnerId": "438549961569",
                    "PrivateIpAddress": "172.16.32.20",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "172.16.32.20"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-04abf35901ad7a22a",
                    "VpcId": "vpc-081afcee350babdf5",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupId": "sg-0b64282ceb6c83fb0"
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
                    "Value": "Private instance"
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
    "OwnerId": "438549961569",
    "ReservationId": "r-06d0cd6288472b5ed"
}

```

- Commands for accessing your public instance using ssh

```
ssh ec2-user@3.106.121.8 -i C01-AWS01KeyPair.pem
>The command returns:
The authenticity of host '3.106.121.8 (3.106.121.8)' can't be established.
ECDSA key fingerprint is SHA256:vWnky7Ac9PUfvUKqiz6hzXh1L2xe7RX+emvpVaD8G9M.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '3.106.121.8' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
13 package(s) needed for security, out of 22 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-16-84-76 ~]$



```

- Commands for accessing your private instance from public one

```
ssh -A ec2-user@3.106.121.8 -i C01-AWS01KeyPair.pem
ssh ec2-user@172.16.32.20
>The command returns:
The authenticity of host '172.16.32.20 (172.16.32.20)' can't be established.
ECDSA key fingerprint is SHA256:xFxc8BZRrveDOqwBRbMyWQGieWzHLDTadm6avYlmUhM.
ECDSA key fingerprint is MD5:3a:e7:95:26:bb:ff:ae:e2:fc:b9:b9:17:80:64:80:42.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '172.16.32.20' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-172-16-32-20 ~]$

```

- Commands for testing ping to `8.8.8.8` from private instance

```
[ec2-user@ip-172-16-32-20 ~]$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=107 time=1.98 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=107 time=1.69 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=107 time=1.73 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=107 time=1.71 ms
64 bytes from 8.8.8.8: icmp_seq=5 ttl=107 time=1.70 ms
64 bytes from 8.8.8.8: icmp_seq=6 ttl=107 time=1.68 ms


```

- Any extra challenges faced? Had to create the NAT gateway again and find the command for the ENI field in run-instances.
It showed an error:
An error occurred (InvalidParameterCombination) when calling the RunInstances operation: Network interfaces and an instance-level security groups may not be specified on the same request. The solution was to remove security group,subnet from the command as it will be received from the eni that we created earlier.



***
Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)
