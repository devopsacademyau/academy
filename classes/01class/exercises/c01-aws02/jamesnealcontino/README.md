# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
aws s3api create-bucket --bucket neljn-test-contino --region ap-southeast-2

aws s3 cp testfile.txt s3://neljn-test-contino/
```

- Commands to allow the EC2 instance to access the files in S3:
```
aws iam create-role --role-name neljn-test-ec2role --assume-role-policy-document file://neljn-test-ec2role.json
```

```
aws iam create-instance-profile --instance-profile-name neljn-test-ec2role-profile

aws iam add-role-to-instance-profile --role-name neljn-test-ec2role --instance-profile-name neljn-test-ec2role-profile
```

```
aws ec2 associate-iam-instance-profile --instance-id <instanceID> --iam-instance-profile Name=neljn-test-ex2role-profile
```



- EC2 Role
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*",
            ],
            "Resource": "*"
        }
    ]
}
```

- Commands to copy the S3 file to a folder inside the instance (executed from inside the EC2 Instance):
```
aws s3 cp s3://neljn-test-contino /
```

- Add a brief description of the challenges you faced:
```
attatching a role to the instance had more steps than expected when compared to the Console. 
Needed to create a profile first
```
 
***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)