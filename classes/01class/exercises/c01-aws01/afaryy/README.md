# C01-AWS01

## Commands Execution Output
### 1. Use the CLI to create a new EC2 Instance inside the default VPC with a public IP address and connect to it though SSH.

- Create a user and add aws configure profile
```bash
aws configure --profile devopsacademyau
AWS Access Key ID [None]: ********
AWS Secret Access Key [None]:********
Default region name [None]: ap-southeast-2
Default output format [None]:
```
- Get default VPC id and select one Subnetid:
```bash
aws ec2 describe-vpcs --filters "Name=isDefault, Values=true" |grep VpcId 
# "VpcId": "vpc-c47d41a3",
aws ec2 describe-subnets --filters "Name=vpc-id,Values=vpc-c47d41a3" |grep SubnetId
#             "SubnetId": "subnet-08bf2850",
#             "SubnetId": "subnet-d1e3f598",
#             "SubnetId": "subnet-35b05453",

```
- Creating a Key Pair For the first EC2 instance:
```
aws ec2 create-key-pair --key-name JupmBoxKeyForFirstEC2Instance --query 'KeyMaterial' --output text > JupmBoxKeyForFirstEC2Instance.pem
chmod 400 JupmBoxKeyForFirstEC2Instance.pem
aws ec2 describe-key-pairs --key-nam JupmBoxKeyForFirstEC2Instance
```
- Creating a Security Group for JupmBoxKeyForFirstEC2Instance:
```bash
aws ec2 create-security-group --group-name sg_JupmBox --description "JumpBox Security Group" --vpc-id vpc-c47d41a3
# "GroupId": "sg-06ae9a4efdd9232b8"
```
- ADD Security Group rule for allow to SSH connection for JupmBox:
```bash
# uese your own ip/32 instead of 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-id sg-06ae9a4efdd9232b8 --protocol tcp --port 22 --cidr 0.0.0.0/0 
```
- Creat the first EC2 instance:
https://docs.aws.amazon.com/cli/latest/reference/ec2/run-instances.html
```bash
aws ec2 run-instances \
    --image-id ami-088ff0e3bde7b3fdf \
    --instance-type t2.micro \
    --count 1 \
    --subnet-id subnet-08bf2850 \
    --key-name  JupmBoxKeyForFirstEC2Instance \
    --security-group-ids sg-06ae9a4efdd9232b8 \
    --associate-public-ip-address \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Env,Value=DAtest}]' 
```
output

```
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-088ff0e3bde7b3fdf",
            "InstanceId": "i-0db1e5c0c795260c3",
            "InstanceType": "t2.micro",
            "KeyName": "JupmBoxKeyForFirstEC2Instance",
            "LaunchTime": "2020-07-04T11:01:47+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2c",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-28-1.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "172.31.28.1",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-08bf2850",
            "VpcId": "vpc-c47d41a3",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "785e06b3-ffdf-471a-ae60-5a1f16d6239f",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2020-07-04T11:01:47+00:00",
                        "AttachmentId": "eni-attach-04e8c1c193ebbcfa5",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching"
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "sg_JupmBox",
                            "GroupId": "sg-06ae9a4efdd9232b8"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "0a:f7:61:be:18:2a",
                    "NetworkInterfaceId": "eni-06b0b3edfe735e458",
                    "OwnerId": "421117346104",
                    "PrivateDnsName": "ip-172-31-28-1.ap-southeast-2.compute.internal",
                    "PrivateIpAddress": "172.31.28.1",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-28-1.ap-southeast-2.compute.internal",
                            "PrivateIpAddress": "172.31.28.1"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-08bf2850",
                    "VpcId": "vpc-c47d41a3",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "sg_JupmBox",
                    "GroupId": "sg-06ae9a4efdd9232b8"
                }
            ],
            "SourceDestCheck": true,
            "StateReason": {
                "Code": "pending",
                "Message": "pending"
            },
            "Tags": [
                {
                    "Key": "Env",
                    "Value": "DAtest"
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
    "OwnerId": "******",
    "ReservationId": "r-07ce60996298be481"
}

```
- Connect to the first EC2 instance:
```bash
aws ec2 describe-instances --query "Reservations[*].Instances[*].PublicDnsName" --output=text`
ssh -i "JupmBoxKeyForFirstEC2Instance.pem" ec2-user@ec2-3-106-132-195.ap-southeast-2.compute.amazonaws.com
------
Output:

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
13 package(s) needed for security, out of 22 available
Run "sudo yum update" to apply all updates.

```

### 2. Create another EC2, also using the CLI instance in the same VPC but with private address only and connect to it.
- Creating a Key Pair for the second EC2 instance:
```
aws ec2 create-key-pair --key-name KeyForPrivateEC2Instance --query 'KeyMaterial' --output text > KeyForPrivateEC2Instance.pem
chmod 400 KeyForPrivateEC2Instance.pem
aws ec2 describe-key-pairs --key-nam KeyForPrivateEC2Instance

---output
{
    "KeyPairs": [
        {
            "KeyPairId": "key-0eafa7078a9081554",
            "KeyFingerprint": "f8:b2:ee:9c:6c:0d:3f:b8:85:86:0d:ec:96:31:c8:89:1b:ab:a7:c9",
            "KeyName": "KeyForPrivateEC2Instance",
            "Tags": []
        }
    ]
}

```
- Creating a Security Group for PrivateEC2Instance:
```bash
aws ec2 create-security-group --group-name sg_privateInstance --description "Private Address Access Security Group" --vpc-id vpc-c47d41a3
#output: "GroupId": "sg-049438e501c4c9f62"
```
- ADD Security Group rule for allow to SSH connection from JupmBox:
```bash
# use jumpbox security group instead of ip/32
aws ec2 authorize-security-group-ingress --group-id sg-049438e501c4c9f62 --protocol tcp --port 22 --cidr 172.31.28.1/32
#sg-06ae9a4efdd9232b8
```
- Creat the Second EC2 instance:
https://docs.aws.amazon.com/cli/latest/reference/ec2/run-instances.html
```bash
aws ec2 run-instances \
    --name da-ec2-2 \
    --image-id ami-088ff0e3bde7b3fdf \
    --instance-type t2.micro \
    --count 1 \
    --subnet-id subnet-d1e3f598 \
    --key-name  KeyForPrivateEC2Instance \
    --security-group-ids sg-049438e501c4c9f62 \
    --associate-public-ip-address \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Env,Value=DAtest}]' 
```
- Connect to the second EC2 instance:

https://aws.amazon.com/blogs/security/securely-connect-to-linux-instances-running-in-a-private-amazon-vpc/
```bash
# for mac/linux os
#For Mac users, ssh-agent is already installed as part of the OS. You can add your private keys to the keychain application by using the ssh-add command with the -K option and the .pem file for the key, as shown in the following example. The agent prompts you for your passphrase, if there is one, and stores the private key in memory and the passphrase in your keychain
ssh-add KeyForPrivateEC2Instance.pem 
ssh -i "JupmBoxKeyForFirstEC2Instance.pem" ec2-user@ec2-3-106-132-195.ap-southeast-2.compute.amazonaws.com
ssh ec2-user@172.31.33.50
# for windows os
#Use PUTTY Key Generator to import .pem format key and save .ppk format private key; 
#use Pageant to add keys of two EC2 instance to the key lists;
#configure the connections for SSH in PuTTY(Host name ec2-user@ec2-3-106-132-195.ap-southeast-2.compute.amazonaws.com), check the Allow agent forwarding box and leave the Private key file for authentication field empty, then connect from the Jumpbox to the second instance without having the SSH private key on the JumpBox. To connect to second instance, use the following command: 

#ssh user@<instance-IP-address or DNS-entry>
ssh ec2-user@172.31.33.50
--Output:
[ec2-user@ip-172-31-28-1 ~]$ ssh ec2-user@172.31.33.50

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
13 package(s) needed for security, out of 22 available
Run "sudo yum update" to apply all updates.
```


<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws01/README.md)