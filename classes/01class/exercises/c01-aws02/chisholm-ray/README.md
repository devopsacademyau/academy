# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
➜  chisholm-ray git:(chisholm-ray/c01-aws02) aws s3 mb s3://ccr-dojo-s3-bucket --region ap-southeast-2
make_bucket: ccr-dojo-s3-bucket
```

- Commands to allow the EC2 instance to access the files in S3:
```

aws iam create-role \
--role-name ccr-dojo-s3-ec2-access \
--assume-role-policy-document file://assume-role-policy.json

➜  chisholm-ray git:(chisholm-ray/c01-aws02) ✗ aws iam get-role --role-name ccr-dojo-s3-ec2-access | tee /dev/tty
{
    "Role": {
        "Path": "/",
        "RoleName": "ccr-dojo-s3-ec2-access",
        "RoleId": "AROASHFUBKMH7RNJAVNXB",
        "Arn": "arn:aws:iam::152848913167:role/ccr-dojo-s3-ec2-access",
        "CreateDate": "2022-02-16T22:40:43+00:00",
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
        },
        "MaxSessionDuration": 3600,
        "RoleLastUsed": {}
    }
}
{
    "Role": {
        "Path": "/",
        "RoleName": "ccr-dojo-s3-ec2-access",
        "RoleId": "AROASHFUBKMH7RNJAVNXB",
        "Arn": "arn:aws:iam::152848913167:role/ccr-dojo-s3-ec2-access",
        "CreateDate": "2022-02-16T22:40:43+00:00",
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
        },
        "MaxSessionDuration": 3600,
        "RoleLastUsed": {}
    }
}

aws iam create-policy \
--policy-name ccr-dojo-s3-access-policy \
--policy-document file://s3-access-policy.json

{
    "Policy": {
        "PolicyName": "ccr-dojo-s3-access-policy",
        "PolicyId": "ANPASHFUBKMHWGDCTHRCY",
        "Arn": "arn:aws:iam::152848913167:policy/ccr-dojo-s3-access-policy",
        "Path": "/",
        "DefaultVersionId": "v1",
        "AttachmentCount": 0,
        "PermissionsBoundaryUsageCount": 0,
        "IsAttachable": true,
        "CreateDate": "2022-02-16T22:54:02+00:00",
        "UpdateDate": "2022-02-16T22:54:02+00:00"
    }
}

aws iam attach-role-policy \
--role-name ccr-dojo-s3-ec2-access \
--policy-arn arn:aws:iam::152848913167:policy/ccr-dojo-s3-access-policy

aws iam create-instance-profile \
--instance-profile-name ccr-dojo-s3-access-instance-profile

{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "ccr-dojo-s3-access-instance-profile",
        "InstanceProfileId": "AIPASHFUBKMH7IJDNL7SJ",
        "Arn": "arn:aws:iam::152848913167:instance-profile/ccr-dojo-s3-access-instance-profile",
        "CreateDate": "2022-02-16T22:58:49+00:00",
        "Roles": []
    }
}

aws iam add-role-to-instance-profile \
--role-name ccr-dojo-s3-ec2-access \
--instance-profile-name ccr-dojo-s3-access-instance-profile

aws ec2 associate-iam-instance-profile \
--instance-id i-02c167cc949ded115 \
--iam-instance-profile Name=ccr-dojo-s3-access-instance-profile

{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-0c60b1435aa17bde8",
        "InstanceId": "i-0a8739f6901e09071",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::152848913167:instance-profile/ccr-dojo-s3-access-instance-profile",
            "Id": "AIPASHFUBKMH7IJDNL7SJ"
        },
        "State": "associating"
    }
}


```

- Commands to copy the S3 file to a folder inside the instance (executed from inside the EC2 Instance):
```
[ec2-user@ip-172-31-40-176 ~]$ aws s3 ls s3://ccr-dojo-s3-bucket
[ec2-user@ip-172-31-40-176 ~]$ touch test.txt
[ec2-user@ip-172-31-40-176 ~]$ aws s3 cp test.txt s3://ccr-dojo-s3-bucket
upload: ./test.txt to s3://ccr-dojo-s3-bucket/test.txt
[ec2-user@ip-172-31-40-176 ~]$ aws s3 ls s3://ccr-dojo-s3-bucket
2022-02-16 23:07:51          0 test.txt
[ec2-user@ip-172-31-40-176 ~]$ aws s3 cp s3://ccr-dojo-s3-bucket/test.txt test2.txt
download: s3://ccr-dojo-s3-bucket/test.txt to ./test2.txt
[ec2-user@ip-172-31-40-176 ~]$ ls
test2.txt  test.txt
[ec2-user@ip-172-31-40-176 ~]$ 
```

- Add a brief description of the challenges you faced:
```
IAM is always difficult
```


***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)