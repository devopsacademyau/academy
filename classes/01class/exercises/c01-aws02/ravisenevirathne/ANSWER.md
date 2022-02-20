# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
aws s3 mb s3://ravisenevirathne-c01-aws02
make_bucket: ravisenevirathne-c01-aws02

% aws s3 cp test.txt s3://ravisenevirathne-c01-aws02
upload: ./test.txt to s3://ravisenevirathne-c01-aws02/test.txt  
```

- Commands to allow the EC2 instance to access the files in S3:
```
1. create a Role-Trust-Policy.json with the following code
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}

2. Create IAM role

aws iam create-role --role-name ravisenevirathne-S3-Role --assume-role-policy-document file://Role-Trust-Policy.json

{
    "Role": {
        "Path": "/",
        "RoleName": "ravisenevirathne-S3-Role",
        "RoleId": "AROASHFUBKMHS4RJJXKS5",
        "Arn": "arn:aws:iam::152848913167:role/ravisenevirathne-S3-Role",
        "CreateDate": "2022-02-20T12:49:03+00:00",
        "AssumeRolePolicyDocument": {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Sid": "",
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

3. Attach AmazonS3ReadOnly policy to role

aws iam attach-role-policy \
    --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess \
    --role-name ravisenevirathne-S3-Role

4. Create Instance Profile

aws iam create-instance-profile --instance-profile-name ravisenevirathne-S3-Role-Profile

{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "ravisenevirathne-S3-Role-Profile",
        "InstanceProfileId": "AIPASHFUBKMH523WGCO7W",
        "Arn": "arn:aws:iam::152848913167:instance-profile/ravisenevirathne-S3-Role-Profile",
        "CreateDate": "2022-02-20T12:51:25+00:00",
        "Roles": []
    }
}

5. Add IAM role to the intance profile

aws iam add-role-to-instance-profile --role-name ravisenevirathne-S3-Role --instance-profile-name ravisenevirathne-S3-Role-Profile

6. Attach IAM role to EC2 by using associate-iam-instance-profile command

aws ec2 associate-iam-instance-profile \
    --instance-id i-001ad4dd32ef4bfdb \
    --iam-instance-profile Name="ravisenevirathne-S3-Role-Profile"

{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-0a9c1020210bd7c57",
        "InstanceId": "i-001ad4dd32ef4bfdb",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::152848913167:instance-profile/ravisenevirathne-S3-Role-Profile",
            "Id": "AIPASHFUBKMH523WGCO7W"
        },
        "State": "associating"
    }
}

REF - https://aws.amazon.com/premiumsupport/knowledge-center/ec2-instance-access-s3-bucket/

      https://aws.amazon.com/premiumsupport/knowledge-center/iam-role-not-in-list/

      https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html



```

- Commands to copy the S3 file to a folder inside the instance (executed from inside the EC2 Instance):
```
ssh ec2-user@54.206.130.118

[ec2-user@ip-172-31-33-99 ~]$ aws s3 cp s3://ravisenevirathne-c01-aws02/test.txt .
download: s3://ravisenevirathne-c01-aws02/test.txt to ./test.txt 

```

- Add a brief description of the challenges you faced:
```
It was quite challenge for me to understand the process of allowing EC2 to setup S3 access using AWS cli.  
So I have referred to below sites to understand involved steps.

REF - https://aws.amazon.com/premiumsupport/knowledge-center/ec2-instance-access-s3-bucket/

      https://aws.amazon.com/premiumsupport/knowledge-center/iam-role-not-in-list/

      https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html

```

<!-- Don't change anything below this point-->
<!-- Before committing, remove both commented lines--> 
***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)