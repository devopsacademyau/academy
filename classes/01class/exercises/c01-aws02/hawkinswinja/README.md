# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
zemaria@z3maria:~$ aws s3 mb s3://devops.aws102.ac --region us-east-1
make_bucket: devops.aws102.ac
zemaria@z3maria:~$ aws s3 cp hello.txt s3://devops.aws102.ac
upload: ./hello.txt to s3://devops.aws102.ac/hello.txt
```

- Commands to allow the EC2 instance to access the files in S3:

```
zemaria@z3maria:~$ cat trust_policy.json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com"
                ]
            }
        }
    ]
}
```

```
zemaria@z3maria:~$ aws iam create-role --role-name s3-read --assume-role-policy-document file://trust_policy.json
{
    "Role": {
        "Path": "/",
        "RoleName": "s3-read",
        "RoleId": "AROAYU3DRPZRNM2QI36YH",
        "Arn": "arn:aws:iam::594524864098:role/s3-read",
        "CreateDate": "2023-09-13T14:14:29+00:00",
        "AssumeRolePolicyDocument": {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Effect": "Allow",
                    "Action": [
                        "sts:AssumeRole"
                    ],
                    "Principal": {
                        "Service": [
                            "ec2.amazonaws.com"
                        ]
                    }
                }
            ]
        }
    }
}
zemaria@z3maria:~$ aws iam attach-role-policy --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess --role-name s3-read
zemaria@z3maria:~$ aws iam create-instance-profile --instance-profile-name s3Access
{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "s3Access",
        "InstanceProfileId": "AIPAYU3DRPZRH5Y3Z6FJI",
        "Arn": "arn:aws:iam::594524864098:instance-profile/s3Access",
        "CreateDate": "2023-09-13T14:24:27+00:00",
        "Roles": []
    }
}
zemaria@z3maria:~$ aws iam add-role-to-instance-profile --role-name s3-read --instance-profile-name s3Access
```

*Attach the profile to the instances created in c01-aws01*
```
zemaria@z3maria:~$ aws ec2 associate-iam-instance-profile --instance-id i-0c01130c9fb724b79 --iam-instance-profile Name=s3Access
{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-05545c379a4790eb6",
        "InstanceId": "i-0c01130c9fb724b79",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::594524864098:instance-profile/s3Access",
            "Id": "AIPAYU3DRPZRH5Y3Z6FJI"
        },
        "State": "associating"
    }
}

```

- Commands to copy the S3 file to a folder inside the instance (executed from inside the EC2 Instance):
```
[ec2-user@ip-172-31-43-211 ~]$ aws s3 cp s3://devops.aws102.ac/hello.txt .
download: s3://devops.aws102.ac/hello.txt to ./hello.txt
```

- Add a brief description of the challenges you faced:
```
Writing the trust policy to assume role when creating a role was challenging before I copied it from the aws console
```

***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)
