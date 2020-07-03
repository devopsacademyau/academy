# C01-AWS01

## Commands Execution Output

- Commands to create the first EC2 instance and any additional resource required:
```
>create a Key pair to connect instance by ssh
$ aws ec2 create-key-pair --key-name MDevopsC01 --query 'KeyMaterial' --output text >MDevopsC01.pem

>show my Keypair
$ aws ec2 describe-key-pairs --key-name MDevopsC01

>create a sg( security group)
$ aws ec2 create-security-group --group-name MDevopsC01SG --description "My Security Group for Devops" --vpc-id vpc-ac525bcb
{
    "GroupId": "sg-0a851daf83faac5af"
}

>Create EC2 Instance
$ aws ec2 run-instances --image-id ami-088ff0e3bde7b3fdf --count 1 --instance-type t2.micro --key-name MDevopsC01 --security-group-ids sg-0a851daf83faac5af --subnet-id subnet-10553548 

{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-0d9b6517ea06f64fe",
            "InstanceType": "t2.micro",
            "KeyName": "MDevopsC01",
            "LaunchTime": "2020-06-17T06:10:04.000Z",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2c",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-17-108.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.17.108",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-10553548",
            "VpcId": "vpc-ac525bcb",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-06-17T06:10:04.000Z",
                        "AttachmentId": "eni-attach-0960b4999a5ba7798",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "MDevopsC01SG",
                            "GroupId": "sg-0a851daf83faac5af"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "0a:db:18:7a:e2:78",
                    "NetworkInterfaceId": "eni-039f964d8a771ef2e",
                    "OwnerId": "490308117505",
                    "PrivateDnsName": "ip-172-31-17-108.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.17.108",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-17-108.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.17.108"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-10553548",
                    "VpcId": "vpc-ac525bcb",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "MDevopsC01SG",
                    "GroupId": "sg-0a851daf83faac5af"
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
    "OwnerId": "490308117505",
    "ReservationId": "r-09166cc7f910f0d98"
}
```

- Commands to connect to the first EC2 instance:
```
Add your commands and their outputs here
```
ssh -i C:\Users\mari_\Documents\Australia\DevopsAcademy ec2-user@ec2-13-211-253-58.ap-southeast-2.compute.amazonaws.com

The authenticity of host 'ec2-13-211-253-58.ap-southeast-2.compute.amazonaws.com (13.211.253.58)' can't be established.
ECDSA key fingerprint is Key
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'ec2-13-211-253-58.ap-southeast-2.compute.amazonaws.com,13.211.253.58' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 10 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-17-108 ~]$ 


- Commands to create the second EC2 instance and any additional resource required:
```
 $aws ec2 run-instances --image-id ami-088ff0e3bde7b3fdf --count 1 --instance-type t2.micro --key-name MDevopsC01 --security-group-ids sg-0a851daf83faac5af --no-associate-public-ip-address

 {
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-060e9607aa1bde3fb",
            "InstanceType": "t2.micro",
            "KeyName": "MDevopsC01",
            "LaunchTime": "2020-06-23T07:03:52.000Z",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-40-40.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.40.40",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-bb6487f3",
            "VpcId": "vpc-ac525bcb",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-06-23T07:03:52.000Z",
                        "AttachmentId": "eni-attach-0e9ad995b6f411547",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "MDevopsC01SG",
                            "GroupId": "sg-0a851daf83faac5af"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:0e:5b:22:61:ec",
                    "NetworkInterfaceId": "eni-0d0b9bc37698c2b90",
                    "OwnerId": "490308117505",
                    "PrivateDnsName": "ip-172-31-40-40.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.40.40",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-40-40.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.40.40"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-bb6487f3",
                    "VpcId": "vpc-ac525bcb",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "MDevopsC01SG",
                    "GroupId": "sg-0a851daf83faac5af"
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
    "OwnerId": "490308117505",
    "ReservationId": "r-0821f49959727b5fd"
}

```

- Commands to connect to the second EC2 instance:
```
I couldn't connect to the second instance straight way because it only have a private IP, so I used my first EC2 instance to connect to the second one, before to connect with it I needed to add my Key pairs to my first EC2 instance.

Adding the private key (PEM file) to the key chain. This allows the user to access the private instances without copying to the bastion host.
➜  local git:(master) ✗ ssh-add -k MDevopsC01.pem 
Identity added: MDevopsC01.pem (MDevopsC01.pem)

Check whether the private key is properly added to the key chain
➜  local git:(master) ✗ ssh-add -L

Access the private instance
➜  local git:(master) ✗ ssh -A ec2-user@ec2-13-211-253-58.ap-southeast-2.compute.amazonaws.com
Last login: Thu Jul  2 11:38:58 2020 from 101.116.206.49

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
14 package(s) needed for security, out of 24 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-17-108 ~]$ ssh ec2-user@172.31.39.123
Last login: Thu Jul  2 11:36:12 2020 from ip-172-31-17-108.ap-southeast-2.compute.internal

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-172-31-39-123 ~]$ 

```

***
Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws01/README.md)