## EC2 (c01-aws01)

### Use the CLI to create a new EC2 Instance inside the default VPC with a public IP address and connect to it though SSH.

Creating a key pair

```bash
aws ec2 create-key-pair --key-name tk-contino-dev --query 'KeyMaterial' --output text > ~/.ssh/tk-contino-dev.pem
```

Outputs key to file. As shown in the path, key will be outputted to `~/.ssh/`

Reference key and create new instance

```bash
aws ec2 run-instances --image-id ami-0210560cedcb09f07 --key-name tk-contino-dev --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=tk-dojo}]'
```

[https://docs.aws.amazon.com/cli/latest/reference/ec2/run-instances.html](https://docs.aws.amazon.com/cli/latest/reference/ec2/run-instances.html)

Get new instance status

```bash
aws ec2 describe-instances --instance-ids <INSTANCE_ID>
```

From output above use the public ip address to login via SSH

```bash
ssh 3.25.102.221 -l ec2-user -i ~/.ssh/tkav-contino-dev.pem
```

If it times out, Security group is not allowing access.


Get your public ip. This will be used when creating a new security group

```bash
curl https://checkip.amazonaws.com
```

This can be saved in `.aliases`  or `~/.bash_profile` as an alias

```bash
alias myip="curl https://checkip.amazonaws.com"
```

Restart terminal. Now you can type `myip` and get your public ip address

Create a security group

```bash
aws ec2 create-security-group --group-name tk-ssh-access --description "SSH Access"
```

outputs Group ID

Describe security group

```bash
aws ec2 describe-security-groups --group-ids sg-903004f8
```

or by name

```bash
aws ec2 describe-security-groups --group-names tk-ssh-access
```

Open port 22 (SSH) on the new security group

```bash
aws ec2 authorize-security-group-ingress --group-id sg-013f620525812aaeb --protocol tcp --port 22 --cidr 116.206.228.203/32
```

Allow all egress traffic

```bash
aws ec2 authorize-security-group-egress --group-id sg-013f620525812aaeb --protocol all --port all --cidr 116.206.228.203/32
```

Add security group to instance

```bash
aws ec2 modify-instance-attribute --instance-id i-0c3ecff8d3b6c0388 --groups sg-013f620525812aaeb
```

Change permissions on SSH key

```bash
sudo chmod 600 ~/.ssh/tk-contino-dev.pem
```


### Create another EC2, also using the CLI instance in the same VPC but with private address only and connect to it.

Create security group for tk-web-server with only port 80 ingress and all egress

```bash
aws ec2 create-security-group --group-name tk-web-server --description "Web Server Access"
```

Open port 80

```bash
aws ec2 authorize-security-group-ingress --group-id sg-05f7a4854c7ce41cc --protocol tcp --port 80 --cidr 116.206.228.203/32
```

Open all egress

```bash
aws ec2 authorize-security-group-egress --group-id sg-05f7a4854c7ce41cc --protocol all --port all --cidr 116.206.228.203/32
```

Open port 22 (SSH) from security-group of bastion host

```bash
aws ec2 authorize-security-group-ingress --group-id sg-05f7a4854c7ce41cc --protocol tcp --port 22 --source-group sg-013f620525812aaeb 
```

Create key pair for web servers:

```bash
aws ec2 create-key-pair --key-name tk-contino-web --query 'KeyMaterial' --output text > ~/.ssh/tk-contino-web.pem
```

Change permissions on key

```bash
sudo chmod 600 ~/.ssh/tk-contino-web.pem
```

Create user-data file and paste contents

`sudo nano user-data.sh`

User data

```bash
#!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd.service
  systemctl enable httpd.service
  EC2_AVAIL_ZONE=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)
  echo "<h1>Hello World from $(hostname -f) in AZ $EC2_AVAIL_ZONE </h1>” > /var/www/html/index.html
```

Create web-server instance

```bash
aws ec2 run-instances --image-id ami-0210560cedcb09f07 --key-name tk-contino-web --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=tk-dojo-webserver}]' --user-data file://user-data.sh
```

Add security group to web-server

```bash
aws ec2 modify-instance-attribute --instance-id i-0f7814da42fbc0594 --groups sg-05f7a4854c7ce41cc
```

Add ssh keys

```bash
ssh-add ~/.ssh/tkav-contino-dev.pem
ssh-add ~/.ssh/tk-contino-web.pem
```

SSH to web server via the jump box

```bash
ssh -J ec2-user@3.25.102.221 ec2-user@172.31.37.205
```

[https://medium.com/rangle-io/jumpboxes-how-to-avoid-storing-ssh-keys-59e3dc78e5e6](https://medium.com/rangle-io/jumpboxes-how-to-avoid-storing-ssh-keys-59e3dc78e5e6)

Terminate instances

```bash
aws ec2 terminate-instances --instance-ids i-0c3ecff8d3b6c0388 i-0f7814da42fbc0594
```



<!-- Don't change anything below this point-->
<!-- Before committing, remove both commented lines--> 
***
Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/master/classes/01class/exercises/c01-aws01/README.md)