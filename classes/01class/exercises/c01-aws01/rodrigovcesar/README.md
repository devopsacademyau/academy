# C01-AWS01

## Commands Execution Output

- Commands to create the first EC2 instance and any additional resource required:
```
aws ec2 create-key-pair --key-name MyEC2KeyPair --query 'KeyMaterial' --output text > MyEC2KeyPair.pem

chmod 400 MyEC2KeyPair.pem
```

> Check if if it was created successfully

```
aws ec2 describe-key-pairs --key-name MyEC2KeyPair
{
    "KeyPairs": [
        {
            "KeyPairId": "key-0bc11d0a9ca64f705",
            "KeyFingerprint": "b5:d8:be:d5:16:7e:8d:a4:5a:84:ef:86:c7:93:89:1b:62:2e:fa:81",
            "KeyName": "MyEC2KeyPair",
            "Tags": []
        }
    ]
}
```

> Create the security group
```
aws ec2 create-security-group --group-name devops-sg --description "DevOps security group" 
{
    "GroupId": "sg-0bdea3eb5c3f4e535"
}
```


```
aws ec2 authorize-security-group-ingress 
    --group-name devops-sg \
    --protocol tcp \
    --port 22 \
    --cidr 0.0.0.0/0

```

> Create the VM

```
aws ec2 run-instances --image-id resolve:ssm:/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --instance-type t2.micro --count 1 --key-name MyEC2KeyPair --security-group-ids sg-0bdea3eb5c3f4e535 --associate-public-ip-address

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-02f593918dfdbae4c",
            "InstanceType": "t2.micro",
            "KeyName": "MyEC2KeyPair",
            "LaunchTime": "2020-06-14T11:29:13+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2b",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-32-150.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.32.150",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-6909ea21",
            "VpcId": "vpc-56424b31",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "d27ea990-5a8b-455c-bc73-132cf46d8439",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-06-14T11:29:13+00:00",
                        "AttachmentId": "eni-attach-04579294d346ec035",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "devops-sg",
                            "GroupId": "sg-0bdea3eb5c3f4e535"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:67:ea:36:63:14",
                    "NetworkInterfaceId": "eni-09cfe2a8127accc17",
                    "OwnerId": "102825027349",
                    "PrivateDnsName": "ip-172-31-32-150.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.32.150",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-32-150.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.32.150"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-6909ea21",
                    "VpcId": "vpc-56424b31",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "devops-sg",
                    "GroupId": "sg-0bdea3eb5c3f4e535"
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
    "OwnerId": "102825027349",
    "ReservationId": "r-046cdb6098a312cdb"
}
```

- Commands to connect to the first EC2 instance:
```
aws ec2 describe-instances --query "Reservations[].Instances[].[InstanceId, PublicIpAddress]"
[
    [
        "i-02f593918dfdbae4c",
        "13.236.162.87"
    ]
]



ssh -i MyEC2KeyPair.pem ec2-user@13.236.162.87
The authenticity of host '13.236.162.87 (13.236.162.87)' can't be established.
ECDSA key fingerprint is SHA256:9H74RUTSJbg1PPHzZDUwRYqBrII/JzCi+qp79IPMtkA.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '13.236.162.87' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 8 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-32-150 ~]$ ls
[ec2-user@ip-172-31-32-150 ~]$ ls
[ec2-user@ip-172-31-32-150 ~]$ cd ..
[ec2-user@ip-172-31-32-150 home]$ ls
ec2-user
[ec2-user@ip-172-31-32-150 home]$ cd ec2-user/
[ec2-user@ip-172-31-32-150 ~]$ exit
logout
Connection to 13.236.162.87 closed.

```

- Commands to create the second EC2 instance and any additional resource required:
```

aws ec2 create-key-pair --key-name InternalOnlyKey --query 'KeyMaterial' --output text > InternalOnlyKey.pem


chmod 600 InternalOnlyKey.pem

aws ec2 create-security-group --group-name Internal_SG --description "Internal Security Group"
{
    "GroupId": "sg-088fb26c29ac70bb7"
}


aws ec2 authorize-security-group-ingress \
    --group-name Internal_SG \
    --protocol tcp \
    --port 22 \
    --source-group sg-0bdea3eb5c3f4e535


    aws ec2 run-instances --image-id resolve:ssm:/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --instance-type t2.micro --count 1 --key-name InternalOnlyKey --security-group-ids sg-0bdea3eb5c3f4e535 --no-associate-public-ip-address
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-0c0dcd57c54d427e9",
            "InstanceType": "t2.micro",
            "KeyName": "InternalOnlyKey",
            "LaunchTime": "2020-06-14T14:21:08+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2b",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-42-137.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.42.137",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-6909ea21",
            "VpcId": "vpc-56424b31",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "cac7e230-84eb-421e-9d64-db869afee269",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-06-14T14:21:08+00:00",
                        "AttachmentId": "eni-attach-0400418379ded2fed",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "devops-sg",
                            "GroupId": "sg-0bdea3eb5c3f4e535"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:14:50:ab:67:ba",
                    "NetworkInterfaceId": "eni-0765ed75b473a3432",
                    "OwnerId": "102825027349",
                    "PrivateDnsName": "ip-172-31-42-137.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.42.137",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-42-137.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.42.137"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-6909ea21",
                    "VpcId": "vpc-56424b31",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "devops-sg",
                    "GroupId": "sg-0bdea3eb5c3f4e535"
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
    "OwnerId": "102825027349",
    "ReservationId": "r-04edb14fe70e3f259"
}


```

- Commands to connect to the second EC2 instance:
```


eval "$(ssh-agent -s)"
Agent pid 14135


ssh-add MyEC2KeyPair.pem 
Identity added: MyEC2KeyPair.pem (MyEC2KeyPair.pem)

ssh-add InternalOnlyKey.pem
Identity added: InternalOnlyKey.pem (InternalOnlyKey.pem)


ssh -A ec2-user@13.236.162.87
Last login: Mon Jun 15 04:01:09 2020 from 147.73.150.122.sta.dodo.net.au

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 8 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-32-150 ~]$ ssh ec2-user@172.31.42.137

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-172-31-42-137 ~]$





```

***
Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws01/README.md)
