## EC2 (c01-aws01)

- Use the CLI to create a new EC2 Instance inside the default VPC with a public IP address and connect to it though SSH.
First create the key pair to connect to the instance:

➜  ~ aws ec2 create-key-pair --key-name c01-aws01-key --query 'KeyMaterial' --output text > c01-aws01-key.pem

Next change the permissions on the key for ssh usage:

➜  ~ chmod 400 c01-aws01-key.pem

Create the security group so we can give our IP permission to access the server:

➜  ~ aws ec2 create-security-group --group-name c01-aws01-sg --description "C01-aws01-sg"

Add an ingress exception for our current public IP on port 22 for ssh:

➜  ~ aws ec2 authorize-security-group-ingress --group-name c01-aws01-sg --protocol tcp --port 22 --cidr 167.179.158.84/32

Grab the SG ID to pass through the next command so that it is applied to the instance:

➜  ~ aws ec2 describe-security-groups --group-name c01-aws01-sg

Create the instance using the correct ami, what instance type, how many, the key required to connect, ensure it has a public IP as per instructions followed by the correct SG to ensure we can access it:

➜  ~ aws ec2 run-instances --image-id ami-0a4e637babb7b0a86 --instance-type t2.micro --count 1 --key-name c01-aws01-key --associate-public-ip-address --security-group-ids sg-0214807c7266ae5c9

Next a describe to get the public IP:

➜  ~ aws ec2 describe-instances --instance-id i-0c1dc8e0e5f8b724e

Then finally a SSH connection to verify all of the above are working inputting the public ip as per the describe above:

➜  ~ ssh -i c01-aws01-key.pem ec2-user@13.54.100.8
The authenticity of host '13.54.100.8 (13.54.100.8)' can't be established.
ED25519 key fingerprint is SHA256:T329aJ3VYqMlBO7nI1Y36TisIWqkcrhLY7vsNIoc08s.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '13.54.100.8' (ED25519) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
3 package(s) needed for security, out of 6 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-47-188 ~]$





- Create another EC2, also using the CLI instance in the same VPC but with private address only and connect to it.

First I created a new SG for the new instance:

aws ec2 create-security-group --group-name private-sg --description  "Private SG for private EC2"

Then I created a rule to allow the public EC2 to access the private EC2 and used the public security group as the source to prevent putting in a IP that can change:

aws ec2 authorize-security-group-ingress --group-id sg-0b096de1f2054d5de --protocol tcp --port 22 --source-group  sg-0214807c7266ae5c9

After setting the above up I ran a create for the new instance specifying no public ip address as per the readme:

aws ec2 run-instances --image-id ami-0a4e637babb7b0a86 --instance-type t2.micro --count 1 --key-name c01-aws01-key --no-associate-public-ip-address --security-group-ids sg-0b096de1f2054d5de

I added my SSH key to my keystore so I could continue to use it with the SSH to the public instance(bastion):

  ~ ssh-add -k c01-aws01-key.pem
Identity added: c01-aws01-key.pem (c01-aws01-key.pem)

Then I ssh'd to the public instance and used it to ssh to the private instance:
➜  ~ ssh -A ec2-user@13.54.100.8
Last login: Tue Feb 15 00:27:01 2022 from 167-179-158-84.a7b39e.syd.nbn.aussiebb.net

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
3 package(s) needed for security, out of 6 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-47-188 ~]$ ssh ec2-user@172.31.36.38
The authenticity of host '172.31.36.38 (172.31.36.38)' can't be established.
ECDSA key fingerprint is SHA256:ObSBWi3xR3aeEBa3v+k2l21e2Fr5X43AGp0Wdjfonrg.
ECDSA key fingerprint is MD5:64:67:30:ff:65:39:0f:03:74:c5:82:22:a6:a0:77:8f.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '172.31.36.38' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-172-31-36-38 ~]$

## Submit a PR with the folowing file:
- README.md based on the [ANSWER.md](ANSWER.md) file with the commands requested. 

## References
- [EC2 Instance Creation](https://docs.aws.amazon.com/cli/latest/reference/ec2/run-instances.html)
- [Preparing a Linux EC2 Jump Box in AWS (C01-E03)](https://www.youtube.com/watch?v=Mwf17O45IA0)

## Aditional information
 - You'll need those instances for the [c01-aws02](../c01-aws02/README.md) exercise.
