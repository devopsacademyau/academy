- Use the CLI to create a new EC2 Instance inside the default VPC with a public IP address and connect to it though SSH.
- Commands to create the first EC2 instance and any additional resource required:

z@bacon:~$ aws ec2 create-key-pair --key-name aws01kp --query 'KeyMaterial' --output text > aws01kp.pem
z@bacon:~$ chmod 400 aws01kp.pem
z@bacon:~$  aws ec2 describe-key-pairs --key-name aws01kp
{
    "KeyPairs": [
        {
            "KeyPairId": "key-0c422ef573f98bc10",
            "KeyFingerprint": "02:06:63:9e:71:1f:ce:a0:3d:74:4d:13:e7:96:f8:cb:cc:9a:05:ce",
            "KeyName": "aws01kp",
            "Tags": []
        }
    ]
}
z@bacon:~$ aws ec2 create-security-group --group-name my-sg --description "My security group" 
{
    "GroupId": "sg-0aa6a164d5faaf958"
}
z@bacon:~$ aws ec2 authorize-security-group-ingress --group-name my-sg --protocol tcp --port 22 --cidr 180.150.38.8/32
z@bacon:~$ aws ec2 describe-security-groups --group-name my-sg
{
    "SecurityGroups": [
        {
            "Description": "My security group",
            "GroupName": "my-sg",
            "IpPermissions": [
                {
                    "FromPort": 22,
                    "IpProtocol": "tcp",
                    "IpRanges": [
                        {
                            "CidrIp": "180.150.38.8/32"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 22,
                    "UserIdGroupPairs": []
                }
            ],
            "OwnerId": "512742231244",
            "GroupId": "sg-0aa6a164d5faaf958",
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
            "VpcId": "vpc-ce545da9"
        }
    ]
}
z@bacon:~$ aws ec2 run-instances --image-id ami-088ff0e3bde7b3fdf --instance-type t2.micro --count 1 --key-name aws01kp --associate-public-ip-address --security-group-ids sg-0aa6a164d5faaf958
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-00cb16d60056e7353",
            "InstanceType": "t2.micro",
            "KeyName": "aws01kp",
            "LaunchTime": "2020-06-16T04:57:30.000Z",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-36-157.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.36.157",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-48638000",
            "VpcId": "vpc-ce545da9",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-06-16T04:57:30.000Z",
                        "AttachmentId": "eni-attach-096dba423068a1b70",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "my-sg",
                            "GroupId": "sg-0aa6a164d5faaf958"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:f3:0d:d2:86:84",
                    "NetworkInterfaceId": "eni-074f30fe2b7631c58",
                    "OwnerId": "512742231244",
                    "PrivateDnsName": "ip-172-31-36-157.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.36.157",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-36-157.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.36.157"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-48638000",
                    "VpcId": "vpc-ce545da9",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "my-sg",
                    "GroupId": "sg-0aa6a164d5faaf958"
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
    "OwnerId": "512742231244",
    "ReservationId": "r-07cc8f6e71d7afe6e"
}


- Commands to connect to the first EC2 instance:

z@bacon:~$ ssh -i awskp01.pem ec2-user@13.239.28.37
Warning: Identity file awskp01.pem not accessible: No such file or directory.
The authenticity of host '13.239.28.37 (13.239.28.37)' can't be established.
ECDSA key fingerprint is SHA256:ewimNRcdoLHVsDfJ4iebEcWD920WprRuJxRiQOZkphw.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '13.239.28.37' (ECDSA) to the list of known hosts.
ec2-user@13.239.28.37: Permission denied (publickey,gssapi-keyex,gssapi-with-mic).
z@bacon:~$ aws ec2 describe-instances --query "Reservations[].Instances[].[InstanceId, PublicIpAddress]"
[
    [
        "i-07b1ba8023f12e889",
        null
    ],
    [
        "i-00cb16d60056e7353",
        "13.239.28.37"
    ]
]
z@bacon:~$ ssh -i awskp01.pem ec2-user@13.239.28.37
Warning: Identity file awskp01.pem not accessible: No such file or directory.
z@bacon:~$ sudo chmod 400 aws01kp.pem
[sudo] password for z: 
z@bacon:~$ ssh -i aws01kp.pem ec2-user@13.239.28.37

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 8 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-36-157 ~]$ 



- Create another EC2, also using the CLI instance in the same VPC but with private address only and connect to it.
- Commands to create the second EC2 instance and any additional resource required:
z@bacon:~$ aws ec2 create-key-pair --key-name paws01kp --query 'KeyMaterial' --output text > paws01kp.pem
z@bacon:~$ sudo chmod 400 paws01kp.pem
[sudo] password for z: 
z@bacon:~$ aws ec2 create-security-group --group-name SecureGroup --description  "Secure group for DOA"
{
    "GroupId": "sg-09c8bcfe909954f1a"
}
z@bacon:~$ aws ec2 authorize-security-group-ingress --group-name SecureGroup --protocol tcp --port 22 --cidr 180.150.38.8/32
z@bacon:~$ aws ec2 describe-security-groups --group-name SecureGroup
{
    "SecurityGroups": [
        {
            "Description": "Secure group for DOA",
            "GroupName": "SecureGroup",
            "IpPermissions": [
                {
                    "FromPort": 22,
                    "IpProtocol": "tcp",
                    "IpRanges": [
                        {
                            "CidrIp": "180.150.38.8/32"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 22,
                    "UserIdGroupPairs": []
                }
            ],
            "OwnerId": "512742231244",
            "GroupId": "sg-09c8bcfe909954f1a",
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
            "VpcId": "vpc-ce545da9"
        }
    ]
}
z@bacon:~$ aws ec2 run-instances --image-id ami-088ff0e3bde7b3fdf --instance-type t2.micro --count 1 --key-name paws01kp --no-associate-public-ip-address --security-group-ids sg-09c8bcfe909954f1a
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-08b574c6436ac7ad8",
            "InstanceType": "t2.micro",
            "KeyName": "paws01kp",
            "LaunchTime": "2020-06-16T06:43:58.000Z",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-45-4.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.45.4",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-48638000",
            "VpcId": "vpc-ce545da9",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-06-16T06:43:58.000Z",
                        "AttachmentId": "eni-attach-0f2eb3e32c4e8fde4",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "SecureGroup",
                            "GroupId": "sg-09c8bcfe909954f1a"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:87:b3:bd:c3:20",
                    "NetworkInterfaceId": "eni-01e2e4d50fd097c6b",
                    "OwnerId": "512742231244",
                    "PrivateDnsName": "ip-172-31-45-4.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.45.4",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-45-4.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.45.4"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-48638000",
                    "VpcId": "vpc-ce545da9",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "SecureGroup",
                    "GroupId": "sg-09c8bcfe909954f1a"
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
    "OwnerId": "512742231244",
    "ReservationId": "r-05d1863c7d002fa30"
}
- Commands to connect to the second EC2 instance:
z@bacon:~$ eval 'ssh-agent'
SSH_AUTH_SOCK=/tmp/ssh-22FZ7c7j6uMf/agent.203040; export SSH_AUTH_SOCK;
SSH_AGENT_PID=203041; export SSH_AGENT_PID;
echo Agent pid 203041;
z@bacon:~$ aws ec2 describe-instances --query "Reservations[].Instances[].[InstanceId, PublicIpAddress]"
[
    [
        "i-07b1ba8023f12e889",
        null
    ],
    [
        "i-08b574c6436ac7ad8",
        null
    ],
    [
        "i-00cb16d60056e7353",
        "13.239.28.37"
    ]
]
z@bacon:~$ ssh ec2-user@13.239.28.37
ec2-user@13.239.28.37: Permission denied (publickey,gssapi-keyex,gssapi-with-mic).
z@bacon:~$ ssh-add paws01kp.pem
Identity added: paws01kp.pem (paws01kp.pem)
z@bacon:~$ ssh ec2-user@13.239.28.37
Last login: Tue Jun 16 05:23:39 2020 from 180-150-38-8.b49626.bne.nbn.aussiebb.net

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 8 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-36-157 ~]$ 



<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws01/README.md)
