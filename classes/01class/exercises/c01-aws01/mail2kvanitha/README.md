## EC2 (c01-aws01)

- Use the CLI to create a new EC2 Instance inside the default VPC with a public IP address and connect to it though SSH.
- Create another EC2, also using the CLI instance in the same VPC but with private address only and connect to it.
Steps to connect from one instance with Public IP to another instance with no Public IP.
STEP1:CREATE SECURITY GROUP AND ADD RULES:
-----------------------------------------
Created two security Groups. One for EC2 with Public IP Address and another for EC2 with only private IP Address.
Security Group for EC2 with Public IP Address:
aws ec2 create-security-group --group-name launch-wizard-1

Security Group for EC2 with Private IP Address only:
aws ec2 create-security-group --group-name webserver-sg --description "Webserver Security Group"

STEP2: CREATE CREDENTIALS:
--------------------------
aws ec2 create-key-pair --key-name WEBSERVER --query 'KeyMaterial' --output text > WEBSERVER.pem
chmod 400 WEBSERVER.pem

STEP3: CREATE EC2 INSTANCES:
---------------------------
Created instances using AWS CLI commands as below using the Security group and keypairs created from above steps
INSTANCE1: With Public IP
aws ec2 run-instances --image-id ami-088ff0e3bde7b3fdf --count 1 --instance-type t2.micro --security-group-ids "sg-04e4604ed84e9095c" --key-name WEBSERVER
INSTANCE2: Without Public IP
aws ec2 run-instances --image-id ami-088ff0e3bde7b3fdf --count 1 --instance-type t2.micro --security-group-ids "sg-0fa94283054c84523" --key-name WEBSERVER --no-associate-public-ip-address

STEP4: ADD RULES TO SECURITY GROUPS OF INSTANCES:
-------------------------------------------------

Added below Inbound rules to the security groups of EC2 Instance with Public IP Address.This rule allows access to my IP to SSH, HTTP and HTTPS ports.
aws ec2 authorize-security-group-ingress --group-id sg-04e4604ed84e9095c --protocol tcp --port 22 --cidr 14.203.197.155/32
aws ec2 authorize-security-group-ingress --group-id sg-04e4604ed84e9095c --protocol tcp --port 80 --cidr 14.203.197.155/32
aws ec2 authorize-security-group-ingress --group-id sg-04e4604ed84e9095c --protocol tcp --port 443 --cidr 14.203.197.155/32

Added below Inbound rules to the security group of EC2 Instance with only Private IP. 172.x.x.x/32 is the Public IP address of EC2 instance created before.
aws ec2 authorize-security-group-ingress --group-id sg-0fa94283054c84523 --protocol tcp --port 22 --cidr 172.31.45.156/32

STEP5:CONNECT FROM INSTANCE1 to INSTANCE2:
------------------------------------------
Copy the WEBSERVER.pem file to INSTANCE1.
scp -i WEBSERVER.pem WEBSERVER.pem ec2-user@ec2-52-65-224-250.ap-southeast-2.compute.amazonaws.com:~

SSH to INSTANCE1 using the keypair
ssh -i WEBSERVER.pem ec2-user@ec2-52-65-224-250.ap-southeast-2.compute.amazonaws.com

SSH to INSTANCE2(Private IP - 172.31.37.124) using the keypair copied 
ssh -i WEBSERVER.pem ec2-user@172.31.37.124

## Submit a PR with the folowing file:
- README.md based on the [ANSWER.md](ANSWER.md) file with the commands requested. 

## References
- [EC2 Instance Creation](https://docs.aws.amazon.com/cli/latest/reference/ec2/run-instances.html)
- [Preparing a Linux EC2 Jump Box in AWS (C01-E03)](https://www.youtube.com/watch?v=Mwf17O45IA0)

## Aditional information
 - You'll need those instances for the [c01-aws02](../c01-aws02/README.md) exercise.
