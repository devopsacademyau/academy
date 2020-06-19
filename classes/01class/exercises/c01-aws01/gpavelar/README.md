# C01-AWS01

## Commands Execution Output

- Commands to create the first EC2 instance and any additional resource required:
  - What do you need?
    > First of all, you need a key pair and a security group. Select region and Amazon Machine Image(AMI) as well. Some setted configs from DevOps Challenges.

```bash
# Configure
aws configure

# Create key pair
aws ec2 create-key-pair --key-name devops-class --query 'KeyMaterial' --output text > DevOps-academy.pem

# Check my key
aws ec2 describe-key-pairs --key-name devops-class --output table

------------------------------------------------------------------------------------------------------------
|                                             DescribeKeyPairs                                             |
+----------------------------------------------------------------------------------------------------------+
||                                                KeyPairs                                                ||
|+--------------------------------------------------------------+---------------+-------------------------+|
||                        KeyFingerprint                        |    KeyName    |        KeyPairId        ||
|+--------------------------------------------------------------+---------------+-------------------------+|
||  0c:87:be:21:9d:aa:8d:45:d5:93:eb:11:3b:33:32:10:a8:fc:fa:c6 |  devops-class |  key-0a0f1ba7fa681e9fc  ||
|+--------------------------------------------------------------+---------------+-------------------------+|
# output
sg-076a9212c8d1a8a45

# Set the permissions of your private key
chmod 400 DevOps-academy.pem

# Create group
aws ec2 create-security-group --group-name devops-develop --description "DevOps Development group" --vpc-id vpc-37d4dd50

# Describe security groups
aws ec2 describe-security-groups --group-names devops-develop

# Command executed
aws ec2 run-instances \
  --image-id resolve:ssm:/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 \
  --count 1 \
  --instance-type t2.micro \
  --key-name devops-class \
  --user-data file://devopsdata.txt \
  --subnet-id subnet-351ced53 \
  --security-group-ids sg-076a9212c8d1a8a45


```

Used config:

- --image-id: ami-0e4bc04bd401729d6
- --image-id: ami-09d95fab7fff3776c (From Website free tier eligible)
- --image-id resolve:ssm:/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2
- --count: 1
- --instance-type: t2.micro
- --key-name: devops-class
- --user-data: file://devopsdata.txt
- --subnet-id: subnet-351ced53
- --security-group-ids sg-076a9212c8d1a8a45

```bash

# Authorize SSH
# I performed the following command first and it didn't work...
aws ec2 authorize-security-group-ingress --group-id sg-076a9212c8d1a8a45 --protocol tcp --port 22 --cidr 203.0.113.0/24

# So, I performed this one
aws ec2 authorize-security-group-ingress --group-id sg-076a9212c8d1a8a45 --protocol tcp --port 22 --cidr 0.0.0.0/0

```

I needed to learn a little bit about Classless Inter-Domain Routing, so here digged some question about that [here](https://stackoverflow.com/questions/44234374/aws-what-does-0-0-0-0-0-and-0-mean)

- Commands to connect to the first EC2 instance:

  Connecting to the instance requires the following parameters:

  - locate the private key (it was created on the previous exercise) and get information about your instance (my default output was text, At first, I checked this value using a browser) - `i-011d5676d7effc6e0` after that I tried to do the same on CLI

```bash
# Performed to descripe my instance and get ip:
aws ec2 describe-instances --instance-ids i-011d5676d7effc6e0 --output json

```

Output:

```json
{
  "Reservations": [
    {
      "Groups": [],
      "Instances": [
        {
          "AmiLaunchIndex": 0,
          "ImageId": "ami-088ff0e3bde7b3fdf",
          "InstanceId": "i-011d5676d7effc6e0",
          "InstanceType": "t2.micro",
          "KeyName": "devops-class",
          "LaunchTime": "2020-06-19T07:16:34+00:00",
          "Monitoring": {
            "State": "disabled"
          },
          "Placement": {
            "AvailabilityZone": "ap-southeast-2b",
            "GroupName": "",
            "Tenancy": "default"
          },
          "PrivateDnsName": "ip-172-31-0-98.ap-southeast-2.compute.internal",
          "PrivateIpAddress": "172.31.0.98",
          "ProductCodes": [],
          "PublicDnsName": "ec2-3-25-65-76.ap-southeast-2.compute.amazonaws.com",
          "PublicIpAddress": "3.25.65.76",
          "State": {
            "Code": 16,
            "Name": "running"
          },
          "StateTransitionReason": "",
          "SubnetId": "subnet-351ced53",
          "VpcId": "vpc-37d4dd50",
          "Architecture": "x86_64",
          "BlockDeviceMappings": [
            {
              "DeviceName": "/dev/xvda",
              "Ebs": {
                "AttachTime": "2020-06-19T07:16:34+00:00",
                "DeleteOnTermination": true,
                "Status": "attached",
                "VolumeId": "vol-02b9e6acaee6eed82"
              }
            }
          ],
          "ClientToken": "",
          "EbsOptimized": false,
          "EnaSupport": true,
          "Hypervisor": "xen",
          "NetworkInterfaces": [
            {
              "Association": {
                "IpOwnerId": "amazon",
                "PublicDnsName": "ec2-3-25-65-76.ap-southeast-2.compute.amazonaws.com",
                "PublicIp": "3.25.65.76"
              },
              "Attachment": {
                "AttachTime": "2020-06-19T07:16:34+00:00",
                "AttachmentId": "eni-attach-0a033e72901a767c4",
                "DeleteOnTermination": true,
                "DeviceIndex": 0,
                "Status": "attached"
              },
              "Description": "",
              "Groups": [
                {
                  "GroupName": "devops-develop",
                  "GroupId": "sg-076a9212c8d1a8a45"
                }
              ],
              "Ipv6Addresses": [],
              "MacAddress": "02:1d:91:a2:16:0a",
              "NetworkInterfaceId": "eni-09bfaa3a2bafcb736",
              "OwnerId": "478433196210",
              "PrivateDnsName": "ip-172-31-0-98.ap-southeast-2.compute.internal",
              "PrivateIpAddress": "172.31.0.98",
              "PrivateIpAddresses": [
                {
                  "Association": {
                    "IpOwnerId": "amazon",
                    "PublicDnsName": "ec2-3-25-65-76.ap-southeast-2.compute.amazonaws.com",
                    "PublicIp": "3.25.65.76"
                  },
                  "Primary": true,
                  "PrivateDnsName": "ip-172-31-0-98.ap-southeast-2.compute.internal",
                  "PrivateIpAddress": "172.31.0.98"
                }
              ],
              "SourceDestCheck": true,
              "Status": "in-use",
              "SubnetId": "subnet-351ced53",
              "VpcId": "vpc-37d4dd50",
              "InterfaceType": "interface"
            }
          ],
          "RootDeviceName": "/dev/xvda",
          "RootDeviceType": "ebs",
          "SecurityGroups": [
            {
              "GroupName": "devops-develop",
              "GroupId": "sg-076a9212c8d1a8a45"
            }
          ],
          "SourceDestCheck": true,
          "VirtualizationType": "hvm",
          "CpuOptions": {
            "CoreCount": 1,
            "ThreadsPerCore": 1
          },
          "CapacityReservationSpecification": {
            "CapacityReservationPreference": "open"
          },
          "HibernationOptions": {
            "Configured": false
          },
          "MetadataOptions": {
            "State": "applied",
            "HttpTokens": "optional",
            "HttpPutResponseHopLimit": 1,
            "HttpEndpoint": "enabled"
          }
        }
      ],
      "OwnerId": "478433196210",
      "ReservationId": "r-0dbe9c497a8460f09"
    }
  ]
}
```

```bash
# Connecting via SSH to this instance
ssh -i /var/scratch/DevOps_Academy/DevOps-academy.pem  ec2-user@3.25.65.76
# or
ssh -i /var/scratch/DevOps_Academy/DevOps-academy.pem  ec2-user@ec2-3-25-65-76.ap-southeast-2.compute.amazonaws.com

## Output
The authenticity of host '3.25.65.76 (3.25.65.76)' can't be established.
ECDSA key fingerprint is SHA256:Fv9yNqOFVQuU+wl8HKAR8cRV8o0wVHS9cJ4eq7HEqP8.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '3.25.65.76' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 10 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-0-98 ~]$
```

Well, I think it is it. I don't know yet the best way to select an AMI.

- Commands to create the second EC2 instance and any additional resource required:

```bash
# Creating the second EC2.
# Using the same command from previous exercise, but we will add one more option
# To enable or disable the public IP addressing feature using the command line
# Use the following parameter: --associate-public-ip-address or the --no-associate-public-ip-address
aws ec2 run-instances \
  --image-id resolve:ssm:/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 \
  --count 1 \
  --instance-type t2.micro \
  --key-name devops-class \
  --user-data file://devopsdata.txt \
  --subnet-id subnet-351ced53 \
  --security-group-ids sg-076a9212c8d1a8a45 \
  --no-associate-public-ip-address

## Instance ID --  i-02b12a441df42a4ae
# Describing instance
aws ec2 describe-instances --instance-ids i-02b12a441df42a4ae --output json
```

Output:

```json
{
  "Reservations": [
    {
      "Groups": [],
      "Instances": [
        {
          "AmiLaunchIndex": 0,
          "ImageId": "ami-088ff0e3bde7b3fdf",
          "InstanceId": "i-02b12a441df42a4ae",
          "InstanceType": "t2.micro",
          "KeyName": "devops-class",
          "LaunchTime": "2020-06-19T09:29:05+00:00",
          "Monitoring": {
            "State": "disabled"
          },
          "Placement": {
            "AvailabilityZone": "ap-southeast-2b",
            "GroupName": "",
            "Tenancy": "default"
          },
          "PrivateDnsName": "ip-172-31-2-153.ap-southeast-2.compute.internal",
          "PrivateIpAddress": "172.31.2.153",
          "ProductCodes": [],
          "PublicDnsName": "",
          "State": {
            "Code": 16,
            "Name": "running"
          },
          "StateTransitionReason": "",
          "SubnetId": "subnet-351ced53",
          "VpcId": "vpc-37d4dd50",
          "Architecture": "x86_64",
          "BlockDeviceMappings": [
            {
              "DeviceName": "/dev/xvda",
              "Ebs": {
                "AttachTime": "2020-06-19T09:29:06+00:00",
                "DeleteOnTermination": true,
                "Status": "attached",
                "VolumeId": "vol-083c073beeb3cb4cc"
              }
            }
          ],
          "ClientToken": "",
          "EbsOptimized": false,
          "EnaSupport": true,
          "Hypervisor": "xen",
          "NetworkInterfaces": [
            {
              "Attachment": {
                "AttachTime": "2020-06-19T09:29:05+00:00",
                "AttachmentId": "eni-attach-0ababbd8be8576030",
                "DeleteOnTermination": true,
                "DeviceIndex": 0,
                "Status": "attached"
              },
              "Description": "",
              "Groups": [
                {
                  "GroupName": "devops-develop",
                  "GroupId": "sg-076a9212c8d1a8a45"
                }
              ],
              "Ipv6Addresses": [],
              "MacAddress": "02:4b:02:ca:6b:90",
              "NetworkInterfaceId": "eni-0896f569c813a7cf3",
              "OwnerId": "478433196210",
              "PrivateDnsName": "ip-172-31-2-153.ap-southeast-2.compute.internal",
              "PrivateIpAddress": "172.31.2.153",
              "PrivateIpAddresses": [
                {
                  "Primary": true,
                  "PrivateDnsName": "ip-172-31-2-153.ap-southeast-2.compute.internal",
                  "PrivateIpAddress": "172.31.2.153"
                }
              ],
              "SourceDestCheck": true,
              "Status": "in-use",
              "SubnetId": "subnet-351ced53",
              "VpcId": "vpc-37d4dd50",
              "InterfaceType": "interface"
            }
          ],
          "RootDeviceName": "/dev/xvda",
          "RootDeviceType": "ebs",
          "SecurityGroups": [
            {
              "GroupName": "devops-develop",
              "GroupId": "sg-076a9212c8d1a8a45"
            }
          ],
          "SourceDestCheck": true,
          "VirtualizationType": "hvm",
          "CpuOptions": {
            "CoreCount": 1,
            "ThreadsPerCore": 1
          },
          "CapacityReservationSpecification": {
            "CapacityReservationPreference": "open"
          },
          "HibernationOptions": {
            "Configured": false
          },
          "MetadataOptions": {
            "State": "applied",
            "HttpTokens": "optional",
            "HttpPutResponseHopLimit": 1,
            "HttpEndpoint": "enabled"
          }
        }
      ],
      "OwnerId": "478433196210",
      "ReservationId": "r-0927dd5e49e7f6d40"
    }
  ]
}
```

```bash
## Private IP - 172.31.3.15
ssh -i /var/scratch/DevOps_Academy/DevOps-academy.pem  ec2-user@172.31.2.153
ssh: connect to host 172.31.2.153 port 22: Connection timed out
```

- It's not possible to connect via SSH, because it is not available to be accessed.

So we will overcome this step using [SSH Agent](https://aws.amazon.com/blogs/security/securely-connect-to-linux-instances-running-in-a-private-amazon-vpc/). But we need to adapt the command because the OS ([ubuntu command here](https://blog.earth-works.com/2015/01/29/add-an-ec2-pem-key-to-ssh-on-linux-and-mac-os-x/))

```bash
ssh-add /var/scratch/DevOps_Academy/DevOps-academy.pem

ssh -A ec2-user@3.25.65.76
Last login: Fri Jun 19 09:57:06 2020 from 147.10.73.48

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 10 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-0-98 ~]$

# Now accessing the instance that we want
[ec2-user@ip-172-31-0-98 ~]$ ssh ec2-user@172.31.2.153
The authenticity of host '172.31.2.153 (172.31.2.153)' can't be established.
ECDSA key fingerprint is SHA256:fd2nMFYkmUa/hRnBenth4SdIMtFIOAJ+2KN/mbVa6m8.
ECDSA key fingerprint is MD5:da:b1:8f:a2:98:1b:53:9b:aa:17:72:cc:d2:f4:57:b3.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '172.31.2.153' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-172-31-2-153 ~]$


```

**PS**: I ran the command to create instance many times, and I was checking it on amazon console and none of those instance appeared. I realized that I was checking the wrong region... "/. There were 10 instances running hahahhahaha.

---

Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws01/README.md)
