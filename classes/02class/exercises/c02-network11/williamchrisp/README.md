# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```
aws --region us-east-1 ec2 run-instances --image-id ami-090fa75af13c156b4 \
--instance-type t2.micro \
--key-name williamuseast1 \
--subnet-id subnet-02531e94ffa2dc32d \
--security-group-ids sg-089eda60c7eb26911 \
--associate-public-ip-address \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=williamjumphost}]'
```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```
aws --region us-east-1 ec2 run-instances --image-id ami-090fa75af13c156b4 \
--instance-type t2.micro \
--key-name williamuseast1 \
--network-interfaces '[{"DeviceIndex":0,"NetworkInterfaceId":"eni-06f4a997a27fb9972"}]' \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=william}]'
```

- Commands for accessing your public instance using ssh

```
ssh -i ~/Documents/williamuseast1.pem ec2-user@44.200.215.35

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
5 package(s) needed for security, out of 17 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-192-168-3-148 ~]$ 
```

- Commands for accessing your private instance from public one

```
[ec2-user@ip-192-168-3-148 ~]$ ssh ec2-user@192.168.0.10 
Last login: Tue Aug 23 05:48:03 2022 from 192.168.3.148

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-192-168-0-10 ~]$ 
```

- Commands for testing ping to `8.8.8.8` from private instance

```
[ec2-user@ip-192-168-0-10 ~]$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=106 time=1.92 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=106 time=1.60 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=106 time=1.52 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=106 time=1.52 ms
64 bytes from 8.8.8.8: icmp_seq=5 ttl=106 time=1.50 ms
^C
--- 8.8.8.8 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4006ms
rtt min/avg/max/mdev = 1.507/1.618/1.929/0.160 ms
```

- Any extra challenges faced?


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)