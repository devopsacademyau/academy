# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
aws s3 mb s3://williamdabucket
make_bucket: williamdabucket

```

- Commands to allow the EC2 instance to access the files in S3:
## Create policy
```
aws iam create-policy --policy-name williams3access \
--policy-document file://williams3access.json
{
    "Policy": {
        "PolicyName": "williams3access",
        "PolicyId": "ANPASHFUBKMH2YIPXBFPZ",
        "Arn": "arn:aws:iam::152848913167:policy/williams3access",
        "Path": "/",
        "DefaultVersionId": "v1",
        "AttachmentCount": 0,
        "PermissionsBoundaryUsageCount": 0,
        "IsAttachable": true,
        "CreateDate": "2022-08-22T02:55:02+00:00",
        "UpdateDate": "2022-08-22T02:55:02+00:00"
    }
}
```

## Create an IAM role for the instance to allow s3 access
```
aws iam create-role --role-name williamec2s3 \
--assume-role-policy-document file://williamec2s3-Trust-Policy.json
{
    "Role": {
        "Path": "/",
        "RoleName": "williamec2s3",
        "RoleId": "AROASHFUBKMHW7KO7MYEQ",
        "Arn": "arn:aws:iam::152848913167:role/williamec2s3",
        "CreateDate": "2022-08-22T02:55:23+00:00",
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

aws iam attach-role-policy --role-name williamec2s3 \  
 --policy-arn arn:aws:iam::152848913167:policy/williams3access

aws iam create-instance-profile --instance-profile-name williamec2s3-Instance-Profile
{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "williamec2s3-Instance-Profile",
        "InstanceProfileId": "AIPASHFUBKMHYVH3BCNBU",
        "Arn": "arn:aws:iam::152848913167:instance-profile/williamec2s3-Instance-Profile",
        "CreateDate": "2022-08-22T02:59:01+00:00",
        "Roles": []
    }
}

aws iam add-role-to-instance-profile --role-name williamec2s3 \ 
--instance-profile-name williamec2s3-Instance-Profile

aws ec2 associate-iam-instance-profile --instance-id i-0e83cb700181e32fe --iam-instance-profile Name=williamec2s3-Instance-Profile
{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-0552fc09919519461",
        "InstanceId": "i-0e83cb700181e32fe",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::152848913167:instance-profile/williamec2s3-Instance-Profile",
            "Id": "AIPASHFUBKMHYVH3BCNBU"
        },
        "State": "associating"
    }
}
```

- Commands to copy the S3 file to a folder inside the instance (executed from inside the EC2 Instance):
```
[ec2-user@ip-172-31-42-30 ~]$ aws --region ap-southeast-2 s3 ls s3://williamdabucket/
[ec2-user@ip-172-31-42-30 ~]$ touch hello.txt
[ec2-user@ip-172-31-42-30 ~]$ aws --region ap-southeast-2 s3 cp hello.txt s3://williamdabucket/
upload: ./hello.txt to s3://williamdabucket/hello.txt
[ec2-user@ip-172-31-42-30 ~]$ aws --region ap-southeast-2 s3 ls s3://williamdabucket/
2022-08-22 03:11:24          0 hello.txt
[ec2-user@ip-172-31-42-30 ~]$ 
```

- Add a brief description of the challenges you faced:
```
Originally was trying to access s3 with the instance that had no public ip. This caused an issue since there was no way to s3 unless i create a gateway.
```


***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)

