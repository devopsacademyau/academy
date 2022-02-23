# Create security groups 
***Command:***
aws ec2 create-security-group \
    --group-name Bastion-SG \
    --description "Security group for bastion host" \
    --tag-specifications ResourceType="security-group",Tags='[{Key="Name",Value="Bastion-SG"}]' \
    --region ap-southeast-2

***Output:***
{
    "GroupId": "sg-0cfee122284989003",
    "Tags": [
        {
            "Key": "Name",
            "Value": "Bastion-SG"
        }
    ]
}

***Command:***
aws ec2 create-security-group \
    --group-name Private-EC2-SG \
    --description "Security group for private EC2 instances" \
    --tag-specifications ResourceType="security-group",Tags='[{Key="Name",Value="Private-EC2-SG"}]' \
    --region ap-southeast-2

***Output:***
{
    "GroupId": "sg-0249922d4e1bbedc5",
    "Tags": [
        {
            "Key": "Name",
            "Value": "Private-EC2-SG"
        }
    ]
}

# Output security group ID for next steps
***Command:***
aws ec2 describe-security-groups \
    --group-names Bastion-SG \
    --region ap-southeast-2 \
    | grep GroupId

***Output:***
"GroupId": "sg-0cfee122284989003",

***Command:***
aws ec2 describe-security-groups \
    --group-names Private-EC2-SG \
    --region ap-southeast-2 \
    | grep GroupId

***Output:***
"GroupId": "sg-0249922d4e1bbedc5",

# Add security group ingress rules
***Command:***
aws ec2 authorize-security-group-ingress \
    --group-id sg-0cfee122284989003 \
    --ip-permissions IpProtocol=tcp,FromPort=22,ToPort=22,IpRanges='[{CidrIp=1.158.41.73/32,Description="SSH access from local"}]' \
    --tag-specifications ResourceType="security-group-rule",Tags='[{Key="Name",Value="SSH access from local"}]' \
    --region ap-southeast-2

***Output:***
{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-077e5e300bfba56d0",
            "GroupId": "sg-0cfee122284989003",
            "GroupOwnerId": "969496245957",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "CidrIpv4": "1.158.41.73/32",
            "Description": "SSH access from local",
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "SSH access from local"
                }
            ]
        }
    ]
}

***Command:***
aws ec2 authorize-security-group-ingress \
    --group-id sg-0249922d4e1bbedc5 \
    --ip-permissions IpProtocol=tcp,FromPort=22,ToPort=22,UserIdGroupPairs='[{GroupId="sg-0cfee122284989003",Description="SSH access from bastion"}]' \
    --tag-specifications ResourceType="security-group-rule",Tags='[{Key="Name",Value="SSH access from bastion"}]' \
    --region ap-southeast-2

***Output:***
{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-0c29feaf1eae9f16b",
            "GroupId": "sg-0249922d4e1bbedc5",
            "GroupOwnerId": "969496245957",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "ReferencedGroupInfo": {
                "GroupId": "sg-0cfee122284989003"
            },
            "Description": "SSH access from bastion",
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "SSH access from bastion"
                }
            ]
        }
    ]
}

# Create EC2 key pair
***Command:***
aws ec2 create-key-pair \
    --key-name EC2-KeyPair-Sydney \
    --key-type rsa \
    --tag-specifications ResourceType="key-pair",Tags='[{Key="Name",Value="EC2-KeyPair-Sydney"}]' \
    --region ap-southeast-2 \
    --query 'KeyMaterial' \
    --output text > EC2-KeyPair-Sydney.pem

***Output:***
➜  vishaalpal git:(vishaalpal/c01-aws01) ✗ cat EC2-KeyPair-Sydney.pem 
-----BEGIN RSA PRIVATE KEY-----
<REDACTED>
-----END RSA PRIVATE KEY-----

# Change permissions of the key pair so only you can read it
***Command:***
chmod 400 EC2-KeyPair-Sydney.pem

# Create bastion ec2 instance
***Command:***
aws ec2 run-instances \
    --image-id ami-0a4e637babb7b0a86 \
    --instance-type t3.micro \
    --security-group-ids sg-0cfee122284989003 \
    --associate-public-ip-address \
    --key-name EC2-KeyPair-Sydney \
    --tag-specifications ResourceType="instance",Tags='[{Key="Name",Value="Bastion-Host"}]' \
    --region ap-southeast-2 \
    --query 'Instances[].{vpc_id: VpcId, subnet_id: SubnetId, az_id: Placement.AvailabilityZone, instance_id: InstanceId, ami_id: ImageId, instance_type: InstanceType, key_pair: KeyName, eni_id: NetworkInterfaces[0].NetworkInterfaceId, sg_id: SecurityGroups[0].GroupId, sg_name: SecurityGroups[0].GroupName, private_dns_name: NetworkInterfaces[0].PrivateDnsName, private_ip_address: NetworkInterfaces[0].PrivateIpAddress, public_dns_name: NetworkInterfaces[0].PublicDnsName, public_ip_address: NetworkInterfaces[0].PublicIpAddress, launch_time: LaunchTime, current_state: State.Name}'

***Output:***
[
    {
        "vpc_id": "vpc-0a86e6ea6dc3e560e",
        "subnet_id": "subnet-0b9ea22221a94add7",
        "az_id": "ap-southeast-2a",
        "instance_id": "i-09987bd7975bce5d4",
        "ami_id": "ami-0a4e637babb7b0a86",
        "instance_type": "t3.micro",
        "key_pair": "EC2-KeyPair-Sydney",
        "eni_id": "eni-0653aa9f88ef2570e",
        "sg_id": "sg-0cfee122284989003",
        "sg_name": "Bastion-SG",
        "private_dns_name": "ip-172-31-11-87.ap-southeast-2.compute.internal",
        "private_ip_address": "172.31.11.87",
        "public_dns_name": null,
        "public_ip_address": null,
        "launch_time": "2022-02-23T02:24:44+00:00",
        "current_state": "pending"
    }
]

# Create private ec2 instance
***Command:***
aws ec2 run-instances \
    --image-id ami-0a4e637babb7b0a86 \
    --instance-type t3.micro \
    --security-group-ids sg-0249922d4e1bbedc5 \
    --key-name EC2-KeyPair-Sydney \
    --no-associate-public-ip-address \
    --tag-specifications 'ResourceType=instance,Tags=[{Key="Name",Value="Private-instance"}]' \
    --region ap-southeast-2 \
    --query 'Instances[].{vpc_id: VpcId, subnet_id: SubnetId, az_id: Placement.AvailabilityZone, instance_id: InstanceId, ami_id: ImageId, instance_type: InstanceType, key_pair: KeyName, eni_id: NetworkInterfaces[0].NetworkInterfaceId, sg_id: SecurityGroups[0].GroupId, sg_name: SecurityGroups[0].GroupName, private_dns_name: NetworkInterfaces[0].PrivateDnsName, private_ip_address: NetworkInterfaces[0].PrivateIpAddress, public_dns_name: NetworkInterfaces[0].PublicDnsName, public_ip_address: NetworkInterfaces[0].PublicIpAddress, launch_time: LaunchTime, current_state: State.Name}'

***Output:***
[
    {
        "vpc_id": "vpc-0a86e6ea6dc3e560e",
        "subnet_id": "subnet-0b9ea22221a94add7",
        "az_id": "ap-southeast-2a",
        "instance_id": "i-0883f9bef57b0c607",
        "ami_id": "ami-0a4e637babb7b0a86",
        "instance_type": "t3.micro",
        "key_pair": "EC2-KeyPair-Sydney",
        "eni_id": "eni-04f8dd2985c1aa8fc",
        "sg_id": "sg-0249922d4e1bbedc5",
        "sg_name": "Private-EC2-SG",
        "private_dns_name": "ip-172-31-6-87.ap-southeast-2.compute.internal",
        "private_ip_address": "172.31.6.87",
        "public_dns_name": null,
        "public_ip_address": null,
        "launch_time": "2022-02-23T02:25:29+00:00",
        "current_state": "pending"
    }
]

# SSH to bastion instance from local
***Command:***
ssh -A ec2-user@ec2-13-211-19-39.ap-southeast-2.compute.amazonaws.com

***Output:***
➜  vishaalpal git:(vishaalpal/c01-aws01) ✗ ssh -A ec2-user@ec2-13-211-19-39.ap-southeast-2.compute.amazonaws.com
Last login: Wed Feb 23 02:30:00 2022 from 1.158.41.73

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
8 package(s) needed for security, out of 14 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-11-87 ~]$ 

# SSH to private instance from bastion
***Command:***
ssh ec2-user@172.31.6.87

***Output:***
[ec2-user@ip-172-31-11-87 ~]$ ssh ec2-user@172.31.6.87

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-172-31-6-87 ~]$ 
