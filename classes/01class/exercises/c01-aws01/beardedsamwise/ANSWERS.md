### Prepare SSH keys

Add existing SSH keys to the SSH agent 
```
$ chmod 600 webserver.pem
$ chmod 600 jumphost.pem
$ ssh-add --apple-use-keychain webserver.pem
Identity added: webserver.pem (webserver.pem)
$ssh-add --apple-use-keychain jumphost.pem
Identity added: jumphost.pem (jumphost.pem)
```
### Create security groups
```
aws ec2 create-security-group --group-name jumphost-SG --description "Jumphost SG"
{
    "GroupId": "sg-0a28b50fe3f8bb190"
}

aws ec2 create-security-group --group-name webserver-SG --description "Web Server SG"
{
    "GroupId": "sg-003cbd11bf2d34792"
}
```
### Add rules to security groups
```
aws ec2 authorize-security-group-ingress \
    --group-name jumphost-SG \
    --protocol tcp \
    --port 22 \
    --cidr 115.64.227.252/32

{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-02823a53b792a15d2",
            "GroupId": "sg-0a28b50fe3f8bb190",
            "GroupOwnerId": "639247960747",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "CidrIpv4": "115.64.227.252/32"
        }
    ]
}

aws ec2 authorize-security-group-ingress \
    --group-name webserver-SG \
    --protocol tcp \
    --port 22 \
    --source-group jumphost-SG \

{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-0b7e206c5b6af3228",
            "GroupId": "sg-003cbd11bf2d34792",
            "GroupOwnerId": "639247960747",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "ReferencedGroupInfo": {
                "GroupId": "sg-0a28b50fe3f8bb190"
            }
        }
    ]
}
```
### Create EC2 instances
```
aws ec2 run-instances \
    --image-id ami-0a4e637babb7b0a86 \
    --instance-type t2.micro \
    --associate-public-ip-address \
    --key-name jumphost \
    --security-group-ids sg-0a28b50fe3f8bb190

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-0a4e637babb7b0a86",
            "InstanceId": "i-08d6f2a3bf277efed",
            "InstanceType": "t2.micro",
            "KeyName": "jumphost",
            "LaunchTime": "2022-02-16T00:12:37+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-31-102.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.31.102",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-5d4a3934",
            "VpcId": "vpc-5a4a3933",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "99ba7b6e-0276-4bfc-bf98-f7d26944988e",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-02-16T00:12:37+00:00",
                        "AttachmentId": "eni-attach-0c372b176758792db",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "jumphost-SG",
                            "GroupId": "sg-0a28b50fe3f8bb190"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:2a:3f:eb:f0:e0",
                    "NetworkInterfaceId": "eni-0c70446e02c25741e",
                    "OwnerId": "639247960747",
                    "PrivateDnsName": "ip-172-31-31-102.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.31.102",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-31-102.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.31.102"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-5d4a3934",
                    "VpcId": "vpc-5a4a3933",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "jumphost-SG",
                    "GroupId": "sg-0a28b50fe3f8bb190"
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
                "HttpEndpoint": "enabled",
                "HttpProtocolIpv6": "disabled",
                "InstanceMetadataTags": "disabled"
            },
            "EnclaveOptions": {
                "Enabled": false
            },
            "PrivateDnsNameOptions": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            }
        }
    ],
    "OwnerId": "639247960747",
    "ReservationId": "r-0533dcdcd5326b279"
}

aws ec2 run-instances \
    --image-id ami-0a4e637babb7b0a86 \
    --instance-type t2.micro \
    --key-name webserver \
    --security-group-ids sg-003cbd11bf2d34792 \
    --no-associate-public-ip-address

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-0a4e637babb7b0a86",
            "InstanceId": "i-02bd127e17e6143dd",
            "InstanceType": "t2.micro",
            "KeyName": "webserver",
            "LaunchTime": "2022-02-16T00:24:04+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-0a4e637babb7b0a86",
            "InstanceId": "i-02bd127e17e6143dd",
            "InstanceType": "t2.micro",
            "KeyName": "webserver",
            "LaunchTime": "2022-02-16T00:24:04+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-31-133.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.31.133",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-5d4a3934",
            "VpcId": "vpc-5a4a3933",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "5908392b-322f-4103-838d-fb097c004b17",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-02-16T00:24:04+00:00",
                        "AttachmentId": "eni-attach-044baf40a2949eee9",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "webserver-SG",
                            "GroupId": "sg-003cbd11bf2d34792"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:b6:5a:b6:7c:08",
                    "NetworkInterfaceId": "eni-0a0126d2873e917a0",
                    "OwnerId": "639247960747",
                    "PrivateDnsName": "ip-172-31-31-133.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.31.133",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-31-133.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.31.133"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-5d4a3934",
                    "VpcId": "vpc-5a4a3933",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "webserver-SG",
                    "GroupId": "sg-003cbd11bf2d34792"
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
                "HttpEndpoint": "enabled",
                "HttpProtocolIpv6": "disabled",
                "InstanceMetadataTags": "disabled"
            },
            "EnclaveOptions": {
                "Enabled": false
            },
            "PrivateDnsNameOptions": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            }
        }
    ],
    "OwnerId": "639247960747",
    "ReservationId": "r-0b2c346ec7b852c3b"
}

```

### Get the public IP address of the Jumphost
```
aws ec2 describe-instances --instance-ids i-08d6f2a3bf277efed
```

### SSH to jump host

```
$ ssh -A ec2-user@ec2-3-104-66-72.ap-southeast-2.compute.amazonaws.com
Last login: Wed Feb 16 00:24:27 2022 from 115-64-227-252.tpgi.com.au

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
3 package(s) needed for security, out of 6 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-31-102 ~]$ ssh ec2-user@172.31.31.133
The authenticity of host '172.31.31.133 (172.31.31.133)' can't be established.
ECDSA key fingerprint is SHA256:bE6ddBWE+EGN1wKjqanNtZ+j/dfWVMFMRw8ns7Cdckg.
ECDSA key fingerprint is MD5:5a:56:7e:2b:32:4d:85:06:4f:6a:82:b2:1c:b0:85:6e.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '172.31.31.133' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
3 package(s) needed for security, out of 6 available
Run "sudo yum update" to apply all updates.
```
