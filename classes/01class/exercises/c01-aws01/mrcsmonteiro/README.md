# C01-AWS01

## Commands Execution Output

- Commands to create the first EC2 instance and any additional resource required:
```
$ aws ec2 create-security-group --group-name DevOpsAcademySG --description "DevOps Academy SG"

{
    "GroupId": "sg-09d6ed190814fb8b4"
}

$ aws ec2 authorize-security-group-ingress \
    --group-name DevOpsAcademySG \
    --protocol tcp \
    --port 22 \
    --cidr 124.148.132.129/32

$ aws ec2 describe-security-groups --group-names DevOpsAcademySG

{
    "SecurityGroups": [
        {
            "Description": "DevOps Academy SG",
            "GroupName": "DevOpsAcademySG",
            "IpPermissions": [
                {
                    "FromPort": 22,
                    "IpProtocol": "tcp",
                    "IpRanges": [
                        {
                            "CidrIp": "124.148.132.129/32"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 22,
                    "UserIdGroupPairs": []
                }
            ],
            "OwnerId": "149613515908",
            "GroupId": "sg-09d6ed190814fb8b4",
            "IpPermissionsEgress": [
                {
                    "IpProtocol": "-1",
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "UserIdGroupPairs": []
                }
            ],
            "VpcId": "vpc-8ad99fee"
        }
    ]
}

$ aws ec2 run-instances \
    --image-id ami-088ff0e3bde7b3fdf \
    --instance-type t2.micro \
    --count 1 \
    --key-name aws-marcos \
    --security-group-ids sg-09d6ed190814fb8b4 \
    --associate-public-ip-address \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=DevOps Academy (Public IP)}]'

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-0b0e194dab38a3fb5",
            "InstanceType": "t2.micro",
            "KeyName": "aws-marcos",
            "LaunchTime": "2020-06-12T12:02:53+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2b",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-40-215.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.40.215",
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
                        "AttachTime": "2020-06-12T12:02:53+00:00",
                        "AttachmentId": "eni-attach-009293d3898534dd9",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "DevOpsAcademySG",
                            "GroupId": "sg-09d6ed190814fb8b4"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:9c:18:63:a0:da",
                    "NetworkInterfaceId": "eni-01e2de071f2396306",
                    "OwnerId": "149613515908",
                    "PrivateDnsName": "ip-172-31-40-215.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.40.215",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-40-215.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.40.215"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-9da698eb",
                    "VpcId": "vpc-8ad99fee",
                    "InterfaceType": "interface"
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-08124090dfbf29c4d",
            "InstanceType": "t2.micro",
            "KeyName": "aws-marcos",
            "LaunchTime": "2020-06-12T12:03:56+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2b",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-46-215.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.46.215",
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
                        "AttachTime": "2020-06-12T12:03:56+00:00",
                        "AttachmentId": "eni-attach-0fb550f978999f0b6",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "DevOpsAcademySG",
                            "GroupId": "sg-09d6ed190814fb8b4"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:5a:1d:18:35:b2",
                    "NetworkInterfaceId": "eni-00f5bbb72bc0fe925",
                    "OwnerId": "149613515908",
                    "PrivateDnsName": "ip-172-31-46-215.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.46.215",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-46-215.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.46.215"
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
                    "GroupName": "DevOpsAcademySG",
                    "GroupId": "sg-09d6ed190814fb8b4"
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
                    "Value": "DevOps Academy (Public IP)"
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
    "ReservationId": "r-0f7861532af75c047"
}
```

- Commands to connect to the first EC2 instance:
```
$ ssh -i aws-marcos.pem ec2-user@3.25.101.202

The authenticity of host '3.25.101.202 (3.25.101.202)' can't be established.
ECDSA key fingerprint is SHA256:LTXOzMHH12VoPAI4gaPZFN+pJKH9q27T1rPF5mmE/Cg.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '3.25.101.202' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 8 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-46-215 ~]$
```

- Commands to create the second EC2 instance and any additional resource required:
```
$ aws ec2 authorize-security-group-ingress \
    --group-name DevOpsAcademySG \
    --protocol tcp \
    --port 22 \
    --cidr 172.31.46.215/32

$ aws ec2 run-instances \
    --image-id ami-088ff0e3bde7b3fdf \
    --instance-type t2.micro \
    --count 1 \
    --key-name aws-marcos \
    --security-group-ids sg-09d6ed190814fb8b4 \
    --no-associate-public-ip-address \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=DevOps Academy (Private IP Only)}]'

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-059dae5443d0413bf",
            "InstanceType": "t2.micro",
            "KeyName": "aws-marcos",
            "LaunchTime": "2020-06-12T12:14:55+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2b",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-41-170.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.41.170",
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
                        "AttachTime": "2020-06-12T12:14:55+00:00",
                        "AttachmentId": "eni-attach-039e6b540d2ae1bf9",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "DevOpsAcademySG",
                            "GroupId": "sg-09d6ed190814fb8b4"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:8c:48:5c:ac:18",
                    "NetworkInterfaceId": "eni-0e0cf09beb46bbc9c",
                    "OwnerId": "149613515908",
                    "PrivateDnsName": "ip-172-31-41-170.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.41.170",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-41-170.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.41.170"
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
                    "GroupName": "DevOpsAcademySG",
                    "GroupId": "sg-09d6ed190814fb8b4"
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
    "ReservationId": "r-0d2b85c829046a52c"
}
```

- Commands to connect to the second EC2 instance:
```
# Start ssh-agent
$ eval `ssh-agent`

# Add private key to keychain for secure connection
$ ssh-add aws-marcos.pem

# Enable SSH agent forwarding & connect to 'bastion' host (first instance)
$ ssh -A ec2-user@3.25.101.202
Last login: Fri Jun 12 12:06:55 2020 from 124-148-132-129.dyn.iinet.net.au

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 8 available
Run "sudo yum update" to apply all updates.

# Connect to second instance from first instance
[ec2-user@ip-172-31-46-215 ~]$ ssh 172.31.41.170
The authenticity of host '172.31.41.170 (172.31.41.170)' can't be established.
ECDSA key fingerprint is SHA256:denTVrrTQKxHaVbFPThRmgvaNumpp4/vykNxwAOXk+Q.
ECDSA key fingerprint is MD5:5d:b4:d1:71:6f:fb:82:12:84:1f:d5:45:54:79:d7:b1.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '172.31.41.170' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-172-31-41-170 ~]$
```

***
Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws01/README.md)
