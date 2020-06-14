# C01-AWS01

## Commands Execution Output

- Commands to create the first EC2 instance and any additional resource required:
```
> aws ec2 create-key-pair --key-name PubHostKeyPair --query 'KeyMaterial' --output text > PubHostKeyPair.pem
> chmod 400 PubHostKeyPair.pem

> aws ec2 create-security-group --group-name DoaPublicSG --description "DOA public instance SG"
{
    "GroupId": "sg-0be5c65ad2881a177"
}

> aws ec2 authorize-security-group-ingress \
    --group-id sg-0be5c65ad2881a177 \
    --protocol tcp \
    --port 22 \
    --cidr 121.200.5.117/32

> aws ec2 run-instances \
    --image-id resolve:ssm:/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 \
    --instance-type t2.micro \
    --count 1 \
    --associate-public-ip-address \
    --security-group-ids sg-0be5c65ad2881a177 \
    --key-name PubHostKeyPair

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-00b83a4dd2b959bb6",
            "InstanceType": "t2.micro",
            "KeyName": "PubHostKeyPair",
            "LaunchTime": "2020-06-13T11:17:23+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2b",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-39-209.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.39.209",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-d239da9a",
            "VpcId": "vpc-aeb2bcc9",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "1f8806cf-c422-4077-af23-89dd09b33071",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-06-13T11:17:23+00:00",
                        "AttachmentId": "eni-attach-0ac56a57b6cfc8ecd",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "DoaPublicSG",
                            "GroupId": "sg-0be5c65ad2881a177"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:cf:60:02:96:8a",
                    "NetworkInterfaceId": "eni-06ce13bee1dedd585",
                    "OwnerId": "907095435092",
                    "PrivateDnsName": "ip-172-31-39-209.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.39.209",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-39-209.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.39.209"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-d239da9a",
                    "VpcId": "vpc-aeb2bcc9",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "DoaPublicSG",
                    "GroupId": "sg-0be5c65ad2881a177"
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
    "OwnerId": "907095435092",
    "ReservationId": "r-07985cbadf26fa195"
}

```

- Commands to connect to the first EC2 instance:
```
> ssh -i "PubHostKeyPair.pem" ec2-user@54.206.11.184

The authenticity of host '54.206.11.184 (54.206.11.184)' can't be established.
ECDSA key fingerprint is SHA256:hIcq2UpiqXmtB72MECVcK5FF+QX16N+Ymh6E2KjS60A.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '54.206.11.184' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 8 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-39-209 ~]$

```
- Commands to create the second EC2 instance and any additional resource required:
```
> aws ec2 create-key-pair --key-name PrivateHostKeyPair --query 'KeyMaterial' --output text > PrivateHostKeyPair.pem
> chmod 400 PrivateHostKeyPair.pem

> aws ec2 create-security-group --group-name DoaPrivateSG --description "DOA private instance SG"
{
    "GroupId": "sg-04070981c14d269d4"
}

> aws ec2 authorize-security-group-ingress \
    --group-id sg-04070981c14d269d4 \
    --protocol tcp \
    --port 22 \
    --source-group sg-0be5c65ad2881a177

> aws ec2 run-instances \
    --image-id resolve:ssm:/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 \
    --instance-type t2.micro \
    --count 1 \
    --no-associate-public-ip-address \
    --security-group-ids sg-04070981c14d269d4 \
    --key-name PrivateHostKeyPair

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-0e427bdf62780e4dc",
            "InstanceType": "t2.micro",
            "KeyName": "PrivateHostKeyPair",
            "LaunchTime": "2020-06-13T11:24:07+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2b",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-34-230.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.34.230",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-d239da9a",
            "VpcId": "vpc-aeb2bcc9",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "ef561ed7-c601-411a-8a17-3f192d2b373d",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-06-13T11:24:07+00:00",
                        "AttachmentId": "eni-attach-0749f0071e6756997",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "DoaPrivateSG",
                            "GroupId": "sg-04070981c14d269d4"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:48:b9:11:9d:88",
                    "NetworkInterfaceId": "eni-04650f36e79f254ea",
                    "OwnerId": "907095435092",
                    "PrivateDnsName": "ip-172-31-34-230.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.34.230",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-34-230.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.34.230"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-d239da9a",
                    "VpcId": "vpc-aeb2bcc9",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "DoaPrivateSG",
                    "GroupId": "sg-04070981c14d269d4"
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
    "OwnerId": "907095435092",
    "ReservationId": "r-01792306eb061931a"
}

```

- Commands to connect to the second EC2 instance:
```
> eval "$(ssh-agent -s)"
Agent pid 44455

> ssh-add -K PrivateHostKeyPair.pem
Identity added: PrivateHostKeyPair.pem (PrivateHostKeyPair.pem)

> ssh-add -K PubHostKeyPair.pem
Identity added: PubHostKeyPair.pem (PubHostKeyPair.pem)

> cat ~/.ssh/config
Host *
  AddKeysToAgent yes
  UseKeychain yes
  ForwardAgent yes
  IdentityFile ~/.ssh/id_rsa
  IdentityFile ~/.ssh/PubHostKeyPair.pem
  IdentityFile ~/.ssh/PrivateHostKeyPair.pem

> ssh ec2-user@54.206.11.184
Last login: Sat Jun 13 11:54:28 2020 from 121-200-5-117.79c805.syd.nbn.aussiebb.net

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/


>> [ec2-user@ip-172-31-39-209 ~]$ ssh ec2-user@172.31.34.230

        __|  __|_  )
        _|  (     /   Amazon Linux 2 AMI
        ___|\___|___|

    https://aws.amazon.com/amazon-linux-2/
    [ec2-user@ip-172-31-34-230 ~]$

```

***
Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws01/README.md)