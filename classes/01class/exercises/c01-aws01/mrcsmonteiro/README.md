# C01-AWS01

## Commands Execution Output

- Commands to create the first EC2 instance and any additional resource required:
```
$ aws ec2 run-instances \
    --image-id ami-088ff0e3bde7b3fdf \
    --instance-type t2.micro \
    --count 1 \
    --key-name aws-marcos \
    --associate-public-ip-address \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=DevOps Academy}]'

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-00078c13bff5b2222",
            "InstanceType": "t2.micro",
            "KeyName": "aws-marcos",
            "LaunchTime": "2020-06-12T09:48:27+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2b",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-35-234.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.35.234",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-9da698eb",
            "VpcId": "vpc-8ad99fee",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-06-12T09:48:27+00:00",
                        "AttachmentId": "eni-attach-0e85c2f28df8a07db",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "default",
                            "GroupId": "sg-7d59bd1b"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:80:55:73:55:a2",
                    "NetworkInterfaceId": "eni-00f1caa5876878a75",
                    "OwnerId": "149613515908",
                    "PrivateDnsName": "ip-172-31-35-234.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.35.234",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-35-234.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.35.234"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-9da698eb",
                    "VpcId": "vpc-8ad99fee",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "default",
                    "GroupId": "sg-7d59bd1b"
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
                    "Value": "DevOps Academy"
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
    "OwnerId": "149613515908",
    "ReservationId": "r-0c2aac62f97656013"
}
```

- Commands to connect to the first EC2 instance:
```
$ ssh -i aws-marcos.pem ec2-user@13.236.195.206

The authenticity of host '13.236.195.206 (13.236.195.206)' can't be established.
ECDSA key fingerprint is SHA256:uEur5r8wVnf5oFmiSobITQZik8ArzhBF9VFj86BXo3c.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '13.236.195.206' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 8 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-35-234 ~]$
```

- Commands to create the second EC2 instance and any additional resource required:
```
$ aws ec2 run-instances \
    --image-id ami-088ff0e3bde7b3fdf \
    --instance-type t2.micro \
    --count 1 \
    --key-name aws-marcos \
    --no-associate-public-ip-address \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=DevOps Academy (Private IP Only)}]'

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-08e990cc0fa92dab4",
            "InstanceType": "t2.micro",
            "KeyName": "aws-marcos",
            "LaunchTime": "2020-06-12T10:03:53+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2b",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-35-242.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.35.242",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-9da698eb",
            "VpcId": "vpc-8ad99fee",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-06-12T10:03:53+00:00",
                        "AttachmentId": "eni-attach-02c24ccd72ca3a2bd",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "default",
                            "GroupId": "sg-7d59bd1b"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:f5:5d:19:02:3a",
                    "NetworkInterfaceId": "eni-0030bbcfec3745386",
                    "OwnerId": "149613515908",
                    "PrivateDnsName": "ip-172-31-35-242.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.35.242",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-35-242.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.35.242"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-9da698eb",
                    "VpcId": "vpc-8ad99fee",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "default",
                    "GroupId": "sg-7d59bd1b"
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
                    "Value": "DevOps Academy (Private IP Only)"
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
    "OwnerId": "149613515908",
    "ReservationId": "r-0f94861d8e81f5975"
}
```

- Commands to connect to the second EC2 instance:
```
# copy private key to first instance:
$ scp -i aws-marcos.pem  aws-marcos.pem ec2-user@13.236.195.206:~
aws-marcos.pem                                                                                                                           100% 1674    72.5KB/s   00:00

# SSH to first instance:
$ ssh -i aws-marcos.pem ec2-user@13.236.195.206
Last login: Fri Jun 12 10:06:29 2020 from 124-148-132-129.dyn.iinet.net.au

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 8 available
Run "sudo yum update" to apply all updates.

# SSH to second instance from the first instance, which is acting as a jump box, using the private key copied previously:
[ec2-user@ip-172-31-35-234 ~]$ ssh -i aws-marcos.pem 172.31.35.242

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-172-31-35-242 ~]$
```

***
Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws01/README.md)
