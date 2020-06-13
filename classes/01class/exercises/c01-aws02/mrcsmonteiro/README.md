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
$ cat << EOF > DevOps-Academy-S3-Access.json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetBucketLocation",
                "s3:ListAllMyBuckets"
            ],
            "Resource": "arn:aws:s3:::*"
        },
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::mrcsmonteiro-devops-academy-bucket",
                "arn:aws:s3:::mrcsmonteiro-devops-academy-bucket/*"
            ]
        }
    ]
}
EOF

$ cat << EOF > DevOps-Academy-EC2-Trust-Policy.json
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
EOF

$ aws iam create-role --role-name DevOps-Academy-S3-Access-Role --assume-role-policy-document file://DevOps-Academy-EC2-Trust-Policy.json

{
    "Role": {
        "Path": "/",
        "RoleName": "DevOps-Academy-S3-Access-Role",
        "RoleId": "AROASFVNJCSCD4NJYHELK",
        "Arn": "arn:aws:iam::149613515908:role/DevOps-Academy-S3-Access-Role",
        "CreateDate": "2020-06-13T03:07:23+00:00",
        "AssumeRolePolicyDocument": {
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
    }
}

$ aws iam put-role-policy --role-name DevOps-Academy-S3-Access-Role --policy-name DevOps-Academy-S3-Access-Policy --policy-document file://DevOps-Academy-S3-Access.json

$ aws iam create-instance-profile --instance-profile-name DevOpsAcademyS3Access

{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "DevOpsAcademyS3Access",
        "InstanceProfileId": "AIPASFVNJCSCNFNA3QNWW",
        "Arn": "arn:aws:iam::149613515908:instance-profile/DevOpsAcademyS3Access",
        "CreateDate": "2020-06-13T01:57:39+00:00",
        "Roles": []
    }
}

$ aws iam add-role-to-instance-profile --instance-profile-name DevOpsAcademyS3Access --role-name DevOps-Academy-S3-Access-Role

$ aws ec2 associate-iam-instance-profile --instance-id i-08124090dfbf29c4d --iam-instance-profile Name=DevOpsAcademyS3Access

{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-0aa548cce669dcdd9",
        "InstanceId": "i-08124090dfbf29c4d",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::149613515908:instance-profile/DevOpsAcademyS3Access",
            "Id": "AIPASFVNJCSCL7MGLBFSF"
        },
        "State": "associating"
    }
}
```

- Commands to copy the S3 file to a folder inside the instace (executed from inside the EC2 Instance):
```
# Instance assuming role added to instance profile and attached to itself:
[ec2-user@ip-172-31-46-215 ~]$ aws sts get-caller-identity
{
    "Account": "149613515908",
    "UserId": "AROASFVNJCSCD4NJYHELK:i-08124090dfbf29c4d",
    "Arn": "arn:aws:sts::149613515908:assumed-role/DevOps-Academy-S3-Access-Role/i-08124090dfbf29c4d"
}

[ec2-user@ip-172-31-46-215 ~]$ aws s3 cp s3://mrcsmonteiro-devops-academy-bucket/file.txt .
download: s3://mrcsmonteiro-devops-academy-bucket/file.txt to ./file.txt

[ec2-user@ip-172-31-46-215 ~]$ ls -l
total 0
-rw-rw-r-- 1 ec2-user ec2-user 0 Jun 13 03:47 file.txt
```

- Add a brief descrition of the challenges you faced:
```
Understand how policies are configured via CLI and steps to create IAM role with assume role policy for EC2, inline bucket policy, instance profile with IAM role added to it and associated with EC2 instance that will access S3 following defined policies.
```

***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)
