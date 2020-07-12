# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```

aws ec2 create-key-pair --key-name MyDevopsAcademyKey --query 'KeyMaterial' --output text > MyDevopsAcademyKey.pem

chmod 400 MyDevopsAcademyKey.pem
aws ec2 describe-key-pairs --key-name MyDevopsAcademyKey

{
    "KeyPairs": [
        {
            "KeyPairId": "key-0a6c15ee8a73aa66c",
            "KeyFingerprint": "0e:a4:1b:5b:67:f4:74:79:30:92:7b:93:d7:ad:b8:6b:a8:fd:98:80",
            "KeyName": "MyDevopsAcademyKey",
            "Tags": []
        }
    ]
}

aws ec2 run-instances \
    --image-id ami-0bc49f9283d686bab \
    --instance-type t2.micro \
    --count 1 \
    --subnet-id subnet-0c341aabdd7fc51d6 \
    --key-name MyDevopsAcademyKey \
    --security-group-ids sg-06d7c95453582cf5b \
    --associate-public-ip-address

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-0bc49f9283d686bab",
            "InstanceId": "i-0252b5f4d0539a8b1",
            "InstanceType": "t2.micro",
            "KeyName": "MyDevopsAcademyKey",
            "LaunchTime": "2020-07-07T22:35:54+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-10-0-179-210.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "10.0.179.210",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0c341aabdd7fc51d6",
            "VpcId": "vpc-018717ea8ed22e6ae",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-07-07T22:35:54+00:00",
                        "AttachmentId": "eni-attach-0b577c62181223da8",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "public-sg",
                            "GroupId": "sg-06d7c95453582cf5b"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:cf:74:19:d0:ac",
                    "NetworkInterfaceId": "eni-036b95548c9ee7a1a",
                    "OwnerId": "873547843801",
                    "PrivateIpAddress": "10.0.179.210",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "10.0.179.210"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0c341aabdd7fc51d6",
                    "VpcId": "vpc-018717ea8ed22e6ae",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/sda1",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "public-sg",
                    "GroupId": "sg-06d7c95453582cf5b"
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
    "OwnerId": "873547843801",
    "ReservationId": "r-0122f8968cadf6f6b"
}

```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```

aws ec2 run-instances \
    --image-id ami-0bc49f9283d686bab \
    --instance-type t2.micro \
    --count 1 \
    --key-name MyDevopsAcademyKey \
    --network-interfaces '[{"DeviceIndex":0,"NetworkInterfaceId":"eni-09ec9a93ec3352adf"}]'

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-0bc49f9283d686bab",
            "InstanceId": "i-0603df7fff1d05b6e",
            "InstanceType": "t2.micro",
            "KeyName": "MyDevopsAcademyKey",
            "LaunchTime": "2020-07-07T22:47:13+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-10-0-0-15.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "10.0.0.15",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0525ca8d01593ccbb",
            "VpcId": "vpc-018717ea8ed22e6ae",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-07-07T22:47:13+00:00",
                        "AttachmentId": "eni-attach-0f78dfa0ce1b71df9",
                        "DeleteOnTermination": false,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "my network interface with my private subnet",
                    "Groups": [
                        {
                            "GroupId": "sg-0824e1528809be815"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:6c:51:40:de:7c",
                    "NetworkInterfaceId": "eni-09ec9a93ec3352adf",
                    "OwnerId": "873547843801",
                    "PrivateIpAddress": "10.0.0.15",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "10.0.0.15"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0525ca8d01593ccbb",
                    "VpcId": "vpc-018717ea8ed22e6ae",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/sda1",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupId": "sg-0824e1528809be815"
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
    "OwnerId": "873547843801",
    "ReservationId": "r-048cd0cf495035c29"
}


```

- Commands for accessing your public instance using ssh

```

eval `ssh-agent`
ssh-add MyDevopsAcademyKey.pem
ssh -A ubuntu@54.252.222.32

```

- Commands for accessing your private instance from public one

```
ssh -i "MyDevopsAcademyKey.pem" ubuntu@10.0.0.15

```

- Commands for testing ping to `8.8.8.8` from private instance

```
aws ec2 allocate-address
aws ec2 create-nat-gateway --subnet-id subnet-0c341aabdd7fc51d6 --allocation-id eipalloc-005d5a4cb506c3b74

{
    "NatGateway": {
        "CreateTime": "2020-07-07T23:25:01+00:00",
        "NatGatewayAddresses": [
            {
                "AllocationId": "eipalloc-005d5a4cb506c3b74"
            }
        ],
        "NatGatewayId": "nat-0ccfb362fa34c13ec",
        "State": "pending",
        "SubnetId": "subnet-0c341aabdd7fc51d6",
        "VpcId": "vpc-018717ea8ed22e6ae"
    }
}

aws ec2 create-route --route-table-id rtb-09c2eb65883c6defd --destination-cidr-block 0.0.0.0/0 --nat-gateway-id nat-0ccfb362fa34c13ec

ubuntu@ip-10-0-0-15:~$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=107 time=1.34 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=107 time=1.08 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=107 time=1.11 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=107 time=1.12 ms
^C
--- 8.8.8.8 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3004ms
rtt min/avg/max/mdev = 1.086/1.167/1.344/0.110 ms


aws ec2 delete-nat-gateway --nat-gateway-id nat-0ccfb362fa34c13ec
aws ec2 release-address --allocation-id eipalloc-005d5a4cb506c3b74

```

- Any extra challenges faced?

Yes, struggled to create the NAT gateway in the correct subnet, thought is suppose to connect to a private subnet, so it gives the private subnet an elastic IP address to connect to the internet, but only worked after I created connected to the public subnet. Had to recreate plenty of times to make it work.


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)