# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
aws s3 mb s3://devopsacademy-rodrigo --region ap-southeast-2
make_bucket: devopsacademy-rodrigo

touch file_for_s3.txt
rodrigo@rodrigo-Aspire-V5-471:~/DevOps/academy/classes/01class/exercises/c01-aws02/rodrigovcesar$ echo 'Content of the file for test' > file_for_s3.txt

aws s3 cp ./file_for_s3.txt s3://devopsacademy-rodrigo/
upload: ./file_for_s3.txt to s3://devopsacademy-rodrigo/file_for_s3.txt

```

- Commands to allow the EC2 instance to access the files in S3:
```
cat role-ec2.json 
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Principal": {"Service": "ec2.amazonaws.com"},
    "Action": "sts:AssumeRole"
  }
}


aws iam create-role --role-name EC2S3Role --assume-role-policy-document=file://role-ec2.json
{
    "Role": {
        "Path": "/",
        "RoleName": "EC2S3Role",
        "RoleId": "AROARP4GZM4KY3HSV6OWC",
        "Arn": "arn:aws:iam::102825027349:role/EC2S3Role",
        "CreateDate": "2020-06-20T11:08:04+00:00",
        "AssumeRolePolicyDocument": {
            "Version": "2012-10-17",
            "Statement": {
                "Effect": "Allow",
                "Principal": {
                    "Service": "ec2.amazonaws.com"
                },
                "Action": "sts:AssumeRole"
            }
        }
    }
}

cat restrictedS3Policy.json 
{
    "Version": "2012-10-17",
    "Statement": [
        {            
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::devopsacademy-rodrigo/*",
                "arn:aws:s3:::devopsacademy-rodrigo"
            ]
        }
    ]
}


aws iam put-role-policy --role-name EC2S3Role --policy-name Ec2Policy --policy-document file://restrictedS3Policy.json


aws iam create-instance-profile --instance-profile-name read-bucket-ec2
{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "read-bucket-ec2",
        "InstanceProfileId": "AIPARP4GZM4KYXBAOE6X3",
        "Arn": "arn:aws:iam::102825027349:instance-profile/read-bucket-ec2",
        "CreateDate": "2020-06-20T12:09:35+00:00",
        "Roles": []
    }
}

aws iam add-role-to-instance-profile --instance-profile-name read-bucket-ec2 --role-name EC2S3Role

aws ec2 describe-instances --query "Reservations[].Instances[].[InstanceId, PublicIpAddress]"
[
    [
        "i-02f593918dfdbae4c",
        "13.236.162.87"
    ],
    [
        "i-0c0dcd57c54d427e9",
        null
    ]
]



aws ec2 associate-iam-instance-profile --instance-id i-02f593918dfdbae4c --iam-instance-profile Name="read-bucket-ec2"
{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-0e14ce95a0b136103",
        "InstanceId": "i-02f593918dfdbae4c",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::102825027349:instance-profile/read-bucket-ec2",
            "Id": "AIPARP4GZM4KYXBAOE6X3"
        },
        "State": "associating"
    }
}



```

- Commands to copy the S3 file to a folder inside the instace (executed from inside the EC2 Instance):
```
ssh -A ec2-user@13.236.162.87
Last login: Sun Jun 21 04:33:20 2020 from 122-150-73-147.sta.wbroadband.net.au

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 10 available
Run "sudo yum update" to apply all updates.

[ec2-user@ip-172-31-32-150 ~]$ aws s3 ls s3://devopsacademy-rodrigo
2020-06-20 08:14:27         29 file_for_s3.txt

[ec2-user@ip-172-31-32-150 ~]$ mkdir S3Test

[ec2-user@ip-172-31-32-150 ~]$ aws s3 cp s3://devopsacademy-rodrigo/file_for_s3.txt ./S3Test/file_for_s3.txt
download: s3://devopsacademy-rodrigo/file_for_s3.txt to S3Test/file_for_s3.txt

[ec2-user@ip-172-31-32-150 ~]$ cat ./S3Test/file_for_s3.txt
Content of the file for test


```

- Add a brief description of the challenges you faced:
```
The creation for the bucket was fine, but my first challenge was about the Role, because I was trying to understand what was the difference with a User. From what I saw, they are similar, except the first one is to exactly assign for services such as EC2.

On my second challenge, I was trying to get the S3 file in the private instance, but I had a timeout connection. I even saw one tutorial talking about it, but since we are going to have a class about networks soon, I decided to switch to the public instance for this exercise.  
```


***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)