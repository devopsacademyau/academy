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



