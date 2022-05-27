# C01-AWS01

## Commands Execution Output

- Commands to create the first EC2 instance and any additional resource required:
```
# Creating a key pair
$ aws ec2 create-key-pair --key-name JumpBoxKeyForFirstEC2Instance --query 'KeyMaterial' --output text > JumpBoxKeyForFirstEC2Instance.pem

# Changing key file permission for user read access only
$ chmod 400 JumpBoxKeyForFirstEC2Instance.pem

# Finding the VPC ID where EC2 instance will launch
$ aws ec2 describe-vpcs --filters "Name=isDefault, Values=true" | grep VpcId
            "VpcId": "vpc-090d0c07e3ab13950",

# Creating a security group to limit access to our JumpBox instance
$ aws ec2 create-security-group --group-name sg_JumpBox --description "JumpBox Security Group"  --vpc-id vpc-090d0c07e3ab13950
{
    "GroupId": "sg-0ae06d429d02910c3"
}

# Checking our computer's public IP address
$ curl ifconfig.co
101.128.85.9

# Adding our computer's public IP address for SSH port 22
$ aws ec2 authorize-security-group-ingress --group-id sg-0ae06d429d02910c3 --protocol tcp --port 22 --cidr 101.128.85.9/32
{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-0d59b21ff85d84459",
            "GroupId": "sg-0ae06d429d02910c3",
            "GroupOwnerId": "192643247659",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "CidrIpv4": "101.128.85.9/32"
        }
    ]
}

# Getting the latest image ID for the Amazon Linux 2 AMI
$ aws ec2 describe-images --owners amazon --filters 'Name=name,Values=amzn2-ami-kernel-5.10-hvm-2.0.2022*' 'Name=state,Values=available' --query 'Images[*].[CreationDate,ImageId]' --output text | sort | tail -1
2022-04-28T21:51:17.000Z        ami-0bd6906508e74f692

# Finding SubnetId where the EC2 instance will launch
$ aws ec2 describe-subnets --filters "Name=vpc-id, Values=vpc-090d0c07e3ab13950" | grep SubnetId
            "SubnetId": "subnet-028a5982138554aab",
            "SubnetId": "subnet-013218832a306ab46",
            "SubnetId": "subnet-06fecda8b27f23aea",

# Creating the first EC2 instance
$ aws ec2 run-instances \
> --image-id ami-0bd6906508e74f692 \
> --instance-type t2.micro \
> --count 1 \
> --subnet-id subnet-028a5982138554aab \
> --key-name JumpBoxKeyForFirstEC2Instance \
> --security-group-ids sg-0ae06d429d02910c3 \
> --associate-public-ip-address \
> --tag-specifications 'ResourceType=instance, Tags=[{Key=Name,Value=JumpBox}]'
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-0bd6906508e74f692",
            "InstanceId": "i-019a66898ee2e2f50",
            "InstanceType": "t2.micro",
            "KeyName": "JumpBoxKeyForFirstEC2Instance",
            "LaunchTime": "2022-05-24T01:48:37+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-1b",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-27-20.ap-southeast-1.compute.internal",
            "PrivateIpAddress": "172.31.27.20",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-028a5982138554aab",
            "VpcId": "vpc-090d0c07e3ab13950",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "adbb5b24-1d2f-4362-91b1-a556d4878074",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-05-24T01:48:37+00:00",
                        "AttachmentId": "eni-attach-02b80a06c4e9192f9",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "sg_JumpBox",
                            "GroupId": "sg-0ae06d429d02910c3"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "02:d1:d1:35:3b:ae",
                    "NetworkInterfaceId": "eni-0ccd2b7eac3fa39c1",
                    "OwnerId": "192643247659",
                    "PrivateDnsName": "ip-172-31-27-20.ap-southeast-1.compute.internal",
                    "PrivateIpAddress": "172.31.27.20",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-27-20.ap-southeast-1.compute.internal",
                            "PrivateIpAddress": "172.31.27.20"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-028a5982138554aab",
                    "VpcId": "vpc-090d0c07e3ab13950",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "sg_JumpBox",
                    "GroupId": "sg-0ae06d429d02910c3"
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
                    "Value": "JumpBox"
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
            },
            "MaintenanceOptions": {
                "AutoRecovery": "default"
            }
        }
    ],
    "OwnerId": "192643247659",
    "ReservationId": "r-073bfe4129bf67cda"
}
```

- Commands to connect to the first EC2 instance:
```
# Finding the public IP Address to the first EC2 instance
$ aws ec2 describe-instances --instance-ids i-019a66898ee2e2f50 --query 'Reservations[0].Ins
tances[0].PublicIpAddress'
"13.215.185.227"

# Connect to the first EC2 instance over the internet
$ ssh -i JumpBoxKeyForFirstEC2Instance.pem ec2-user@13.215.185.227
The authenticity of host '13.215.185.227 (13.215.185.227)' can't be established.
ED25519 key fingerprint is SHA256:pcq2z5kJjkbibC2s74d5xfUXHiMfwFhShOdqqfHipvk.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '13.215.185.227' (ED25519) to the list of known hosts.
Last login: Tue May 24 07:38:45 2022 from 101.128.85.9

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
2 package(s) needed for security, out of 6 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-27-20 ~]$
```

- Commands to create the second EC2 instance and any additional resource required:
```
# Creating a key pair
$ aws ec2 create-key-pair --key-name KeyForPrivateEC2Instance --query 'KeyMaterial' --output text > KeyForPrivateEC2Instance.pem

# Changing key file permission for user read access only
$ chmod 400 KeyForPrivateEC2Instance.pem

# Creating a security group to limit access to our Private instance
$ aws ec2 create-security-group --group-name sg_privateInstance --description "Private Address Access Security Group" --vpc-id vpc-090d0c07e3ab13950
{
    "GroupId": "sg-05230be9c2b1b600b"
}

# Checking our JumpBox instance's private IP address
$ aws ec2 describe-instances --instance-ids i-019a66898ee2e2f50 --query 'Reservations[0].Instances[0].PrivateIpAddress'
"172.31.27.20"

# Adding our JumpBox's IP address for SSH port 22
$ aws ec2 authorize-security-group-ingress --group-id sg-05230be9c2b1b600b --protocol tcp --port 22 --cidr 172.31.27.20/32
{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-07ff3f5e11a5716f7",
            "GroupId": "sg-05230be9c2b1b600b",
            "GroupOwnerId": "192643247659",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "CidrIpv4": "172.31.27.20/32"
        }
    ]
}

# Creating the second EC2 instance
$ aws ec2 run-instances \
> --image-id ami-0bd6906508e74f692 \
> --instance-type t2.micro \
> --count 1 \
> --subnet-id subnet-013218832a306ab46 \
> --key-name KeyForPrivateEC2Instance \
> --security-group-ids sg-05230be9c2b1b600b \
> --associate-public-ip-address \
> --tag-specifications 'ResourceType=instance, Tags=[{Key=Name,Value=PrivateAccess}]'
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-0bd6906508e74f692",
            "InstanceId": "i-044c6b03a72be7926",
            "InstanceType": "t2.micro",
            "KeyName": "KeyForPrivateEC2Instance",
            "LaunchTime": "2022-05-24T01:58:28+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-1a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-37-96.ap-southeast-1.compute.internal",
            "PrivateIpAddress": "172.31.37.96",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-013218832a306ab46",
            "VpcId": "vpc-090d0c07e3ab13950",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "babc14bc-9ddf-49ed-9a13-73d40996fc3b",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-05-24T01:58:28+00:00",
                        "AttachmentId": "eni-attach-0f29b4559922fb32b",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "sg_privateInstance",
                            "GroupId": "sg-05230be9c2b1b600b"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:75:15:48:67:70",
                    "NetworkInterfaceId": "eni-01d15da7b1a395cd6",
                    "OwnerId": "192643247659",
                    "PrivateDnsName": "ip-172-31-37-96.ap-southeast-1.compute.internal",
                    "PrivateIpAddress": "172.31.37.96",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-37-96.ap-southeast-1.compute.internal",
                            "PrivateIpAddress": "172.31.37.96"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-013218832a306ab46",
                    "VpcId": "vpc-090d0c07e3ab13950",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "sg_privateInstance",
                    "GroupId": "sg-05230be9c2b1b600b"
                }
            ],
            "SourceDestCheck": true,
            "StateReason": {
                "Code": "pending",
                "Message": "pending"
            },
            "Tags": [
                {
                    "Key": "Env",
                    "Value": "PrivateAccess"
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
            },
            "MaintenanceOptions": {
                "AutoRecovery": "default"
            }
        }
    ],
    "OwnerId": "192643247659",
    "ReservationId": "r-0c910343d7a74ffd4"
}
```

- Commands to connect to the second EC2 instance:
```
# Finding the second EC2 instance's private IP Address
$ aws ec2 describe-instances --instance-ids i-044c6b03a72be7926 --query 'Reservations[0].Instances[0].PrivateIpAddress'
"172.31.37.96"

# Starting SSH Agent
$  eval `ssh-agent`
Agent pid 1864

# Adding key for private EC2 instance to SSH Agent
$ ssh-add KeyForPrivateEC2Instance.pem
Identity added: KeyForPrivateEC2Instance.pem (KeyForPrivateEC2Instance.pem)

# Allowing forwarding in SSH's config for JumpBox instance
$ vim ~/.ssh/config
Host 13.215.185.227
  ForwardAgent yes

# Connect to the JumpBox instance
$ ssh -i JumpBoxKeyForFirstEC2Instance.pem ec2-user@13.215.185.227
Last login: Fri May 27 14:07:35 2022 from 101.128.85.9

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
2 package(s) needed for security, out of 6 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-27-20 ~]$

# Connect to the Private instance
[ec2-user@ip-172-31-27-20 ~]$ ssh ec2-user@172.31.37.96
The authenticity of host '172.31.37.96 (172.31.37.96)' can't be established.
ECDSA key fingerprint is SHA256:TZyhvnQzo75gYUwcqYxg8Uxd0OU7PAUv+ZCjSt1AhJQ.
ECDSA key fingerprint is MD5:d7:c7:84:c4:a2:1f:0e:11:16:61:51:8c:82:d1:5b:fa.
Are you sure you want to continue connecting (yes/no)? yes
Last login: Tue May 24 02:03:35 2022 from ip-172-31-27-20.ap-southeast-1.compute.internal

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
2 package(s) needed for security, out of 6 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-37-96 ~]$

# After everything's done, remove the SSH Agent process
$ kill $SSH_AGENT_PID
```

***
Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws01/README.md)
