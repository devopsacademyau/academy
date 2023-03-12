## EC2 (c01-aws01)

- Use the CLI to create a new EC2 Instance inside the default VPC with a public IP address and connect to it though SSH.
- Create another EC2, also using the CLI instance in the same VPC but with private address only and connect to it.


# 1. Set up AWS CLI with Access keys from admin user. 
aws configure

# 2. Create key pairs to communicate with EC2 instances through SSH. 
aws ec2 create-key-pair \
    --key-name c01aws01key1 \
    --query 'KeyMaterial' \
    --output text > c01aws01key1.pem

# 3. Create Security Groups and provide access to SSH connection 
aws ec2 create-security-group \
    --group-name c01aws01sg \
    --description 'Security group of c01aws01'

aws ec2 authorize-security-group-ingress \
    --group-id sg-0e0084803288c434a  \
    --protocol tcp \
    --port 22 \
    --cidr 0.0.0.0/0

# 4. Create first ec2 instance 

aws ec2 run-instances \
    --image-id ami-04fcc97b5f6edcd89 \
    --instance-type t2.micro \
    --count 1 \
    --key-name c01aws01key1 \
    --subnet-id subnet-052006d1381c6d3f6
    --security-group-ids sg-0e0084803288c434a \
    --associate-public-ip-address

### Check for the public IP address of this instance and provide only read permissions to the key 
aws ec2 describe-instances \
    --query "Reservations[].Instances[].[InstanceId, PublicIpAddress]" \
    --output text

chmod 400 c01aws01key1.pem

# 5. Connect with the first instance 
ssh -i c01aws01key1.pem ubuntu@54.79.122.57

lsb_release -a #check VM information 


# 6. Connect to the second instance through the first instance because it doesn't have public ip address 
aws ec2 run-instances \
    --image-id ami-04fcc97b5f6edcd89 \
    --count 1 \
    --instance-type t2.micro \
    --key-name c01aws01key1 \
    --security-group-ids sg-0e0084803288c434a \
    --no-associate-public-ip-address #remove public ip address

### forward credentials from the first instance to access second instance 
eval $(ssh-agent -s)
ssh-add c01aws01key1.pem

ssh -A ubuntu@54.79.122.57
ssh ubuntu@172.31.43.102
lsb_release -a