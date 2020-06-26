# C01-AWS01

## Commands Execution Output

- Commands to create the first EC2 instance and any additional resource required:

Check the current region:

`$ aws configure get region ap-southeast-2`

Generate SSH Key for JumpBox:

`aws ec2 create-key-pair --key-name dajb --query 'KeyMaterial' --output text > dajb.pem`

Protect the key to be acessible only to my user:

`chmod 600 da.pem`

Create a Security Group with port 22 open to the world:

`aws ec2 create-security-group --group-name SSHOpen --description "SG with port 22 open to the world"`
```bash
{
    "GroupId": "sg-063fc9a232e4e2a60"
}
````

Add a rule to allow Port TCP 22 inbound connections from my IP address only

`aws ec2 authorize-security-group-ingress --group-name SSHOpen --protocol tcp --port 22 --cidr 27.33.248.152/32`

Create the VM

`aws ec2 run-instances --image-id resolve:ssm:/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --instance-type t2.micro --count 1 --key-name da --security-group-ids sg-063fc9a232e4e2a60 --associate-public-ip-address`
```bash
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
````
- Commands to connect to the first EC2 instance:

Grab the instance Public IP Address

`aws ec2 describe-instances --query "Reservations[].Instances[].[InstanceId, PublicIpAddress]"`
```bash
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
````
Use SSH to connect

'ssh -i dajp.pem ec2-user@3.25.62.164'

````bash
       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 8 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-36-240 ~]$ exit

````

- Commands to create the second EC2 instance and any additional resource required:

Following the reference video recomentation I will Generate SSH Key for Internal Servers, if the jump box certificate get compromissed, we have a second protective layer


`aws ec2 create-key-pair --key-name dajbint --query 'KeyMaterial' --output text > daint.pem`


Create the internal Security Group

`aws ec2 create-security-group --group-name SSHInternal_Only --description "SG with po
rt 22 open to JP SG"`

````bash
{
    "GroupId": "sg-0a37cdb946425fad7"
}
````

Add a rule the internal Security Group to allow Port 22 ingress only from the Jump Box security as recomended on reference video

`aws ec2 authorize-security-group-ingress --group-name SSHInternal_Only --protocol tcp  --port 22 --source-group sg-063fc9a232e4e2a60`

Create the internal VM without external IP address

`aws ec2 run-instances --image-id resolve:ssm:/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --instance-type t2.micro --count 1 --key-name daint --security-group-ids sg-0a37cdb946425fad7 --no-associate-public-ip-address`
````bash
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
                            "GroupName": "SSHInternal_Only",
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
                    "GroupName": "SSHInternal_Only",
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
````
- Commands to connect to the second EC2 instance:

On recommended video the instructor shows the allow agent forwarding on Putty, I know how to do that on Linux using the ssh config file, but it will be quicker to use the ssh -L to map a local port to a remote address inside the private network.

Connect to Jump Box and map the SSH port to the internal instance IP

`ssh -i dajb.pem -L 2022:172.31.45.51:22 ec2-user@3.25.62.164`

````bash
Last login: Sun Jun 14 10:57:19 2020 from 27-33-248-152.tpgi.com.au

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 8 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-36-240 ~]$
````

Open a new terminal tab connect to the local port mapped to internal host using the internal key

`ssh -i daint.pem -p 2022 ec2-user@localhost`

````bash
The authenticity of host '[localhost]:2022 ([127.0.0.1]:2022)' can't be established.
ECDSA key fingerprint is SHA256:RXOZLAwrXR+E5bfYuVrxM6RWF8GchFDDrUZO67+D3ko.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '[localhost]:2022' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-172-31-45-51 ~]$
````
Well done, I'm connected to the internal EC2 instance!

***
Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws01/README.md)
