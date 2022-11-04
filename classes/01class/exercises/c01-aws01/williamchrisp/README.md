# C01-AWS01

This case is as if you already have created a keypair.

## Creating security groups to be used by aws.
```
aws ec2 create-security-group --group-name williamda-jumphost-sg \
--description "Allow ssh"

{
    "GroupId": "sg-00b420dcb51e04654"
}

aws ec2 create-security-group --group-name williamda-instance-sg \
--description "Allow jumpbox"

{
    "GroupId": "sg-093bc1a55991f5c74"
}

aws ec2 authorize-security-group-ingress --group-id sg-00b420dcb51e04654 \
--protocol tcp \
--port 22 \
--cidr 0.0.0.0/0

{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-0b42bb23cb08e164f",
            "GroupId": "sg-00b420dcb51e04654",
            "GroupOwnerId": "152848913167",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "CidrIpv4": "0.0.0.0/0"
        }
    ]
}

aws ec2 authorize-security-group-ingress --group-id sg-093bc1a55991f5c74 \
--protocol tcp \
--port 22 \
--source-group sg-00b420dcb51e04654

{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-0d3208d82cdfceafb",
            "GroupId": "sg-093bc1a55991f5c74",
            "GroupOwnerId": "152848913167",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "ReferencedGroupInfo": {
                "GroupId": "sg-00b420dcb51e04654"
            }
        }
    ]
}
```

## Creating Instances
```
aws ec2 run-instances --image-id ami-0c641f2290e9cd048 \
--instance-type t2.micro \
--key-name williamchrispjumpbox \
--security-group-ids sg-00b420dcb51e04654 \
--associate-public-ip-address \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=williamjumphost}]'

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-0c641f2290e9cd048",
            "InstanceId": "i-0e83cb700181e32fe",
            "InstanceType": "t2.micro",
            "KeyName": "williamchrispjumpbox",
            "LaunchTime": "2022-08-22T01:02:11+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-42-30.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.42.30",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-70851a39",
            "VpcId": "vpc-e5bc1a82",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "2f696e2f-0824-4473-baf7-f260c2ef8084",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-08-22T01:02:11+00:00",
                        "AttachmentId": "eni-attach-0e88c6c18f3b3cc3b",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "williamda-jumphost-sg",
                            "GroupId": "sg-00b420dcb51e04654"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:09:8c:44:fd:8e",
                    "NetworkInterfaceId": "eni-0b2b7ca136bcb4177",
                    "OwnerId": "152848913167",
                    "PrivateDnsName": "ip-172-31-42-30.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.42.30",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-42-30.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.42.30"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-70851a39",
                    "VpcId": "vpc-e5bc1a82",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "williamda-jumphost-sg",
                    "GroupId": "sg-00b420dcb51e04654"
                }
            ],
            "SourceDestCheck": true,
            "StateReason": {
                "Code": "pending",
                "Message": "pending"
            },
            "Tags": [
                {
                    "Key": "name",
                    "Value": "williamjumphost"
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
    "OwnerId": "152848913167",
    "ReservationId": "r-0d34314a17c354434"
}

aws ec2 run-instances --image-id ami-0c641f2290e9cd048 \
--instance-type t2.micro \
--key-name williamchrisp \
--security-group-ids sg-093bc1a55991f5c74 \
--no-associate-public-ip-address \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=williaminstance}]'

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-0c641f2290e9cd048",
            "InstanceId": "i-0c0dab5e6c57d77c7",
            "InstanceType": "t2.micro",
            "KeyName": "williamchrisp",
            "LaunchTime": "2022-08-22T01:07:05+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-39-33.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.39.33",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-70851a39",
            "VpcId": "vpc-e5bc1a82",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "4ab88d70-b0ab-4e85-b836-17ddbc6148c7",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2022-08-22T01:07:05+00:00",
                        "AttachmentId": "eni-attach-07ccb10bb16ea838d",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "williamda-instance-sg",
                            "GroupId": "sg-093bc1a55991f5c74"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:5f:9a:43:1b:38",
                    "NetworkInterfaceId": "eni-07a3ac5a87757cf42",
                    "OwnerId": "152848913167",
                    "PrivateDnsName": "ip-172-31-39-33.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.39.33",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-39-33.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.39.33"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-70851a39",
                    "VpcId": "vpc-e5bc1a82",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "williamda-instance-sg",
                    "GroupId": "sg-093bc1a55991f5c74"
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
                    "Value": "williaminstance"
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
    "OwnerId": "152848913167",
    "ReservationId": "r-08e940502bb5ba846"
}
```

## Get Instance details and IPs
```
aws ec2 describe-instances --instance-ids i-0e83cb700181e32fe | grep Public
```

## Connecting to Jumpbox and then Instance
```
ssh ec2-user@3.27.23.132                                               
Last login: Mon Aug 22 01:13:03 2022 from 87.121.72.175

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
5 package(s) needed for security, out of 17 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-42-30 ~]$ ssh ec2-user@172.31.39.33

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-172-31-39-33 ~]$ 
```

