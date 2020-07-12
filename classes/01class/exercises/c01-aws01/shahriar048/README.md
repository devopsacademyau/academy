# C01-AWS01

## Commands Execution Output

- Commands to create the first EC2 instance and any additional resource required:
```
$ `aws configure`

Output:
  AWS Access Key ID [None]: *
  AWS Secret Access Key [None]: *
  Default region name [None]: ap-southeast-2
  Default output format [None]: 
```

```
$ `aws ec2 create-key-pair --key-name MyKeyPair --query 'KeyMaterial' --output text > MyKeyPair.pem`
$ `chmod 400 MyKeyPair.pem`
$ `aws ec2 create-security-group --group-name my-sg --description "My security group" --vpc-id vpc-49e2eb2e`

Output:
    {
        "GroupId": "sg-0d9198b56e119769d"
    }
```

```
$ `aws ec2 authorize-security-group-ingress --group-id sg-0d9198b56e119769d --protocol tcp --port 22 --cidr 194.193.191.30/32`
$ `aws ec2 run-instances \
   	 --image-id ami-03686c686b463366b \
   	 --instance-type t2.micro \
   	 --count 1 \
   	 --subnet-id subnet-969e7cde \
   	 --key-name MyKeyPair \
   	 --security-group-ids sg-0d9198b56e119769d \
   	 --associate-public-ip-address`

Output:
    {
        "Groups": [],
        "Instances": [
            {
                "AmiLaunchIndex": 0,
                "ImageId": "ami-03686c686b463366b",
                "InstanceId": "i-02e9881307f0bb222",
                "InstanceType": "t2.micro",
                "KeyName": "MyKeyPair",
                "LaunchTime": "2020-06-22T09:08:19+00:00",
                "Monitoring": {
                    "State": "disabled"
                },
                "Placement": {
                    "AvailabilityZone": "ap-southeast-2b",
                    "GroupName": "",
                    "Tenancy": "default"
                },
                "PrivateDnsName": "ip-172-31-45-101.ap-southeast-2.compute.internal",
                "PrivateIpAddress": "172.31.45.101",
                "ProductCodes": [],
                "PublicDnsName": "",
                "State": {
                    "Code": 0,
                    "Name": "pending"
                },
                "StateTransitionReason": "",
                "SubnetId": "subnet-969e7cde",
                "VpcId": "vpc-49e2eb2e",
                "Architecture": "x86_64",
                "BlockDeviceMappings": [],
                "ClientToken": "94c024b0-3b3f-407b-9afd-19124620bd7c",
                "EbsOptimized": false,
                "Hypervisor": "xen",
                "NetworkInterfaces": [
                    {
                        "Attachment": {
                            "AttachTime": "2020-06-22T09:08:19+00:00",
                            "AttachmentId": "eni-attach-0c10cae18ff76158a",
                            "DeleteOnTermination": true,
                            "DeviceIndex": 0,
                            "Status": "attaching"
                        },
                        "Description": "",
                        "Groups": [
                            {
                                "GroupName": "my-sg",
                                "GroupId": "sg-0d9198b56e119769d"
                            }
                        ],
                        "Ipv6Addresses": [],
                        "MacAddress": "06:b2:96:05:83:a2",
                        "NetworkInterfaceId": "eni-00fb95d55552b9e0e",
                        "OwnerId": "410368138576",
                        "PrivateDnsName": "ip-172-31-45-101.ap-southeast-2.compute.internal",
                        "PrivateIpAddress": "172.31.45.101",
                        "PrivateIpAddresses": [
                            {
                                "Primary": true,
                                "PrivateDnsName": "ip-172-31-45-101.ap-southeast-2.compute.internal",
                                "PrivateIpAddress": "172.31.45.101"
                            }
                        ],
                        "SourceDestCheck": true,
                        "Status": "in-use",
                        "SubnetId": "subnet-969e7cde",
                        "VpcId": "vpc-49e2eb2e",
                        "InterfaceType": "interface"
                    }
                ],
                "RootDeviceName": "/dev/xvda",
                "RootDeviceType": "ebs",
                "SecurityGroups": [
                    {
                        "GroupName": "my-sg",
                        "GroupId": "sg-0d9198b56e119769d"
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
        "OwnerId": "410368138576",
        "ReservationId": "r-06cb45e5b16fd374d"
    }
```

- Commands to connect to the first EC2 instance:

```
$ `ssh -i MyKeyPair.pem ec2-user@13.211.173.223`

Output:
    The authenticity of host '13.211.173.223 (13.211.173.223)' can't be established.
    ECDSA key fingerprint is SHA256:NK7gpGoTPUEeg6rENKJWLqnP18JnvSVCpk/ZPOAUFtk.
    Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
    Warning: Permanently added '13.211.173.223' (ECDSA) to the list of known hosts.

        __|  __|_  )
        _|  (     /   Amazon Linux AMI
        ___|\___|___|

    https://aws.amazon.com/amazon-linux-ami/2018.03-release-notes/
    5 package(s) needed for security, out of 7 available
    Run "sudo yum update" to apply all updates.
```

- Commands to create the second EC2 instance and any additional resource required:

```
$ `aws ec2 create-security-group --group-name my-sg-2 --description "My security group 2" --vpc-id vpc-49e2eb2e`

Output:
    {
        "GroupId": "sg-0eef4dc48d19491f1"
    }
```

```
$ `aws ec2 authorize-security-group-ingress --group-id sg-0eef4dc48d19491f1 --protocol tcp --port 22 --cidr 172.31.45.101/32`
$ `aws ec2 run-instances \
  	  --image-id ami-03686c686b463366b \
    	--instance-type t2.micro \
    	--count 1 \
    	--subnet-id subnet-969e7cde \
    	--key-name MyKeyPair \
    	--security-group-ids sg-0eef4dc48d19491f1 \
    	--no-associate-public-ip-address`

Output:
    {
        "Groups": [],
        "Instances": [
            {
                "AmiLaunchIndex": 0,
                "ImageId": "ami-03686c686b463366b",
                "InstanceId": "i-0572c8704769af16a",
                "InstanceType": "t2.micro",
                "KeyName": "MyKeyPair",
                "LaunchTime": "2020-06-22T09:56:57+00:00",
                "Monitoring": {
                    "State": "disabled"
                },
                "Placement": {
                    "AvailabilityZone": "ap-southeast-2b",
                    "GroupName": "",
                    "Tenancy": "default"
                },
                "PrivateDnsName": "ip-172-31-39-152.ap-southeast-2.compute.internal",
                "PrivateIpAddress": "172.31.39.152",
                "ProductCodes": [],
                "PublicDnsName": "",
                "State": {
                    "Code": 0,
                    "Name": "pending"
                },
                "StateTransitionReason": "",
                "SubnetId": "subnet-969e7cde",
                "VpcId": "vpc-49e2eb2e",
                "Architecture": "x86_64",
                "BlockDeviceMappings": [],
                "ClientToken": "24252494-a9b8-4594-9df7-7ef9a289d31e",
                "EbsOptimized": false,
                "Hypervisor": "xen",
                "NetworkInterfaces": [
                    {
                        "Attachment": {
                            "AttachTime": "2020-06-22T09:56:57+00:00",
                            "AttachmentId": "eni-attach-0d8c4f683480e6079",
                            "DeleteOnTermination": true,
                            "DeviceIndex": 0,
                            "Status": "attaching"
                        },
                        "Description": "",
                        "Groups": [
                            {
                                "GroupName": "my-sg-2",
                                "GroupId": "sg-0eef4dc48d19491f1"
                            }
                        ],
                        "Ipv6Addresses": [],
                        "MacAddress": "06:d4:dd:09:72:8e",
                        "NetworkInterfaceId": "eni-0b006ad87d5ec9b70",
                        "OwnerId": "410368138576",
                        "PrivateDnsName": "ip-172-31-39-152.ap-southeast-2.compute.internal",
                        "PrivateIpAddress": "172.31.39.152",
                        "PrivateIpAddresses": [
                            {
                                "Primary": true,
                                "PrivateDnsName": "ip-172-31-39-152.ap-southeast-2.compute.internal",
                                "PrivateIpAddress": "172.31.39.152"
                            }
                        ],
                        "SourceDestCheck": true,
                        "Status": "in-use",
                        "SubnetId": "subnet-969e7cde",
                        "VpcId": "vpc-49e2eb2e",
                        "InterfaceType": "interface"
                    }
                ],
                "RootDeviceName": "/dev/xvda",
                "RootDeviceType": "ebs",
                "SecurityGroups": [
                    {
                        "GroupName": "my-sg-2",
                        "GroupId": "sg-0eef4dc48d19491f1"
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
        "OwnerId": "410368138576",
        "ReservationId": "r-06431c6922f2d5d93"
    }
```

- Commands to connect to the second EC2 instance:

```
$ `eval `ssh-agent``

Output:
    Agent pid 6465
```

```
$ `ssh-add MyKeyPair.pem`

Output:
    Identity added: MyKeyPair.pem (MyKeyPair.pem)
```

```
$ `ssh -A ec2-user@13.211.173.223`

Output:
    Last login: Mon Jun 22 09:15:34 2020 from 194-193-191-30.tpgi.com.au

        __|  __|_  )
        _|  (     /   Amazon Linux AMI
        ___|\___|___|

    https://aws.amazon.com/amazon-linux-ami/2018.03-release-notes/
    5 package(s) needed for security, out of 7 available
    Run "sudo yum update" to apply all updates.
```

```
$ `ssh ec2-user@172.31.39.152`

Output:
    The authenticity of host '172.31.39.152 (172.31.39.152)' can't be established.
    ECDSA key fingerprint is SHA256:mbSTyv5tPE+mrQwcqEC791iJYKXxlpGN9KEL89Wd2UY.
    ECDSA key fingerprint is MD5:1d:2c:b1:28:9f:fa:88:0a:62:bb:d1:94:7b:88:4a:e8.
    Are you sure you want to continue connecting (yes/no)? yes
    Warning: Permanently added '172.31.39.152' (ECDSA) to the list of known hosts.

        __|  __|_  )
        _|  (     /   Amazon Linux AMI
        ___|\___|___|

    https://aws.amazon.com/amazon-linux-ami/2018.03-release-notes/

```

***
Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws01/README.md)