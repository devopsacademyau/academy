Task1 :
 
1. Command to create security Group and adding the rules to the SG. 

```
aws ec2 create-security-group --group-name Devopsacademy-sg --description "My security group" --vpc-id vpc-7fd6d818
{
    "GroupId": "sg-0449aeda785be7dd2"
}

aws ec2 authorize-security-group-ingress --group-id sg-0449aeda785be7dd2 --protocol tcp --port 22 --cidr 0.0.0.0/0

```
2. Created the instance with the following command in the AWS CLI.
```
aws ec2 run-instances --image-id  ami-088ff0e3bde7b3fdf --count 1 --instance-type t2.micro --key-name Devopsacademy --security-group-ids sg-0449aeda785be7dd2 --subnet-id subnet-0f9f7c47

```
2. Command to create Pem key.

```

aws ec2 create-key-pair --key-name Devopsacademy --query 'KeyMaterial' --output text > Devopsacademy.pem

```

3. From the terminal , use the ssh command to connect the instance with the following command.

```
ssh -i "Devopsacademy.pem" ssh -i "Devopsacademy.pem" ec2-user@ec2-13-239-7-71.ap-southeast-2.compute.amazonaws.com 

```


Task2: 

1. Created the instance with the following command in the AWS CLI.

```

aws ec2 run-instances --image-id  ami-088ff0e3bde7b3fdf --count 1 --instance-type t2.micro --key-name Devopsacademy --security-group-ids sg-0449aeda785be7dd2 --subnet-id subnet-0f9f7c47 --no-associate-public-ip-address

```

2. Used the instance(with public ipaddress)which was created in the task1 as the bastion host and connected the newly created ec2-instance by changing the pem file permission.

```

chmod 400 Devopsacademy.pem
ssh -i "Devopsacademy.pem" ec2-user@172.31.32.173

```
Reference:

https://docs.aws.amazon.com/cli/latest/reference/ec2/run-instances.html


