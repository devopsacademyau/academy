# C01-AWS01

## Commands Execution Output

- Commands to create the first EC2 instance and any additional resource required:
```

create a key pair !make sure to capitalise query content!

aws ec2 create-key-pair --key-name sdaymondjb --query 'KeyMaterial' --output text > sdaymondjb.pem

set key permission 
chmod 400 sdaymondjb.pem

create security group for jump box

aws ec2 create-security-group --group-name SamDDojoSG --description "Contino Dojo security group for Sam Daymond"
{
    "GroupId": "sg-05a19374153c02069"
}

set ingress rules for jumpbox SG

aws ec2 authorize-security-group-ingress \
--group-id sg-05a19374153c02069 \
--protocol tcp \
--port 22 \
--cidr 159.196.65.9/32
{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-0a64018167f30e589",
            "GroupId": "sg-05a19374153c02069",
            "GroupOwnerId": "152848913167",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "CidrIpv4": "159.196.65.9/32"
        }
    ]
}

set egress rules for jumpboxSG

aws ec2 authorize-security-group-egress \
--group-id sg-05a19374153c02069 \
--protocol all \     
> --port all \
> --cidr 159.196.65.9/32
{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-008e1b115301cf0e6",
            "GroupId": "sg-05a19374153c02069",
            "GroupOwnerId": "152848913167",
            "IsEgress": false,
            "IpProtocol": "-1",
            "FromPort": -1,
            "ToPort": -1,
            "CidrIpv4": "159.196.65.9/32"
        }
    ]
}

Create instance for jumpbox using created key pair and JumpboxSG
aws ec2 run-instances \
--image-id resolve:ssm:/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 \
--instance-type t2.micro \
--count 1 \
--associate-public-ip-address \
--security-group-ids sg-05a19374153c02069 \
--key-name sdaymondjb

- Commands to connect to the first EC2 instance:
```

find IP of Jumpbox instance by referencing output of run instance

aws ec2 describe-instances --query "Reservations[].Instances[].[InstanceId, PublicIpAddress]"

ssh into jumpbox using key

ssh -i "sdaymondjb.pem" ec2-user@ec2-13-239-137-71.ap-southeast-2.compute.amazonaws.com

```
- Commands to create the second EC2 instance and any additional resource required:
```

create second security group for internal instances

aws ec2 create-security-group --group-name SamDDojoSGinternal --description "Contino Dojo security group for Sam Daymond that only allows internal connections on port 22"

set ingress rules for internal group only

aws ec2 authorize-security-group-ingress \
--group-id sg-064e1c43a287ced37 \
--protocol tcp \
--port 22 \
--source-group sg-05a19374153c02069

create second instance  - in future should have used a second key pair for this
aws ec2 run-instances \
--image-id resolve:ssm:/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 \
--instance-type t2.micro \
--count 1 \
--security-group-ids sg-064e1c43a287ced37 \
--key-name sdaymondjb


- Commands to connect to the second EC2 instance:
```

add key to key store to allow access from jumpbox

eval `ssh-agent -s`
ssh-add -k sdaymondjb.pem

connect to jumpbox while using -a for agent forwarding keys

ssh -A ec2-user@ec2-13-239-137-71.ap-southeast-2.compute.amazonaws.com

connect to second instance from jumpbox

ssh  ec2-user@172.31.35.129


***
Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws01/README.md)



