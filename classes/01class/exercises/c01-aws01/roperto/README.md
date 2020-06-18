# C01-AWS01

## Commands Execution Output

- Commands to create the first EC2 instance and any additional resource required:
```shell script
# Create and add private key to agent
KEY_NAME="devops-test-key"
aws ec2 create-key-pair --key-name "$KEY_NAME" --query 'KeyMaterial' --output text > ~/.ssh/${KEY_NAME}.pem
chmod 600 ~/.ssh/devops-test-key.pem
ssh-add ~/.ssh/devops-test-key.pem

# Find the latest Amazon Linux 2 AMI 
AMI=$(aws ec2 describe-images --owners amazon \
        --filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" \
        --query "sort_by(Images, &CreationDate)[-1].ImageId" --output text)
echo "AMI: ${AMI}"

# Create security group with my IP address
MY_IP=$(curl -s 'https://api6.ipify.org?format=text')
PUBLIC_SECURITY_GROUP=$(aws ec2 create-security-group --description "Allow SSH from my IP only" --group-name "test-allow-my-ip-ssh" --output text)
aws ec2 authorize-security-group-ingress --group-id "${PUBLIC_SECURITY_GROUP}" --protocol tcp --port 22 --cidr "${MY_IP}/32"
echo "PUBLIC SG: ${PUBLIC_SECURITY_GROUP}"

# Create the EC2
EC2_PUBLIC=$(aws ec2 run-instances \
        --image-id "$AMI" \
        --instance-type t2.nano \
        --key-name "$KEY_NAME" \
        --security-group-ids "$PUBLIC_SECURITY_GROUP" \
        --associate-public-ip-address \
        --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=cli-public-test}]' \
        --query 'Instances[*].InstanceId' --output text)
EC2_PUBLIC_IP=$(aws ec2 describe-instances --instance-ids "$EC2_PUBLIC" --query 'Reservations[-1].Instances[-1].PublicIpAddress' --output text)
EC2_PUBLIC_PRIVATE_IP=$(aws ec2 describe-instances --instance-ids "$EC2_PUBLIC" --query 'Reservations[-1].Instances[-1].PrivateIpAddress' --output text)
echo "EC2_PUBLIC: ${EC2_PUBLIC} => public_ip=${EC2_PUBLIC_IP} private_ip=${EC2_PUBLIC_PRIVATE_IP}"
```

- Commands to connect to the first EC2 instance:
```shell script
ssh "ec2-user@${EC2_PUBLIC_IP}"
```

- Commands to create the second EC2 instance and any additional resource required:
```shell script
# Create security group
PRIVATE_SECURITY_GROUP=$(aws ec2 create-security-group --description "Allow SSH from public EC2 only" --group-name "test-allow-public-ec2-ssh" --output text)
aws ec2 authorize-security-group-ingress --group-id "${PRIVATE_SECURITY_GROUP}" --protocol tcp --port 22 --cidr "${EC2_PUBLIC_PRIVATE_IP}/32"
echo "PRIVATE SG: ${PRIVATE_SECURITY_GROUP}"

# Create the EC2
EC2_PRIVATE=$(aws ec2 run-instances \
        --image-id "$AMI" \
        --instance-type t2.nano \
        --key-name "$KEY_NAME" \
        --security-group-ids "$PRIVATE_SECURITY_GROUP" \
        --associate-public-ip-address \
        --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=cli-private-test}]' \
        --query 'Instances[*].InstanceId' --output text)
EC2_PRIVATE_IP=$(aws ec2 describe-instances --instance-ids "$EC2_PRIVATE" --query 'Reservations[-1].Instances[-1].PrivateIpAddress' --output text)
echo "EC2_PRIVATE: ${EC2_PRIVATE} => ${EC2_PRIVATE_IP}"
```

- Commands to connect to the second EC2 instance:
```shell script
ssh -J "ec2-user@${EC2_PUBLIC_IP}" "ec2-user@${EC2_PRIVATE_IP}"
```

- Commands to delete the created resources:
```shell script
# Terminate instances
aws ec2 terminate-instances --instance-ids "$EC2_PUBLIC"
aws ec2 terminate-instances --instance-ids "$EC2_PRIVATE"

# Must wait until termination completes
aws ec2 delete-security-group --group-id "$PUBLIC_SECURITY_GROUP"
aws ec2 delete-security-group --group-id "$PRIVATE_SECURITY_GROUP"

# Make sure you are not reusing that key elsewhere before deleting the file.
aws ec2 delete-key-pair --key-name "$KEY_NAME"
rm -v ~/.ssh/"${KEY_NAME}.pem"
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws01/README.md)