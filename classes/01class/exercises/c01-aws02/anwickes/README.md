# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
aws s3api create-bucket --bucket anwickes-devopsacademyau-bucket --region ap-southeast-2 --create-bucket-configuration LocationConstraint=ap-southeast-2

{
    "Location": "http://anwickes-devopsacademyau-bucket.s3.amazonaws.com/"
}

aws s3 cp index.html s3://anwickes-devopsacademyau-bucket

upload: .\index.html to s3://anwickes-devopsacademyau-bucket/index.html

aws s3 ls s3://anwickes-devopsacademyau-bucket

2020-07-12 16:50:06        171 index.html
```

- Commands to allow the EC2 instance to access the files in S3:
```
anwickes-devopsacademyau-bucket-role.json
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

aws iam create-role --role-name anwickes-devopsacademyau-bucket-role --assume-role-policy-document file://anwickes-devopsacademyau-bucket-role.json

{
        "RoleId": "AROAYVE3JVV7MHKVLXFEW",
        "Arn": "arn:aws:iam::595178663294:role/anwickes-devopsacademyau-bucket-role",
        "CreateDate": "2020-07-12T07:07:47+00:00",
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

anwickes-devopsacademyau-bucket-ro-policy.json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": [
                "arn:aws:s3:::anwickes-devopsacademyau-bucket",
                "arn:aws:s3:::anwickes-devopsacademyau-bucket/*"
            ]
        }
    ]
}

aws iam put-role-policy --role-name anwickes-devopsacademyau-bucket-role --policy-name anwickes-devopsacademyau-bucket-ro-policy --policy-document file://anwickes-devopsacademyau-bucket-ro-policy.json

aws iam create-instance-profile --instance-profile-name anwickes-devopsacademyau-bucket-RO-instance

{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "anwickes-devopsacademyau-bucket-RO-instance",
        "InstanceProfileId": "AIPAYVE3JVV7OIOE3RX7G",
        "Arn": "arn:aws:iam::595178663294:instance-profile/anwickes-devopsacademyau-bucket-RO-instance",
        "CreateDate": "2020-07-12T07:56:18+00:00",
        "Roles": []
    }
}

aws iam add-role-to-instance-profile --role-name anwickes-devopsacademyau-bucket-role --instance-profile-name anwickes-devopsacademyau-bucket-RO-instance

aws ec2 associate-iam-instance-profile --instance-id i-0eb95b5ec77d4ed6d --iam-instance-profile Name=anwickes-devopsacademyau-bucket-RO-instance

{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-045e8648473de8292",
        "InstanceId": "i-0eb95b5ec77d4ed6d",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::595178663294:instance-profile/anwickes-devopsacademyau-bucket-RO-instance",
            "Id": "AIPAYVE3JVV7OIOE3RX7G"
        },
        "State": "associating"
    }
}
```

- Commands to copy the S3 file to a folder inside the instance (executed from inside the EC2 Instance):
```
ssh -i anwickesPub.pem ec2-user@54.206.32.27
aws s3 ls anwickes-devopsacademyau-bucket
aws s3 cp  s3://anwickes-devopsacademyau-bucket/index.html index.html

```

- Add a brief description of the challenges you faced:
```
I am still struggling to grasp the concept of policies so that was probably the most difficult part of all of this.
```

***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)
