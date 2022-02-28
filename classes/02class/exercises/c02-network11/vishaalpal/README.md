# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```
# Create EC2 key-pair
Command: 
aws ec2 create-key-pair --key-name syd-key-pair >> syd-kp.pem
chmod 400 syd-kp.pem

# Launch an EC2 instance in the public subnet
Command:
aws ec2 run-instances \
    --image-id ami-0a4e637babb7b0a86 \
    --instance-type t3.micro \
    --security-group-ids sg-0099da4cfb47aae94 \
    --subnet-id subnet-0fc530aa074c01084 \
    --associate-public-ip-address \
    --key-name syd-kp \
    --tag-specifications 'ResourceType="instance",Tags=[{Key="Name",Value="Public EC2"}]' \
    --region ap-southeast-2 >> public_instance_output.txt

Output:
Refer to public_instance_output.txt
```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```
Command:
aws ec2 run-instances \
    --image-id ami-0a4e637babb7b0a86 \
    --instance-type t3.micro \
    --network-interfaces '[{"DeviceIndex":0,"NetworkInterfaceId":"eni-09b64974418db9894"}]' \
    --key-name syd-kp \
    --tag-specifications 'ResourceType="instance",Tags=[{Key="Name",Value="Private EC2"}]' \
    --region ap-southeast-2 >> private_instance_output.txt

Output: 
Refer to private_instance_output.txt
```

- Commands for accessing your public instance using ssh

```
Command:
ssh -A ec2-user@13.210.73.153

Output:
➜  vishaalpal git:(vishaalpal/c02-network11) ✗ ssh -A ec2-user@13.210.73.153
Last login: Mon Feb 28 22:52:44 2022 from 1.158.41.73

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
8 package(s) needed for security, out of 14 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-10-0-10-214 ~]$ 

```

- Commands for accessing your private instance from public one

```
Command:
ssh ec2-user@10.0.0.10

Output:
[ec2-user@ip-10-0-10-214 ~]$ ssh ec2-user@10.0.0.10
Last login: Mon Feb 28 22:54:39 2022 from 10.0.10.214

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
8 package(s) needed for security, out of 14 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-10-0-0-10 ~]$ 

```

- Commands for testing ping to `8.8.8.8` from private instance

```
Command:
ping 8.8.8.8

Output:
[ec2-user@ip-10-0-0-10 ~]$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=107 time=1.92 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=107 time=1.70 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=107 time=1.67 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=107 time=1.63 ms
64 bytes from 8.8.8.8: icmp_seq=5 ttl=107 time=1.65 ms
64 bytes from 8.8.8.8: icmp_seq=6 ttl=107 time=1.66 ms
64 bytes from 8.8.8.8: icmp_seq=7 ttl=107 time=1.64 ms
64 bytes from 8.8.8.8: icmp_seq=8 ttl=107 time=1.68 ms
^C
--- 8.8.8.8 ping statistics ---
8 packets transmitted, 8 received, 0% packet loss, time 7012ms
rtt min/avg/max/mdev = 1.636/1.700/1.922/0.100 ms
[ec2-user@ip-10-0-0-10 ~]$ 
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)
