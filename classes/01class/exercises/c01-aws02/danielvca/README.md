# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
❯ aws s3 mb s3://devopsacademydaniel
make_bucket: devopsacademydaniel

❯ aws s3 cp Dockerfile s3://devopsacademydaniel
upload: ./Dockerfile to s3://devopsacademydaniel/Dockerfile

❯ touch ec2policy.json
❯ ls
ec2policy.json
❯ nano ec2policy.json
❯ la
total 8
-rw-r--r--  1 danielandrade  staff   346B 19 Jun 16:46 policy.json
```

- Commands to allow the EC2 instance to access the files in S3:
 
**JSON**

     {  "Version":  "2012-10-17",  "Statement":  [  {  "Effect":  "Allow",  "Principal":  {  "Service":  "ec2.amazonaws.com"  },  "Action":  "sts:AssumeRole"  }  ]  }

```
Create role:

$aws iam create-role --role-name Ec2ReadyOnlyToS3 --assume-role-policy-document file://fileabove.json 

Attach Role Policy

$aws iam attach-role-policy --role-name Ec2ReadyOnlyToS3 --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess

Instance Profile

aws iam create-instance-profile --instance-profile-name Ec2ReadyOnlyToS3InstanceProfile

InstanceProfile:
  Arn: arn:aws:iam::646093908012:instance-profile/Ec2ReadyOnlyToS3InstanceProfile
  CreateDate: '2020-06-19T07:43:09+00:00'
  InstanceProfileId: AIPAZM3RSVAWBVN2C44NY
  InstanceProfileName: Ec2ReadyOnlyToS3InstanceProfile
  Path: /
  Roles: []

Adding instance 
aws iam add-role-to-instance-profile --role-name Ec2ReadyOnlyToS3 --instance-profile-name Ec2ReadyOnlyToS3InstanceProfile

Attaching to EC2

aws ec2 associate-iam-instance-profile --instance-id i-01f387139880d9c29 --iam-instance-profile Name=Ec2ReadyOnlyToS3InstanceProfile

IamInstanceProfileAssociation:
  AssociationId: iip-assoc-009b5ac3ff5aa0f6d
  IamInstanceProfile:
    Arn: arn:aws:iam::646093908012:instance-profile/Ec2ReadyOnlyToS3InstanceProfile
    Id: AIPAZM3RSVAWBVN2C44NY
  InstanceId: i-01f387139880d9c29
  State: associating
```

- Commands to copy the S3 file to a folder inside the instace (executed from inside the EC2 Instance):
```
 aws s3 cp s3://devopsacademydaniel/Dockerfile Dockerfile

[ec2-user@ip-172-31-2-35 ~]$  aws s3 cp s3://devopsacademydaniel/Dockerfile Dockerfile
download: s3://devopsacademydaniel/Dockerfile to ./Dockerfile
[ec2-user@ip-172-31-2-35 ~]$

```

- Add a brief description of the challenges you faced:
```
Instance-Profile associations
```
Reference: [https://aws.amazon.com/blogs/security/new-attach-an-aws-iam-role-to-an-existing-amazon-ec2-instance-by-using-the-aws-cli/#:~:text=To%20create%20an%20IAM%20role%20from%20the%20AWS%20CLI%3A,json.&text=Call%20the%20attach%2Drole%2Dpolicy,access%20resources%20in%20your%20account.](https://aws.amazon.com/blogs/security/new-attach-an-aws-iam-role-to-an-existing-amazon-ec2-instance-by-using-the-aws-cli/#:~:text=To%20create%20an%20IAM%20role%20from%20the%20AWS%20CLI%3A,json.&text=Call%20the%20attach%2Drole%2Dpolicy,access%20resources%20in%20your%20account.)

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)

> Written with [StackEdit](https://stackedit.io/).