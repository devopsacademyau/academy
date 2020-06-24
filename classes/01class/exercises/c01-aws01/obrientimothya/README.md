# C01-AWS01

## Commands Execution Output

- Commands to create the first EC2 instance and any additional resource required:

```
AWS_ACCESS_KEY_ID=<HOWABOUTNO>
AWS_SECRET_ACCESS_KEY=<NOTTODAYJIM>
AWS_DEFAULT_REGION=us-east-1
aws ec2 create-security-group --group-name c01aws01 --description "Rules for c01aws01"
aws ec2 authorize-security-group-ingress --group-name c01aws01 --protocol tcp --port 22 --cidr 0.0.0.0/0
GROUP_ID=$(aws ec2 describe-security-groups --group-name c01aws01 --output text --query "SecurityGroups[*].{ID:GroupId}")
cat <<EOF | xargs -0 aws ec2 run-instances --cli-input-json
{
  "DryRun": false,
  "ImageId": "ami-09d95fab7fff3776c",
  "KeyName": "bastion-keypair",
  "InstanceType": "t2.nano",
  "NetworkInterfaces": [
    {
      "DeviceIndex": 0,
      "AssociatePublicIpAddress": true,
      "Groups": [
        "$GROUP_ID"
      ]
    }
  ],
  "TagSpecifications": [
    {
      "ResourceType": "instance",
      "Tags": [
        {
          "Key": "Name",
          "Value": "c01aws01-01"
        }
      ]
    }
  ]
}
EOF

# output
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-09d95fab7fff3776c",
            "InstanceId": "i-0b704b4be5b1197db",
            "InstanceType": "t2.nano",
            "KeyName": "private-keypair",
            "LaunchTime": "2020-06-23T04:46:32+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "us-east-1e",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-49-253.ec2.internal",
            "PrivateIpAddress": "172.31.49.253",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-da702be4",
            "VpcId": "vpc-d0dbfbaa",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-06-23T04:46:32+00:00",
                        "AttachmentId": "eni-attach-03756f90c0c018db0",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "c01aws01",
                            "GroupId": "sg-00c3b639f847622d4"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:1a:37:3f:93:85",
                    "NetworkInterfaceId": "eni-09a00f162817ffc20",
                    "OwnerId": "437637330966",
                    "PrivateDnsName": "ip-172-31-49-253.ec2.internal",
                    "PrivateIpAddress": "172.31.49.253",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-49-253.ec2.internal",
                            "PrivateIpAddress": "172.31.49.253"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-da702be4",
                    "VpcId": "vpc-d0dbfbaa",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "c01aws01",
                    "GroupId": "sg-00c3b639f847622d4"
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
                    "Value": "c01aws01-01"
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
    "OwnerId": "437637330966",
    "ReservationId": "r-08588169e9cb794cd"
}
```

- Commands to connect to the first EC2 instance:

```
AWS_ACCESS_KEY_ID=<HOWABOUTNO>
AWS_SECRET_ACCESS_KEY=<NOTTODAYJIM>
AWS_DEFAULT_REGION=us-east-1
INSTANCE=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=c01aws01-01" --output text --query "Reservations[*].Instances[*].{Instance:PublicDnsName}")
ssh-add bastion-keypair.pem
ssh ec2-user@$INSTANCE
```

- Commands to create the second EC2 instance and any additional resource required:

```
AWS_ACCESS_KEY_ID=<HOWABOUTNO>
AWS_SECRET_ACCESS_KEY=<NOTTODAYJIM>
AWS_DEFAULT_REGION=us-east-1
aws ec2 create-security-group --group-name c01aws01-private --description "Rules for c01aws01 private hosts"
aws ec2 authorize-security-group-ingress --group-name c01aws01-private --protocol tcp --port 22 --source-group c01aws01
GROUP_ID=$(aws ec2 describe-security-groups --group-name c01aws01-private --output text --query "SecurityGroups[*].{ID:GroupId}")
cat <<EOF | xargs -0 aws ec2 run-instances --cli-input-json
{
  "DryRun": false,
  "ImageId": "ami-09d95fab7fff3776c",
  "KeyName": "private-keypair",
  "InstanceType": "t2.nano",
  "NetworkInterfaces": [
    {
      "DeviceIndex": 0,
      "AssociatePublicIpAddress": false,
      "Groups": [
        "$GROUP_ID"
      ]
    }
  ],
  "TagSpecifications": [
    {
      "ResourceType": "instance",
      "Tags": [
        {
          "Key": "Name",
          "Value": "c01aws01-02"
        }
      ]
    }
  ]
}
EOF

# output

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-09d95fab7fff3776c",
            "InstanceId": "i-03b872cdd49b9b7ea",
            "InstanceType": "t2.nano",
            "KeyName": "private-keypair",
            "LaunchTime": "2020-06-23T05:28:29+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "us-east-1e",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-50-136.ec2.internal",
            "PrivateIpAddress": "172.31.50.136",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-da702be4",
            "VpcId": "vpc-d0dbfbaa",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-06-23T05:28:29+00:00",
                        "AttachmentId": "eni-attach-01d069c721f267a6d",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "c01aws01-private",
                            "GroupId": "sg-0c7a0856198f47207"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:87:9e:bb:9c:f7",
                    "NetworkInterfaceId": "eni-069a0bcf86838d412",
                    "OwnerId": "437637330966",
                    "PrivateDnsName": "ip-172-31-50-136.ec2.internal",
                    "PrivateIpAddress": "172.31.50.136",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-50-136.ec2.internal",
                            "PrivateIpAddress": "172.31.50.136"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-da702be4",
                    "VpcId": "vpc-d0dbfbaa",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "c01aws01-private",
                    "GroupId": "sg-0c7a0856198f47207"
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
                    "Value": "c01aws01-02"
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
    "OwnerId": "437637330966",
    "ReservationId": "r-066a5801d2f9abb27"
}
```

- Commands to connect to the second EC2 instance:

```
AWS_ACCESS_KEY_ID=<HOWABOUTNO>
AWS_SECRET_ACCESS_KEY=<NOTTODAYJIM>
AWS_DEFAULT_REGION=us-east-1
BASTION_INSTANCE=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=c01aws01-01" --output text --query "Reservations[*].Instances[*].{Instance:PublicDnsName}")
ssh-add bastion-keypair.pem
ssh-add private-keypair.pem
ssh -A ec2-user@$BASTION_INSTANCE
ssh ec2-user@ip-172-31-50-136.ec2.internal

#output

[ec2-user@ip-172-31-49-253 ~]$ ssh ec2-user@ip-172-31-50-136.ec2.internal
Last login: Tue Jun 23 06:02:45 2020 from ip-172-31-49-253.ec2.internal

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-172-31-50-136 ~]$
```

---

Answer for exercise [c01-aws01](TBD)
