# C04-IAC01

## Terraform code 
- [_backend.tf](_backend.tf)
- [_provider.tf](_provider.tf)
- [_variables.tf](_variables.tf)
- [ec2.tf](ec2.tf)
- [iam.tf](iam.tf)
- [s3.tf](s3.tf)
- [security-group.tf](security-group.tf)

## Command Execution Output
- [output.txt](output.txt)

# Breakdown 
- connected to ec2 instance ec2-user@xx.xx.xx.xx using - same key used during `terraform apply`
- used nano to create test.txt containing "hello world"
- copied file to bucket
- checked contents of bucket 
- downloaded test.txt from bucket to test2.txt
- echoed test2.txt contents to console

# SSH Connection
```
       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-172-31-38-138 ~]$ nano test.txt   
[ec2-user@ip-172-31-38-138 ~]$ aws s3 cp test.txt s3://lj-s3-c04-iac01/test.txt
upload: ./test.txt to s3://lj-s3-c04-iac01/test.txt
[ec2-user@ip-172-31-38-138 ~]$ aws s3 ls s3://lj-s3-c04-iac01
2022-08-16 06:56:09         11 test.txt
[ec2-user@ip-172-31-38-138 ~]$ aws s3 cp s3://lj-s3-c04-iac01/test.txt ./test2.txt
download: s3://lj-s3-c04-iac01/test.txt to ./test2.txt
[ec2-user@ip-172-31-38-138 ~]$ ls
test.txt test2.txt
[ec2-user@ip-172-31-38-138 ~]$ echo "$(<test2.txt)"
hello world
```
***
Answer for exercise [c04-iac01](https://github.com/devopsacademyau/academy/blob/af71c8c5c94a36439854d642cc64ac103d8507e3/classes/04class/exercises/c04-iac01/README.md)