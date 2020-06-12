# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
$ aws s3 mb s3://mrcsmonteiro-devops-academy-bucket
make_bucket: mrcsmonteiro-devops-academy-bucket

$ aws s3 cp file.txt s3://mrcsmonteiro-devops-academy-bucket
upload: ./file.txt to s3://mrcsmonteiro-devops-academy-bucket/file.txt

$ aws s3 ls s3://mrcsmonteiro-devops-academy-bucket
2020-06-12 20:30:17          0 file.txt
```

- Commands to allow the EC2 instance to access the files in S3:
```
$ aws ec2 associate-iam-instance-profile --instance-id i-00078c13bff5b2222 --iam-instance-profile Name=S3Access4EC2

{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-08a1154d4fb0b242f",
        "InstanceId": "i-00078c13bff5b2222",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::149613515908:instance-profile/S3Access4EC2",
            "Id": "AIPASFVNJCSCIJA7CHB2K"
        },
        "State": "associating"
    }
}
```

- Commands to copy the S3 file to a folder inside the instace (executed from inside the EC2 Instance):
```
[ec2-user@ip-172-31-35-234 ~]$ aws s3 cp s3://mrcsmonteiro-devops-academy-bucket/file.txt .
download: s3://mrcsmonteiro-devops-academy-bucket/file.txt to ./file.txt

[ec2-user@ip-172-31-35-234 ~]$ ls -l file.txt
-rw-rw-r-- 1 ec2-user ec2-user 0 Jun 12 10:30 file.txt
```

- Add a brief descrition of the challenges you faced:
```
I had an IAM Role with S3 Read Only permissions on my AWS account, so I just had to browse the AWS docos a bit to find the CLI commands to attach it to the instance.
```

***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)
