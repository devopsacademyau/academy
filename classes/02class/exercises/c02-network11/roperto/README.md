# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```shell script
# Some parameters from other exercises
export AWS_DEFAULT_REGION=ap-southeast-2
KEY="devops-key"
AMI=ami-0a58e22c727337c51
SUBNET_PUBLIC_A=subnet-0d4986c79f7cd8e16
SG_PUBLIC=sg-0cfa70c15f6a7efe8
SG_PRIVATE=sg-08e0247ebdc082d73
NIC=eni-09a5a7e968e48c8a1

# Create EC2
EC2_PUBLIC=$(aws ec2 run-instances \
        --image-id "$AMI" \
        --instance-type t2.nano \
        --key-name "$KEY" \
        --subnet-id "$SUBNET_PUBLIC_A" \
        --security-group-ids "$SG_PUBLIC" \
        --associate-public-ip-address \
        --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=cli-public-test}]' \
        --query 'Instances[*].InstanceId' --output text)
EC2_PUBLIC_IP=$(aws ec2 describe-instances --instance-ids "$EC2_PUBLIC" --query 'Reservations[-1].Instances[-1].PublicIpAddress' --output text)
EC2_PUBLIC_PRIVATE_IP=$(aws ec2 describe-instances --instance-ids "$EC2_PUBLIC" --query 'Reservations[-1].Instances[-1].PrivateIpAddress' --output text)
echo "EC2_PUBLIC: ${EC2_PUBLIC} => public_ip=${EC2_PUBLIC_IP} private_ip=${EC2_PUBLIC_PRIVATE_IP}"
# EC2_PUBLIC: i-09ce8d23e5ff36824 => public_ip=3.104.104.198 private_ip=172.31.28.91
```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```shell script
# Associate SG to ENI
aws ec2 modify-network-interface-attribute --network-interface-id $NIC --groups $SG_PRIVATE

# Create EC2
EC2_PRIVATE=$(aws ec2 run-instances \
        --image-id "$AMI" \
        --instance-type t2.nano \
        --key-name "$KEY" \
        --network-interfaces "[{\"DeviceIndex\":0,\"NetworkInterfaceId\":\"${NIC}\"}]" \
        --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=cli-private-test}]' \
        --query 'Instances[*].InstanceId' --output text)
EC2_PRIVATE_IP=$(aws ec2 describe-instances --instance-ids "$EC2_PRIVATE" --query 'Reservations[-1].Instances[-1].PrivateIpAddress' --output text)
echo "EC2_PRIVATE: ${EC2_PRIVATE} => ${EC2_PRIVATE_IP}"
# EC2_PRIVATE: i-00c741a0e8e8da65f => 10.42.10.42
```

- Commands for accessing your public instance using ssh

```
$ ssh -A ec2-user@"$EC2_PUBLIC_IP"
The authenticity of host '3.104.104.198 (3.104.104.198)' can't be established.
ECDSA key fingerprint is SHA256:79lc/Cemqq2mFT5tYFLEU2UkEZOuCaAdMK9WaqbYYPM.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '3.104.104.198' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
9 package(s) needed for security, out of 16 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-28-91 ~]$
```

- Commands for accessing your private instance from public one

```
[ec2-user@ip-172-31-28-91 ~]$ ssh ec2-user@172.31.28.91
The authenticity of host '172.31.28.91 (172.31.28.91)' can't be established.
ECDSA key fingerprint is SHA256:79lc/Cemqq2mFT5tYFLEU2UkEZOuCaAdMK9WaqbYYPM.
ECDSA key fingerprint is MD5:b4:27:f2:fc:c8:f4:4a:c9:47:bd:ad:ec:da:81:0e:3b.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '172.31.28.91' (ECDSA) to the list of known hosts.
Last login: Tue Jul  7 13:08:13 2020 from ppp59-167-120-98.static.internode.on.net

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
9 package(s) needed for security, out of 16 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-28-91 ~]$
```

- Commands for testing ping to `8.8.8.8` from private instance

```
[ec2-user@ip-172-31-28-91 ~]$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=108 time=1.17 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=108 time=1.20 ms
```

- Any extra challenges faced?

> --network-interfaces using a JSON string is annoying but not hard.

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)