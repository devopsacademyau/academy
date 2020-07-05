# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```
 > aws ec2 run-instances --image-id ami-088ff0e3bde7b3fdf --count 1 --instance-type t2.micro --key-name mummaserver --subnet-id subnet-0c8c2609ac6874ace --security-group-id sg-0816f7b7fd2f99678 --associate-public-ip-address

```


- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```
 > aws ec2 create-network-interface --description devopsacademy-eni1 --private-ip-address 10.10.11.11 --groups sg-0adf86337e2bbfe10 --subnet-id subnet-0c557ceb318caf849

 > aws ec2 create-tags --resources eni-095e33701e359bcb5 --tags Key=Name,Value=devopsacademy-eni1

 > aws ec2 run-instances --image-id ami-088ff0e3bde7b3fdf --count 1 --instance-type t2.micro --key-name mummaserver --network-interfaces '[{"DeviceIndex":0,"NetworkInterfaceId":"eni-095e33701e359bcb5"}]'

 -- While creating the Network Interface, the private subnet and private security groups are specified. Hence, run-instances wont allow to declare private subnet and private SG when using the already created ENI.

```

 > ssh -i mummaserver.pem ec2-user@13.54.182.147

```
    The authenticity of host '13.54.182.147 (13.54.182.147)' can't be established.
    ECDSA key fingerprint is SHA256:hQ53B+W8GgtqmMehpaJVZbLONQEokzjgAmlABWLadzE.
    Are you sure you want to continue connecting (yes/no)? yes
    Warning: Permanently added '13.54.182.147' (ECDSA) to the list of known hosts.
    
           __|  __|_  )
           _|  (     /   Amazon Linux 2 AMI
          ___|\___|___|

    https://aws.amazon.com/amazon-linux-2/
    13 package(s) needed for security, out of 22 available
    Run "sudo yum update" to apply all updates.
    [ec2-user@ip-10-10-1-20 ~]$

 ```

- Commands for accessing your private instance from public one

```
 
 - Copy the keypair to the EC2 instance in Public subnet
 
 > scp -i mummaserver.pem mummaserver.pem ec2-user@13.54.182.147:~

 >  $ ssh -i "mummaserver.pem" ec2-user@13.54.182.147
    Last login: Thu Jul  2 08:42:09 2020 from 14-203-197-155.static.tpgi.com.au

           __|  __|_  )
           _|  (     /   Amazon Linux 2 AMI
          ___|\___|___|

    https://aws.amazon.com/amazon-linux-2/
    13 package(s) needed for security, out of 22 available
    Run "sudo yum update" to apply all updates. 
    [ec2-user@ip-10-10-1-20 ~]$ ssh -i mummaserver.pem ec2-user@10.10.11.11
    The authenticity of host '10.10.11.11 (10.10.11.11)' can't be established.
    ECDSA key fingerprint is SHA256:oEUyEOehHmHWw3hc1/pgMuMpw+UPWLJmPX/av61XQUc.
    ECDSA key fingerprint is MD5:da:96:97:0e:58:0c:39:e7:a6:1c:d0:a5:12:b2:21:31.
    Are you sure you want to continue connecting (yes/no)? yes
    Warning: Permanently added '10.10.11.11' (ECDSA) to the list of known hosts.

           __|  __|_  )
           _|  (     /   Amazon Linux 2 AMI
          ___|\___|___|
    
    https://aws.amazon.com/amazon-linux-2/
    13 package(s) needed for security, out of 22 available
    Run "sudo yum update" to apply all updates.
    [ec2-user@ip-10-10-11-11 ~]$ 


```

- Commands for testing ping to `8.8.8.8` from private instance

```
    [ec2-user@ip-10-10-11-11 ~]$ ping 8.8.8.8
    PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
    64 bytes from 8.8.8.8: icmp_seq=1 ttl=113 time=2.10 ms
    64 bytes from 8.8.8.8: icmp_seq=2 ttl=113 time=1.48 ms
    64 bytes from 8.8.8.8: icmp_seq=3 ttl=113 time=1.50 ms
    64 bytes from 8.8.8.8: icmp_seq=4 ttl=113 time=1.50 ms
    64 bytes from 8.8.8.8: icmp_seq=5 ttl=113 time=1.42 ms
    ^C
    --- 8.8.8.8 ping statistics ---
    5 packets transmitted, 5 received, 0% packet loss, time 4006ms
    rtt min/avg/max/mdev = 1.424/1.605/2.108/0.254 ms
    [ec2-user@ip-10-10-11-11 ~]$ 

```

- Any extra challenges faced?

  Challenge faced is attaching the already created ENI with the run-instance command. The network-interface format is different and not straight forward.

  
<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)
