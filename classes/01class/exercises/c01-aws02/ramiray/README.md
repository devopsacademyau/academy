1. Created s3 bucket using following command. 

```
aws s3 mb s3://ramyadevopstest --region ap-southeast-2
make_bucket: s3://ramyadevopstest

```

2. Uploaded a text file c01-e04.txt to s3.

```
C:\Users\rramy\Downloads>aws s3 cp c01-e04.txt s3://ramyadevopstest/
upload: .\c01-e04.txt to s3://ramyadevopstest/c01-e04.txt

```

3. Download the c01-e04.txt file from s3 to the ec2instance which was created as part of  previous exercise 

```
[root@ip-172-31-45-192 ec2-user]# aws s3 cp s3://ramyadevopstest/c01-e04.txt .
fatal error: Unable to locate credentials

```

Got the above fatal credential error, so created instance profile  with limited permission to s3 bucket and attached to the instance after which the downlad was successful.

```
[root@ip-172-31-45-192 ec2-user]# aws s3 cp s3://ramyadevopstest/c01-e04.txt .
download: s3://ramyadevopstest/c01-e04.txt to ./c01-e04.txt
```


Instance Role details used to access the bucket:
 
```
aws ec2 describe-instances --instance-ids i-08dbff420f93f73dd --region ap-southeast-2 | grep -i instance-profile

"Arn": "arn:aws:iam::348662207501:instance-profile/Devopsacademyinstancerole"
```
Command to create Role, Policy and Instance Profile:

Role: Assume role policy details are provided in the json file.

```
aws iam create-role --role-name Devopsacademyinstancerole --assume-role-policy-document file://devopsacademytrustpolicy.json

```
```
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
      }
    ]
  }


```
```
Attaching the s3readonlypolicy to the role: 

```
aws iam attach-role-policy --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess --role-name Devopsacademyinstancerole

```
Creating instance profile to the ec2 

```
aws iam create-instance-profile --instance-profile-name Devopsacademyinstancerole

aws iam add-role-to-instance-profile --role-name Devopsacademyinstancerole --instance-profile-name Devopsacademyinstancerole

```
associate instance profile to EC2

```
aws ec2 associate-iam-instance-profile --instance-id i-08dbff420f93f73dd --iam-instance-profile Name=Devopsacademyinstancerole

```












