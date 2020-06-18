
# C01-AWS01

## Commands Execution Output

- Commands to create the first EC2 instance and any additional resource required:
```
I already have a keypair and a security group which only allows connections from my Static home's ip. So i`ll be using those.

Security group name

sg_daniel

Security group ID

sg-0821de9ebd10da406

Description

sg-daniel-home
```

Command to create the instance:

    aws ec2 run-instances \
        --image-id ami-03686c686b463366b \
        --instance-type t2.micro \
        --count 1 \
        --subnet-id subnet-b47e94d2 \
        --key-name danibook \
        --security-group-ids sg-0821de9ebd10da406 \
        --associate-public-ip-address
       
- Commands to connect to the first EC2 instance:
  
```
ssh -i "danibook.pem" ec2-user@ec2-13-210-23-254.ap-southeast-2.compute.amazonaws.com 
```
 Commands to create the second EC2 instance and any additional resource required:
```
-- Add the new SG
aws ec2 create-security-group --group-name sg-private --description "SG Private" --vpc-id vpc-8e8b89e9

--Add SSH rule

aws ec2 authorize-security-group-ingress --group-id sg-07fcd01884ee0f2bf --protocol tcp --port 22 --cidr 172.31.0.0/16

--Create Instance

aws ec2 run-instances \
    --image-id ami-03686c686b463366b \
    --instance-type t2.micro \
    --count 1 \
    --subnet-id subnet-b47e94d2 \
    --key-name danibook \
    --security-group-ids sg-07fcd01884ee0f2bf \
    --no-associate-public-ip-address
```
- Commands to connect to the second EC2 instance:
```
--Connect 1st instance

ssh -i "danibook.pem" ec2-user@ec2-13-210-23-254.ap-southeast-2.compute.amazonaws.com

-- Connect to 2nd instance

ssh ec2-user@172.31.8.61
```
--Output

> ❯ ssh -i "danibook.pem"
> ec2-user@ec2-13-210-23-254.ap-southeast-2.compute.amazonaws.com Last
> login: Thu Jun 18 09:18:48 2020 from
> 180-150-58-136.b4963a.mel.static.aussiebb.net
> 
>        __|  __|_  )
>        _|  (     /   Amazon Linux AMI
>       ___|\___|___|
> 
> https://aws.amazon.com/amazon-linux-ami/2018.03-release-notes/ 5
> package(s) needed for security, out of 7 available Run "sudo yum
> update" to apply all updates. [ec2-user@ip-172-31-14-16 ~]$ ssh
> ec2-user@172.31.8.61 The authenticity of host '172.31.8.61
> (172.31.8.61)' can't be established. ECDSA key fingerprint is
> SHA256:jx8xUCdD1WmwQ1341VCfihGm+qstEXbFZMiFRRhkxzg. ECDSA key
> fingerprint is MD5:64:9d:cd:71:7b:ee:d8:62:07:33:18:37:ed:4d:bd:65.
> Are you sure you want to continue connecting (yes/no)? yes Warning:
> Permanently added '172.31.8.61' (ECDSA) to the list of known hosts.
> Permission denied (publickey). [ec2-user@ip-172-31-14-16 ~]$

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws01/README.md)

> Written with [StackEdit](https://stackedit.io/).


