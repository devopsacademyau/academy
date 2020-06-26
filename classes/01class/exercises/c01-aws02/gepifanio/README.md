# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:

```
aws s3 mb s3://mybucket-exercise

make_bucket: mybucket-exercise

aws s3 cp README.md s3://mybucket-exercise/README.md

upload: ./README.md to s3://mybucket-exercise/README.md

```

- Commands to allow the EC2 instance to access the files in S3:

```
aws iam create-role --role-name S3ReadOnly_Access --assume-role-policy-document file://classes/01class/exercises/c01-aws02/gepifanio/policy.json

{
    "Role": {
        "Path": "/",
        "RoleName": "S3ReadOnly_Access",
        "RoleId": "AROA4WY4CJDMVS3K5Q7UE",
        "Arn": "arn:aws:iam::873547843801:role/S3ReadOnly_Access",
        "CreateDate": "2020-06-17T08:04:40+00:00",
        "AssumeRolePolicyDocument": {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Effect": "Allow",
                    "Principal": {
                        "Service": [
                            "ec2.amazonaws.com"
                        ]
                    },
                    "Action": [
                        "sts:AssumeRole"
                    ]
                }
            ]
        }
    }
}

aws iam attach-role-policy --role-name S3ReadOnly_Access --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess

aws iam create-instance-profile --instance-profile-name S3ReadOnly_Access-EC2-Profile

{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "S3ReadOnly_Access-EC2-Profile",
        "InstanceProfileId": "AIPA4WY4CJDM4Z4GFMXSQ",
        "Arn": "arn:aws:iam::873547843801:instance-profile/S3ReadOnly_Access-EC2-Profile",
        "CreateDate": "2020-06-17T08:08:04+00:00",
        "Roles": []
    }
}

aws iam add-role-to-instance-profile --role-name S3ReadOnly_Access --instance-profile-name S3ReadOnly_Access-EC2-Profile

aws ec2 associate-iam-instance-profile --instance-id i-0bfad0697a93cdf94 --iam-instance-profile Name=S3ReadOnly_Access-EC2-Profile

{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-0daa9a21c1f9c3e43",
        "InstanceId": "i-0bfad0697a93cdf94",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::873547843801:instance-profile/S3ReadOnly_Access-EC2-Profile",
            "Id": "AIPA4WY4CJDM4Z4GFMXSQ"
        },
        "State": "associated"
    }
}

ssh -i "MyKeyPair.pem" ubuntu@ec2-52-13-219-101.us-west-2.compute.amazonaws.com

ubuntu@ip-172-31-28-92:~$ aws s3 ls
2020-06-13 04:37:54 mybucket-exercise

```

- Commands to copy the S3 file to a folder inside the instace (executed from inside the EC2 Instance):

```
ubuntu@ip-172-31-28-92:~$ aws s3 cp s3://mybucket-exercise/README.md README.md

download: s3://mybucket-exercise/README.md to ./README.md

```

- Add a brief descrition of the challenges you faced:

```

The challanges I had is to create the IAM role and add it to the EC2 instance using the `aws cli` as I couldnt figure out the commands.

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines-->
***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)
