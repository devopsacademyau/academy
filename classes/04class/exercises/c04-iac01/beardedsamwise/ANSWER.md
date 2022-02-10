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

## Validate that the EC2 instance can perform operations on the S3 bucket
```
[ec2-user@ip-172-31-16-100 ~]$ aws s3 ls c04-iac01-adtcawx8
2022-02-09 23:50:46         63 test.txt
```

***
Answer for exercise [c04-iac01](https://github.com/devopsacademyau/academy/blob/af71c8c5c94a36439854d642cc64ac103d8507e3/classes/04class/exercises/c04-iac01/README.md)