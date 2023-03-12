# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
# Creating a new bucket
$ aws s3 mb s3://da-c01-aws02-bucket
make_bucket: da-c01-aws02-bucket

# Creating a sample file
$ echo "This is a test file" >> sample.txt

# Copying the file to S3 bucket
$ aws s3 cp sample.txt s3://da-c01-aws02-bucket
upload: .\sample.txt to s3://da-c01-aws02-bucket/sample.txt
```

- Commands to allow the EC2 instance to access the files in S3:
```
# Creating a trust policy for EC2 service
$ vim da-c01-aws02-EC2TrustPolicy.json
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

# Creating an IAM role with the trust policy
$ aws iam create-role --role-name da-EC2toS3Role --assume-role-policy-document "file://da-c01-aws02-EC2TrustPolicy.json"
{
    "Role": {
        "Path": "/",
        "RoleName": "da-EC2toS3Role",
        "RoleId": "AROASZWTOVYV65MGJ6TK5",
        "Arn": "arn:aws:iam::192643247659:role/da-EC2toS3Role",
        "CreateDate": "2022-05-24T03:36:16+00:00",
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


# Creating a read-only access policy
$ vim da-c01-aws02-S3ReadPolicy.json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowReadOnlyAccessForExercise02Bucket",
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": [
                "arn:aws:s3:::da-c01-aws02-bucket/*",
                "arn:aws:s3:::da-c01-aws02-bucket"
            ]
        },
        {
            "Sid": "AllowBucketLevelActions",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:GetBucketLocation"
            ],
            "Resource": "arn:aws:s3:::*"
        }
    ]
}

# Attaching the access policy to the role
$ aws iam put-role-policy --role-name da-EC2toS3Role --policy-name da-c01-aws02-S3ReadPolicy --policy-document "file://da-c01-aws02-S3ReadPolicy.json"

# Creating an instance profile for our EC2 instance
$ aws iam create-instance-profile --instance-profile-name instance-profile-EC2toS3
{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "instance-profile-EC2toS3",
        "InstanceProfileId": "AIPASZWTOVYV6K7ZYGXPJ",
        "Arn": "arn:aws:iam::192643247659:instance-profile/instance-profile-EC2toS3",
        "CreateDate": "2022-05-24T03:50:41+00:00",
        "Roles": []
    }
}

# Adding the role to our instance profile
$ aws iam add-role-to-instance-profile --instance-profile-name instance-profile-EC2toS3 --ro
le-name da-EC2toS3Role

# Attaching the instance profile to our EC2 instache
$ aws ec2 associate-iam-instance-profile --instance-id i-019a66898ee2e2f50 --iam-instance-profile Name=instance-profile-EC2toS3
{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-03942ffd9cf8b406a",
        "InstanceId": "i-019a66898ee2e2f50",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::192643247659:instance-profile/instance-profile-EC2toS3",
            "Id": "AIPASZWTOVYV6K7ZYGXPJ"
        },
        "State": "associating"
    }
}
```

- Commands to copy the S3 file to a folder inside the instance (executed from inside the EC2 Instance):
```
# Copying file from S3 bucket to EC2
[ec2-user@ip-172-31-27-20 ~]$ aws s3 cp s3://da-c01-aws02-bucket/sample.txt sample.txt
download: s3://da-c01-aws02-bucket/sample.txt to ./sample.txt
```

- Add a brief description of the challenges you faced:
```
Finding relevant resources to create role permission/access policy with the least privilege principle is quite challenging for me. One time during the exercise, I could not use the ls command to get the list of S3 bucket from within EC2, so I needed to add another access policy that allow it.
```

***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)
