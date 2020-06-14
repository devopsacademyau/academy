# C01-AWS01

## Commands Execution Output

- Commands to create the first EC2 instance and any additional resource required:

### Check the current region
$ aws configure get region
ap-southeast-2
**Generate SSH Key for JumpBox**
`aws ec2 create-key-pair --key-name dajb --output text > dajb.pem`
**#protect the key, read only, only to my user**
chmod 400 da.pem
**Create Security Group**
`aws ec2 create-security-group --group-name SSHOpen --description "SG with port 22 open to the world"`
{
    "GroupId": "sg-063fc9a232e4e2a60"
}



**Add rule to allow Port TCP 22 inbond connections**
`aws ec2 authorize-security-group-ingress \`
    `--group-name SSHOpen \`
    `--protocol tcp \`
    `--port 22 \`
    `--cidr 27.33.248.152/32`

**Create the VM**

`aws ec2 run-instances --image-id resolve:ssm:/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --instance-type t2.micro --count 1 --key-name da --security-group-ids sg-063fc9a232e4e2a60 --associate-public-ip-address`
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-02f268a05455dc892",
            "InstanceType": "t2.micro",
            "KeyName": "dajb",
            "LaunchTime": "2020-06-14T03:28:53.000Z",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2b",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-36-240.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.36.240",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-baaffaf3",
            "VpcId": "vpc-9d0f66fa",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "d0602cd8-d08a-4c5c-bb20-1cb9bc03b016",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-06-14T03:28:53.000Z",
                        "AttachmentId": "eni-attach-093d0cc5a57ce1f33",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "SSHOpen",
                            "GroupId": "sg-063fc9a232e4e2a60"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:69:45:23:75:e8",
                    "NetworkInterfaceId": "eni-0324037b1c35182ac",
                    "OwnerId": "165765640813",
                    "PrivateDnsName": "ip-172-31-36-240.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.36.240",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-36-240.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.36.240"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-baaffaf3",
                    "VpcId": "vpc-9d0f66fa",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "SSHOpen",
                    "GroupId": "sg-063fc9a232e4e2a60"
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
    "OwnerId": "165765640813",
    "ReservationId": "r-069bd5f33d2bc601a"
}

- Commands to connect to the first EC2 instance:
**GET IP Address**
`aws ec2 describe-instances --query "Reservations[].Instances[].[InstanceId, PublicIpAddress]"`
[
    [
        "i-0cede1a195229c66b",
        null
    ],
    [
        "i-02f268a05455dc892",
        "3.25.62.164"
    ]
]
**CONNECT**
ssh -i da.pem ec2-user@3.25.62.164
ec2-user@3.25.62.164: Permission denied (publickey,gssapi-keyex,gssapi-with-mic).
cat dajp.pem
cp dajp.pem dajp.pem.old
chmod u+w da.pem
vim dajp.pem - trim the key only
ssh -i da.pem ec2-user@3.25.62.164

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 8 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-36-240 ~]$ exit


- Commands to create the second EC2 instance and any additional resource required:

**Generate SSH Key for Internal Servers**
`aws ec2 create-key-pair --key-name daint --output text > daint.pem`
**#protect the key, read only, only to my user**
chmod 600 daint.pem
**Create Security Group**
`aws ec2 create-security-group --group-name SSHInternal0_Only --description "SG with po
rt 22 open to JP SG"`
{
    "GroupId": "sg-0a37cdb946425fad7"
}

**Allow Port 22 ingress only from the bastion host**
`aws ec2 authorize-security-group-ingress \`
    `--group-name SSHInternal0_Only \`
    `--protocol tcp \`
    `--port 22 \`
    `--source-group sg-063fc9a232e4e2a60`

**Create VM without external IP**
aws ec2 run-instances --image-id resolve:ssm:/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --instance-type t2.micro --count 1 --key-name daint --security-group-ids sg-0a37cdb946425fad7 --no-associate-public-ip-address
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-027fb22ef38cfa584",
            "InstanceType": "t2.micro",
            "KeyName": "daint",
            "LaunchTime": "2020-06-14T11:00:53.000Z",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2b",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-45-51.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.45.51",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-baaffaf3",
            "VpcId": "vpc-9d0f66fa",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "0645c449-96a5-4c8f-89f5-8c324622e776",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-06-14T11:00:53.000Z",
                        "AttachmentId": "eni-attach-09271573d9ddafcab",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "SSHInternal0_Only",
                            "GroupId": "sg-0a37cdb946425fad7"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "06:73:06:3d:c9:68",
                    "NetworkInterfaceId": "eni-032d63845f5976541",
                    "OwnerId": "165765640813",
                    "PrivateDnsName": "ip-172-31-45-51.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.45.51",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-45-51.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.45.51"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-baaffaf3",
                    "VpcId": "vpc-9d0f66fa",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "SSHInternal0_Only",
                    "GroupId": "sg-0a37cdb946425fad7"
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
    "OwnerId": "165765640813",
    "ReservationId": "r-0bcfb66ef8c5318b2"
}
- Commands to connect to the second EC2 instance:
**Connect to Jumpbox and map port to the second host**
ssh -i dajb.pem -L 2022:172.31.45.51:22 ec2-user@3.25.62.164
Last login: Sun Jun 14 10:57:19 2020 from 27-33-248-152.tpgi.com.au

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 8 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-36-240 ~]$
**In a new terminal connect to the port mapping using the internal key**
ssh -i daint.pem -p 2022 ec2-user@localhost
The authenticity of host '[localhost]:2022 ([127.0.0.1]:2022)' can't be established.
ECDSA key fingerprint is SHA256:RXOZLAwrXR+E5bfYuVrxM6RWF8GchFDDrUZO67+D3ko.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '[localhost]:2022' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-172-31-45-51 ~]$
***
Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws01/README.md)
