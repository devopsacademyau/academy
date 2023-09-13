Task 1:
 
1. Command to create security Group and adding the rules to the SG. 
>  - aws creates ec2 resources in the default vpc
> - create the bastion-sg security group and allow access to the bastion host from our local machine through ssh

```
aws ec2 create-security-group --group-name bastion-sg --description "bastion access with ssh"

aws ec2 authorize-security-group-ingress --group-id <bastion-sg id> --protocol tcp --port 22 --cidr "$(curl https://checkip.amazonaws.com)/32"

```
> create the private-sg security group and allow access from the bastion-sg security group through ssh

```
aws ec2 create-security-group --group-name private-sg --description "restrict internal access"

aws ec2 authorize-security-group-ingress --group-id <private-sg id> --protocol tcp --port 22 --source-group bastion-sg"

```

2. Command to create Pem key.

```
aws ec2 create-key-pair --key-name  aws101 --query 'KeyMaterial' --output text > aws101.pem

```

3. Create the instance with public ip.
> aws will automatically assign a public ip address

```
aws ec2 run-instances --image-id  ami-088ff0e3bde7b3fdf --count 1 --instance-type t2.micro --key-name aws101 --security-group-ids <bastion-sg id>

aws ec2 describe-instances --instance-id <created instance id>
```
> Capture the public-ip address in the returned response of describe-instances

4. From the terminal , use the ssh command to connect the instance's public ip

```
ssh -i aws101.pem ec2-user@<public ip> 

```


Task2: 

1. Create the instance using the private-sg.

*option --no-associate-public-ip-address prevents automatic public ip assign*

```
aws ec2 run-instances --image-id  ami-088ff0e3bde7b3fdf --count 1 --instance-type t2.micro --key-name aws101 --security-group-ids <private-sg id> --no-associate-public-ip-address
```
*Remeber to get the private ip from the response*

2. Use the instance(with public ipaddress) created in task1 as the bastion host to connect to the created ec2-instance through ssh port forwarding

*This way we avoid copying our pem files to the jump server incase it is compromised*

```
ssh -i aws101.pem ec2-user@<bastion public-ip> -L 9999:<private-ip>:22

```

3. In another tab ssh to localhost passing the -p option to access the private ip  

```
ssh -i aws101.pem ec2-user@localhost -p 9999
```

Reference:

https://docs.aws.amazon.com/cli/latest/reference/ec2/run-instances.html
