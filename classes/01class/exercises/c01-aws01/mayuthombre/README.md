# C01-AWS01

## Commands Execution Output

# AWS CLI installation
Download the file using the curl command. The -o option specifies the file name that the downloaded package is written to. In this example, the file is written to AWSCLIV2.pkg in the current folder.

```
$ curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
```
Run the standard macOS installer program
```
$ sudo installer -pkg ./AWSCLIV2.pkg -target /
```
# Configure AWS 

The aws configure command is the fastest way to set up your AWS CLI installation. When you enter this command, the AWS CLI prompts you for four pieces of information:

Access key ID
Secret access key
AWS Region
Output format

# Allow connection requests from Public internet

In order to allow connection request through SSH, first we need to create a security group and then allow connection requests on port 22 via Ingress rule. Outbound requests are automatically taken care of for any IP that is requesting inbound connection. 

```
aws ec2 create-security-group --group-name WebAccess --description "My security group" --vpc-id vpc-1dc54c66

Output
{
    "GroupId": "sg-087afe8df7adbfd0f"
}

aws ec2 authorize-security-group-ingress --group-id sg-087afe8df7adbfd0f --protocol tcp --port 22 --cidr 0.0.0.0/0

Output
{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-079db95e23c2fe40b",
            "GroupId": "sg-087afe8df7adbfd0f",
            "GroupOwnerId": "152848913167",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "CidrIpv4": "0.0.0.0/0"
        }
    ]
}
```

# Use the CLI to create a new EC2 Instance inside the default VPC with a public IP address and connect to it though SSH.

First we need to create PEM key which will allow us to connect via SSH

```
aws ec2 create-key-pair --key-name MayuKey --query 'KeyMaterial' --output text > MayuKey.pem
```

Launch EC2 instance using following command

```
aws ec2 run-instances --image-id  ami-090fa75af13c156b4 --count 1 --instance-type t2.micro --key-name MayuKey --security-group-ids sg-087afe8df7adbfd0f
```
InstanceID i-0103f173a01322b11
Public IPv4 54.242.87.155
Private IPv4 172.31.16.96

From the terminal , use the ssh command to connect the instance with the following command.

```
chmod 400 MayuKey.pem
ssh -i "MayuKey.pem" ec2-user@ec2-54-242-87-155.compute-1.amazonaws.com
```

# Create another EC2, also using the CLI instance in the same VPC but with private address only and connect to it.

Created another instance with the following command in the AWS CLI.

```
aws ec2 run-instances --image-id  ami-090fa75af13c156b4 --count 1 --instance-type t2.micro --key-name MayuKey --security-group-ids sg-087afe8df7adbfd0f --no-associate-public-ip-address

Output
InstanceID i-0464c1c3006b4c14b
Private IPv4 172.31.95.117
```

Finally, using the instance with public IP we connected to the instance with private IP only. 

``
chmod 400 Devopsacademy.pem
ssh -i "Devopsacademy.pem" ec2-user@172.31.95.117
```

***
Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws01/README.md)