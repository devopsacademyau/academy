# C04-IAC01

## Terraform code
- [_backend.tf](_backend.tf)
- [_provider.tf](_provider.tf)
- [ec2.tf](ec2.tf)
- [iam.tf](iam.tf)
- [s3.tf](s3.tf)
- [security-group.tf](security-group.tf)

## Command Execution Output
- [output.txt](output.txt)

## SSH connectivity test
```
➜  jay ssh -i "PubHostKeyPair.pem" ec2-user@52.62.241.173                                                                     <aws:devopsadmin>
The authenticity of host '52.62.241.173 (52.62.241.173)' can't be established.
ECDSA key fingerprint is SHA256:loCnJgrv+0CZ24XS3TocbpuGQB3RIgFPTgF0XtNeZrc.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '52.62.241.173' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
14 package(s) needed for security, out of 31 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-192-168-102-193 ~]$ client_loop: send disconnect: Broken pipe
```

## S3 bucket access from EC2
```
➜  jay ssh -i "PubHostKeyPair.pem" ec2-user@52.62.241.173                                                                      <aws:devopsadmin>
Last login: Sat Jul 25 01:28:06 2020 from 121-200-5-90.79c805.syd.nbn.aussiebb.net

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
14 package(s) needed for security, out of 31 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-192-168-102-193 ~]$
[ec2-user@ip-192-168-102-193 ~]$
[ec2-user@ip-192-168-102-193 ~]$ aws s3 cp s3://jay-doa-c04-iac01-9930.com/coffee.json .
download: s3://jay-doa-c04-iac01-9930.com/coffee.json to ./coffee.json
[ec2-user@ip-192-168-102-193 ~]$
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines-->
***
Answer for exercise [c04-iac01](https://github.com/devopsacademyau/academy/blob/c41e824fb2a2c55e3a30b2371a87e3a7551b6741/classes/04class/exercises/c04-iac01/README.md)