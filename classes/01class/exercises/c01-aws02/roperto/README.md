# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
$ aws s3api create-bucket --bucket devops.theeroperto.com --region ap-southeast-2 --create-bucket-configuration LocationConstraint=ap-southeast-2
{
    "Location": "http://devops.theeroperto.com.s3.amazonaws.com/"
}

$ aws s3api put-public-access-block --bucket devops.theeroperto.com --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"

$ aws s3 cp ~/Downloads/b-wing.jpg s3://devops.theeroperto.com/b-wing.jpg
upload: ../../../../../../../Downloads/b-wing.jpg to s3://devops.theeroperto.com/b-wing.jpg
```

- Commands to allow the EC2 instance to access the files in S3:
```
$ cat role-trust.json
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

$ aws iam create-role --role-name DevOpsEC2S3Role  --assume-role-policy-document=file://role-trust.json
{
    "Role": {
        "Path": "/",
        "RoleName": "DevOpsEC2S3Role",
        "RoleId": "AROARCB6NGCW5BGKIRYJA",
        "Arn": "arn:aws:iam::073145331885:role/DevOpsEC2S3Role",
        "CreateDate": "2020-06-17T13:30:29+00:00",
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

$ cat policy.json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::devops.theeroperto.com/b-wing.jpg"
        }
    ]
}

$ aws iam put-role-policy --role-name DevOpsEC2S3Role --policy-name DevOpsEC2S3Policy --policy-document file://policy.json

$ aws iam create-instance-profile --instance-profile-name DevOpsEC2S3Profile
# (I lost that output)

$ aws iam add-role-to-instance-profile --instance-profile-name DevOpsEC2S3Profile --role-name DevOpsEC2S3Role

$ aws ec2 associate-iam-instance-profile --instance-id i-018b63fb239799260 --iam-instance-profile Name=DevOpsEC2S3Profile
{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-0d56daa629ec954e0",
        "InstanceId": "i-018b63fb239799260",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::073145331885:instance-profile/DevOpsEC2S3Profile",
            "Id": "AIPARCB6NGCW2YYKAVRXO"
        },
        "State": "associating"
    }
}
```

- Commands to copy the S3 file to a folder inside the instace (executed from inside the EC2 Instance):
```
$ ssh ec2-user@13.211.147.189
$ aws s3 cp s3://devops.theeroperto.com/b-wing.jpg .
download: s3://devops.theeroperto.com/b-wing.jpg to ./b-wing.jpg
```

- Add a brief descrition of the challenges you faced:
```
I created an EC2 via console (as I had deleted my previous one).
As it happens, it had an instance profile already associated which I had to delete first.

On hindsight I should have left the commands as I was recording a video,
so now I need to do some video-editing.
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)
