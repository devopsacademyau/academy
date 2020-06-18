# C01-AWS01

## Commands Execution Output

- Commands to create the first EC2 instance and any additional resource required:
```bash
# Create a KeyPair
aws ec2 create-key-pair --key-name MyKeyPair --query 'KeyMaterial' --output text > MyKeyPair.pem

# Create a SG
❯ aws ec2 create-security-group --group-name my-sg-public --description "SG for ec2 with public IP address" --vpc-id vpc-8beeebec
{
    "GroupId": "sg-0343908a8d3b8475e"
}

# You can start by confirming that your public address shows as included in the CIDR range 203.0.113.0/24.
❯ curl https://checkip.amazonaws.com
203.0.113.57

# The following command adds another rule to enable SSH to instances in the same security group.
aws ec2 authorize-security-group-ingress --group-id sg-0343908a8d3b8475e --protocol tcp --port 22 --cidr 203.0.113.0/24

# Create a EC2 instance with a public IP
aws ec2 run-instances \
    --image-id ami-088ff0e3bde7b3fdf \
    --instance-type t2.micro \
    --count 1 \
    --subnet-id subnet-a50917ec \
    --key-name MyKeyPair \
    --security-group-ids sg-0343908a8d3b8475e \
    --associate-public-ip-address
```

- Commands to connect to the first EC2 instance:
```bash
#Set Permission
CHMOD 400 MyKeyPair.pem

ls -l MyKeyPair.pem 
-r--------  1 fabiopereira  staff  1671 14 Jun 20:59 MyKeyPair.pem

# Get the public IP
❯ aws ec2 describe-instances \
  --query "Reservations[*].Instances[*].PublicIpAddress" \
  --output=text
3.25.124.184

ssh ec2-user@3.25.124.184 -i MyKeyPair.pem 
```

- Commands to create the second EC2 instance and any additional resource required:
```bash
# Create a SG
❯ aws ec2 create-security-group --group-name my-sg-private --description "SG for ec2 with private IP address" --vpc-id vpc-8beeebec
{
    "GroupId": "sg-0992f359c83b175c3"
}

# The following command adds another rule to enable SSH to instances in the same security group.
aws ec2 authorize-security-group-ingress --group-id sg-0992f359c83b175c3 --protocol tcp --port 22 --cidr 172.31.42.0/24

# Create a EC2 instance with a private IP
aws ec2 run-instances \
    --image-id ami-088ff0e3bde7b3fdf \
    --instance-type t2.micro \
    --count 1 \
    --subnet-id subnet-a50917ec \
    --key-name MyKeyPair \
    --security-group-ids sg-0992f359c83b175c3 \
    --no-associate-public-ip-address
```

- Commands to connect to the second EC2 instance:

```bash
# Adding the key to the agent lets you use SSH to connect to an instance without having to use the `–i <keyfile>` option when you connect. 
ssh-add MyKeyPair.pem

# After the key is added to your keychain, you can connect to the bastion instance with SSH using the –A option. This option enables SSH agent forwarding and lets the local SSH agent respond to a public-key challenge when you use SSH to connect from the bastion to a target instance in your VPC
ssh -A ec2-user@3.25.124.184 

# Now connection to EC2 instance with a private IP: 172.31.34.207
ssh ec2-user@172.31.34.207
```
Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws01/README.md)