ami-02a45d709a415958a
sg-0c5e1f106a7b9ec92
marshalldaniel-test01



### Obtain current public IP
```
curl https://checkip.amazonaws.com/
118.210.125.173
```
### Create new Security Groups
```
aws ec2 create-security-group \
    --group-name marshalldaniel-bastion-sg \
    --description "ssh access from my ip" \
    --region ap-southeast-1

aws ec2 create-security-group \
    --group-name marshalldaniel-private-sg \
    --description "ssh access from bastion" \
    --region ap-southeast-1


{
    "GroupId": "sg-048f019fbf8949900"
}
{
    "GroupId": "sg-0f4a43dce12714f9a"
}
```

### Confirm Security Group creation and ID
```
aws ec2 describe-security-groups \
    --group-names marshalldaniel-bastion-sg \
    --region ap-southeast-1 \
    | grep GroupId

            "GroupId": "sg-048f019fbf8949900",

aws ec2 describe-security-groups \
    --group-names marshalldaniel-private-sg \
    --region ap-southeast-1 \
    | grep GroupId

            "GroupId": "sg-0f4a43dce12714f9a",
```

### Add Security Group ingress rules
```
aws ec2 authorize-security-group-ingress \
    --group-id sg-048f019fbf8949900 \
    --protocol tcp \
    --port 22 \
    --cidr 118.210.125.173/32 \
    --region ap-southeast-1

{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-03463c79604b9b297",
            "GroupId": "sg-048f019fbf8949900",
            "GroupOwnerId": "152848913167",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "CidrIpv4": "118.210.125.173/32"
        }
    ]
}


aws ec2 authorize-security-group-ingress \
    --group-id sg-0f4a43dce12714f9a \
    --protocol tcp \
    --port 22 \
    --source-group sg-048f019fbf8949900 \
    --region ap-southeast-1

{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-06758185768021c95",
            "GroupId": "sg-0f4a43dce12714f9a",
            "GroupOwnerId": "152848913167",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "ReferencedGroupInfo": {
                "GroupId": "sg-048f019fbf8949900"
            }
        }
    ]
}
```

### Create EC2 key pair
```
aws ec2 create-key-pair \
    --key-name marshalldaniel-singapore \
    --region ap-southeast-1

{
    "KeyFingerprint": "63:8a:37:30:06:24:75:20:8e:ec:53:e5:6f:d8:7b:c3:e5:48:dd:a9",
    "KeyMaterial": "<RSA key>"
    "KeyName": "marshalldaniel-singapore",
    "KeyPairId": "<id>"
}
```

### Create .pem file, input rsa content, change permissions
```
touch marshalldaniel-singapore.pem
...
<input rsa KeyMaterial in marshalldaniel-singapore.pem>
...
chmod 400 marshalldaniel-singapore.pem
```

### Create EC2 instances
```
aws ec2 run-instances \
    --image-id ami-02a45d709a415958a \
    --instance-type t3.micro \
    --security-group-ids sg-048f019fbf8949900 \
    --associate-public-ip-address \
    --key-name marshalldaniel-singapore \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=md-bastion}]' \
    --region ap-southeast-1

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-02a45d709a415958a",
            "InstanceId": "i-0f24d81d67f938165",
            "InstanceType": "t3.micro",
            "KeyName": "marshalldaniel-singapore",
            "LaunchTime": "2022-02-18T01:16:57+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-1c",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-3-23.ap-southeast-1.compute.internal",
            "PrivateIpAddress": "172.31.3.23",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-82293ac4",
            "VpcId": "vpc-dc57ddbb",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "b1ecba1e-bf89-4a35-879a-fab42b6d5d9c",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-02-18T01:16:57+00:00",
                        "AttachmentId": "eni-attach-02b7d53cfe92d4eb7",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "marshalldaniel-bastion-sg",
                            "GroupId": "sg-048f019fbf8949900"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "0a:e7:3f:9d:5e:08",
                    "NetworkInterfaceId": "eni-071c9c5fa5b356f60",
                    "OwnerId": "152848913167",
                    "PrivateDnsName": "ip-172-31-3-23.ap-southeast-1.compute.internal",
                    "PrivateIpAddress": "172.31.3.23",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-3-23.ap-southeast-1.compute.internal",
                            "PrivateIpAddress": "172.31.3.23"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-82293ac4",
                    "VpcId": "vpc-dc57ddbb",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "marshalldaniel-bastion-sg",
                    "GroupId": "sg-048f019fbf8949900"
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
                    "Value": "md-bastion"
                }
            ],
            "VirtualizationType": "hvm",
            "CpuOptions": {
                "CoreCount": 1,
                "ThreadsPerCore": 2
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
    "OwnerId": "152848913167",
    "ReservationId": "r-0b4070e1d23635ac1"
}


aws ec2 run-instances \
    --image-id ami-02a45d709a415958a \
    --instance-type t3.micro \
    --security-group-ids sg-0f4a43dce12714f9a \
    --key-name marshalldaniel-singapore \
    --no-associate-public-ip-address \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=md-private}]' \
    --region ap-southeast-1

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-02a45d709a415958a",
            "InstanceId": "i-061acb2d54c17f189",
            "InstanceType": "t3.micro",
            "KeyName": "marshalldaniel-singapore",
            "LaunchTime": "2022-02-18T01:18:18+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-1c",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-15-13.ap-southeast-1.compute.internal",
            "PrivateIpAddress": "172.31.15.13",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-82293ac4",
            "VpcId": "vpc-dc57ddbb",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "e12e1999-faff-4163-9b96-c3645139d403",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-02-18T01:18:18+00:00",
                        "AttachmentId": "eni-attach-02eb53beda8300a8f",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "marshalldaniel-private-sg",
                            "GroupId": "sg-0f4a43dce12714f9a"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "0a:b9:38:8e:af:b2",
                    "NetworkInterfaceId": "eni-08cb527b95928007a",
                    "OwnerId": "152848913167",
                    "PrivateDnsName": "ip-172-31-15-13.ap-southeast-1.compute.internal",
                    "PrivateIpAddress": "172.31.15.13",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-15-13.ap-southeast-1.compute.internal",
                            "PrivateIpAddress": "172.31.15.13"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-82293ac4",
                    "VpcId": "vpc-dc57ddbb",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "marshalldaniel-private-sg",
                    "GroupId": "sg-0f4a43dce12714f9a"
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
                    "Value": "md-private"
                }
            ],
            "VirtualizationType": "hvm",
            "CpuOptions": {
                "CoreCount": 1,
                "ThreadsPerCore": 2
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
    "OwnerId": "152848913167",
    "ReservationId": "r-0607d95ae032979dc"
}
```

### Connect to bastion EC2 instance
```
ssh -A ec2-user@ec2-18-140-248-48.ap-southeast-1.compute.amazonaws.com

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
3 package(s) needed for security, out of 6 available
Run "sudo yum update" to apply all updates.
```

### Connect to private instance from bastion
```
[ec2-user@ip-172-31-3-23 ~]$ ssh ec2-user@172.31.15.13

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
```