# C01-AWS01

## Commands Execution Output

- Commands to create the first EC2 instance and any additional resource required:
```shell script
aws ec2 create-key-pair --key-name devops-test-key --query 'KeyMaterial' --output text > ~/.ssh/devops-test-key.pem
aws ec2 create-security-group --description "Allow SSH from anywhere" --group-name "test-allow-ssh"
aws ec2 authorize-security-group-ingress --group-id sg-074a6bea5b3ad2e6d --protocol tcp --port 22 --cidr 0.0.0.0/0
aws ec2 run-instances --image-id ami-088ff0e3bde7b3fdf --instance-type t2.nano --key-name devops-test-key --security-group-ids sg-074a6bea5b3ad2e6d --associate-public-ip-address --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=cli-public-test}]'

chmod 600 ~/.ssh/devops-test-key.pem
ssh-add ~/.ssh/devops-test-key.pem
```

- Commands to connect to the first EC2 instance:
```shell script
# Public
ssh ec2-user@54.206.97.157
```

- Commands to create the second EC2 instance and any additional resource required:
```shell script
aws ec2 run-instances --image-id ami-088ff0e3bde7b3fdf --instance-type t2.nano --key-name devops-test-key --security-group-ids sg-074a6bea5b3ad2e6d --no-associate-public-ip-address --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=cli-private-test}]'
```

- Commands to connect to the second EC2 instance:
```shell script
# Private
ssh -J ec2-user@54.206.97.157 ec2-user@172.31.17.121
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-aws01](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws01/README.md)