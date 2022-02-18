## EC2 (c01-aws01)

- Use the CLI to create a new EC2 Instance inside the default VPC with a public IP address and connect to it though SSH.

* Create a public security group
```
aws ec2 create-security-group --group-name Public-SG-Ravi --description "Public-SG-Ravi"

scription "Public-SG"
{
    "GroupId": "sg-09a22a5ab151aa3da"
}
```
* Add rules for Public-SG
```
aws ec2 authorize-security-group-ingress \
    --group-id sg-09a22a5ab151aa3da \
    --protocol tcp \
    --port 22 \
    --cidr 211.26.246.72/32

{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-03036aa7b72a47f56",
            "GroupId": "sg-09a22a5ab151aa3da",
            "GroupOwnerId": "152848913167",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "CidrIpv4": "211.26.246.72/32"
        }
    ]
}
```

* Create EC2 Instance 
```
aws ec2 run-instances \
    --image-id resolve:ssm:/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 \
    --instance-type t2.micro \
    --count 1 \
    --associate-public-ip-address \
    --security-group-ids sg-09a22a5ab151aa3da \
    --key-name ravisenevirathne


aws ec2 create-tags \
    --resources i-05cfef11ded3677c6 \
    --tags Key=Name,Value=Public-EC2-Ravi

```

* SSH into Public EC2 
```
ravi.senevirathne@contino.io@Ravis-MacBook-Pro ~ % ssh ec2-user@13.54.55.163
Last login: Thu Feb 17 23:14:23 2022 from 72.246-26-211.dyn.dsl.vic.iprimus.net.au

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
3 package(s) needed for security, out of 6 available
Run "sudo yum update" to apply all updates.

```

- Create another EC2, also using the CLI instance in the same VPC but with private address only and connect to it.

* Create a private security group
```
aws ec2 create-security-group --group-name Private-SG-Ravi --description "Private-SG-Ravi"

{
    "GroupId": "sg-0ee1e6edb4e584943"
}

```

* Add rules for Private-SG
```
aws ec2 authorize-security-group-ingress \
    --group-id sg-0ee1e6edb4e584943 \
    --protocol tcp \
    --port 22 \
    --source-group sg-09a22a5ab151aa3da
    
{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-0755239f5da417b85",
            "GroupId": "sg-0ee1e6edb4e584943",
            "GroupOwnerId": "152848913167",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "ReferencedGroupInfo": {
                "GroupId": "sg-09a22a5ab151aa3da"
            }
        }
    ]
}

```

* Create Private EC2 Instance 
```
aws ec2 run-instances \
    --image-id resolve:ssm:/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 \
    --instance-type t2.micro \
    --count 1 \
    --no-associate-public-ip-address \
    --security-group-ids sg-0ee1e6edb4e584943 \
    --key-name ravisenevirathne


aws ec2 create-tags \
    --resources i-01ab002de416d749d \
    --tags Key=Name,Value=Private-EC2-Ravi

```
* SSH to public-EC2 and then into Private-EC2
```
ravi.senevirathne@contino.io@Ravis-MacBook-Pro ~ % ssh ec2-user@13.54.55.163
Last login: Fri Feb 18 01:37:22 2022 from 72.246-26-211.dyn.dsl.vic.iprimus.net.au

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
3 package(s) needed for security, out of 6 available
Run "sudo yum update" to apply all updates.

[ec2-user@ip-172-31-47-144 ~]$ ssh ec2-user@172.31.47.128
Last login: Fri Feb 18 01:37:51 2022 from ip-172-31-47-144.ap-southeast-2.compute.internal

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-172-31-47-128 ~]$ 
```


## Submit a PR with the folowing file:
- README.md based on the [ANSWER.md](ANSWER.md) file with the commands requested. 

## References
- [EC2 Instance Creation](https://docs.aws.amazon.com/cli/latest/reference/ec2/run-instances.html)
- [Preparing a Linux EC2 Jump Box in AWS (C01-E03)](https://www.youtube.com/watch?v=Mwf17O45IA0)

## Aditional information
 - You'll need those instances for the [c01-aws02](../c01-aws02/README.md) exercise.
