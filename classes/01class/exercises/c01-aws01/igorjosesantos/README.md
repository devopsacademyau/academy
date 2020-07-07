# C01-AWS01

## Commands Execution Output

1. Setup AWS CLI.

COMMAND:
```
aws configure
```

OUTPUT:
```
AWS Access Key ID [none]: ****************MZH6
AWS Secret Access Key [none]: ****************zx8J
Default region name [none]: ap-southeast-2
Default output format [none]: json
```

2. Create access key pair

COMMAND:
```
aws ec2 create-key-pair --key-name c01aws01key --output text
```

COMMAND:
```
aws ec2 describe-key-pairs --key-name c01aws01key
```

OUTPUT:
```
{
    "KeyPairs": [
        {
            "KeyPairId": "key-045f886e7fdf3e0f8",
            "KeyFingerprint": "56:23:8a:2f:fc:57:5a:fa:df:ca:80:f1:c3:53:9a:64:ce:8f:67:9e",
            "KeyName": "c01aws01key",
            "Tags": []
        }
    ]
}
```

3. Create Security Groups
COMMAND:
```
aws ec2 create-security-group --group-name c01aws01-sg --description "c01aws01 security group"
```
OUTPUT:
```
{
    "GroupId": "sg-0928ad346ea3988fb"
}
```

- List available subnets:
COMMAND:
```
aws ec2 describe-subnets
```
 
- Commands to create the first EC2 instance and any additional resource required:

COMMAND:
```
aws ec2 run-instances \
    --image-id ami-03d6d932787644938 \
    --instance-type t2.micro \
    --count 1 \
    --key-name c01aws01key \
    --subnet-id subnet-3a779a72
    --security-group-ids sg-0928ad346ea3988fb \
    --associate-public-ip-address
```

OUTPUT:
```
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-03d6d932787644938",
            "InstanceId": "i-0a9ecad0118adc70f",
            "InstanceType": "t2.micro",
            "KeyName": "c01aws01key",
            "LaunchTime": "2020-07-20T12:50:38+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2b",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-34-203.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.34.203",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-3a779a72",
            "VpcId": "vpc-060f0461",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "30be385b-4974-45ca-9228-5581d2d73e89",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-07-20T12:50:38+00:00",
                        "AttachmentId": "eni-attach-001af27fe1c3f6ed8",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "c01aws01-sg",
                            "GroupId": "sg-0928ad346ea3988fb"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:d2:19:54:5d:c0",
                    "NetworkInterfaceId": "eni-0b640268996365cef",
                    "OwnerId": "459466811811",
                    "PrivateDnsName": "ip-172-31-34-203.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.34.203",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-34-203.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.34.203"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-3a779a72",
                    "VpcId": "vpc-060f0461",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/sda1",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "c01aws01-sg",
                    "GroupId": "sg-0928ad346ea3988fb"
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
    "OwnerId": "459466811811",
    "ReservationId": "r-000dcba81ec40f42a"
}
```

- Commands to connect to the first EC2 instance:

```

1. aws ec2 authorize-security-group-ingress --group-id sg-0928ad346ea3988fb --protocol tcp --port 22 --cidr 0.0.0.0/0

2. ssh -i "c01aws01key.pem" ubuntu@ec2-3-25-98-45.ap-southeast-2.compute.amazonaws.com
```

- Commands to create the second EC2 instance and any additional resource required:

```
aws ec2 run-instances \
    --image-id ami-03d6d932787644938 \
    --instance-type t2.micro \
    --count 1 \
    --key-name c01aws01key \
    --security-group-ids sg-0928ad346ea3988fb \
    --no-associate-public-ip-address

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-03d6d932787644938",
            "InstanceId": "i-05a453a12b9be0fc9",
            "InstanceType": "t2.micro",
            "KeyName": "c01aws01key",
            "LaunchTime": "2020-07-20T13:04:06+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2b",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-34-11.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.34.11",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-3a779a72",
            "VpcId": "vpc-060f0461",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "ee627196-8bfc-4e03-bfdb-ad5cc179f6b9",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-07-20T13:04:06+00:00",
                        "AttachmentId": "eni-attach-052e698bfcd0d2429",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "c01aws01-sg",
                            "GroupId": "sg-0928ad346ea3988fb"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:c7:4a:e1:ef:56",
                    "NetworkInterfaceId": "eni-033d9286d8535d9d3",
                    "OwnerId": "459466811811",
                    "PrivateDnsName": "ip-172-31-34-11.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.34.11",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-34-11.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.34.11"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-3a779a72",
                    "VpcId": "vpc-060f0461",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/sda1",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "c01aws01-sg",
                    "GroupId": "sg-0928ad346ea3988fb"
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
    "OwnerId": "459466811811",
    "ReservationId": "r-0b725d322416f53f3"
}
```

- Commands to connect to the second EC2 instance:

```
eval `ssh-agent`
ssh-add c01aws01key.pem
ssh -A ubuntu@ec2-3-25-98-45.ap-southeast-2.compute.amazonaws.com
```

```
ssh ubuntu@172.31.34.11

```

- Improve security group rules

```
aws ec2 revoke-security-group-ingress --group-id sg-0928ad346ea3988fb --protocol tcp --port 22 --cidr 0.0.0.0/0


// My current Public IP Address

aws ec2 authorize-security-group-ingress --group-id sg-0928ad346ea3988fb --protocol tcp --port 22 --cidr 14.202.211.53/32


// allow the connection between public and private ec2 instance.

aws ec2 authorize-security-group-ingress --group-id sg-0928ad346ea3988fb --protocol tcp --port 22 --cidr 172.31.34.203/32

```

***
Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws01/README.md)
