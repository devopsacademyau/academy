## EC2 (c01-aws01)

- Use the CLI to create a new EC2 Instance inside the default VPC with a public IP address and connect to it though SSH.

> **Public instance**
```
aws ec2 create-key-pair \
--dry-run \
--key-name academy \
--tag-specifications 'ResourceType=key-pair,Tags=[{Key=ref,Value=devops-academy}]'
--output text > academy.pem
```

```
aws ec2 create-security-group \
--group-name ssh-restrict \
--description "access only through ssh" \
--vpc-id vpc-076e78c1aecad75e2
```

```
aws ec2 authorize-security-group-ingress \
--group-name ssh-restrict \
--protocol tcp \
--port 22 \
--cidr 0.0.0.0/0
```

```
aws ec2 run-instances \
--image-id ami-09d95fab7fff3776c \
--instance-type t2.micro \
--key-name academy \
--security-group-ids sg-0f41f4f0db35ea30a \
--block-device-mappings '[{"DeviceName":"/dev/xvda","Ebs":{"VolumeSize":8,"SnapshotId":"snap-074e8f0568ee430f1", "VolumeType": "gp2", "DeleteOnTermination":true}}]' \
--tag-specifications 'ResourceType=instance,Tags=[{Key=ref,Value=devops-academy}]'
```

- Create another EC2, also using the CLI instance in the same VPC but with private address only and connect to it.

> **Private instance**

```
aws ec2 create-key-pair \
--dry-run \
--key-name da-jump-box \
--tag-specifications 'ResourceType=key-pair,Tags=[{Key=ref,Value=devops-academy}]'
--output text > da-jump-box.pem
```

```
ssh-add -l
ssh-add -K academy.pem
ssh-add -K da-jump-box.pem
```

```
aws ec2 create-route-table \ 
--vpc-id vpc-076e78c1aecad75e2
```

```
aws ec2 create-subnet \
 --vpc-id vpc-076e78c1aecad75e2 \
 --cidr-block 172.31.112.0/20

aws ec2 associate-route-table \
--route-table-id rtb-046db089d6e210030 \
--subnet-id subnet-0ae1b625f20205269
```

```
aws ec2 run-instances \
--image-id ami-09d95fab7fff3776c \
--instance-type t2.micro \
--key-name da-jump-box \
--subnet-id subnet-0f45443b58ca4bf8d \
--security-group-ids sg-053673c514d6b153d sg-0f41f4f0db35ea30a \
--block-device-mappings '[{"DeviceName":"/dev/xvda","Ebs":{"VolumeSize":8,"SnapshotId":"snap-074e8f0568ee430f1", "VolumeType": "gp2", "DeleteOnTermination":true}}]' \
--tag-specifications 'ResourceType=instance,Tags=[{Key=ref,Value=devops-academy}]'
```

## Submit a PR with the folowing file:
- README.md based on the [ANSWER.md](ANSWER.md) file with the commands requested. 

## References
- [EC2 Instance Creation](https://docs.aws.amazon.com/cli/latest/reference/ec2/run-instances.html)
- [Preparing a Linux EC2 Jump Box in AWS (C01-E03)](https://www.youtube.com/watch?v=Mwf17O45IA0)

## Aditional information
 - You'll need those instances for the [c01-aws02](../c01-aws02/README.md) exercise.