# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
aws s3api create-bucket \
    --bucket marshalldaniel-c02-aws02 \
    --region ap-southeast-1 \
    --create-bucket-configuration LocationConstraint=ap-southeast-1

{
    "Location": "http://marshalldaniel-c02-aws02.s3.amazonaws.com/"
}

aws s3 cp test.md s3://marshalldaniel-c02-aws02

upload: ./test.md to s3://marshalldaniel-c02-aws02/test.md
```

- Commands to allow the EC2 instance to access the files in S3:
```
- Create ec2-role-trust-policy.json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": { "Service": "ec2.amazonaws.com"},
      "Action": "sts:AssumeRole"
    }
  ]
}


- Create role with assume role policy
aws iam create-role \
    --role-name marshalldaniel-s3access \
    --assume-role-policy-document file://ec2-role-trust-policy.json

{
    "Role": {
        "Path": "/",
        "RoleName": "marshalldaniel-s3access",
        "RoleId": "AROASHFUBKMH224YEBFMI",
        "Arn": "arn:aws:iam::152848913167:role/marshalldaniel-s3access",
        "CreateDate": "2022-02-18T02:14:43+00:00",
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


- Attach s3 managed policy AmazonS3ReadOnlyAccess to role
aws iam attach-role-policy \
    --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess \
    --role-name marshalldaniel-s3access


- Create an instance profile using the create-instance-profile command
aws iam create-instance-profile \
    --instance-profile-name marshalldaniel-s3access-profile

{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "marshalldaniel-s3access-profile",
        "InstanceProfileId": "AIPASHFUBKMHV3PIP4IEK",
        "Arn": "arn:aws:iam::152848913167:instance-profile/marshalldaniel-s3access-profile",
        "CreateDate": "2022-02-18T02:17:20+00:00",
        "Roles": []
    }
}


- Add the role to the instance profile
aws iam add-role-to-instance-profile \
    --instance-profile-name marshalldaniel-s3access-profile \
    --role-name marshalldaniel-s3access


- Attach an IAM role to an instance
aws ec2 associate-iam-instance-profile \
    --instance-id i-0f24d81d67f938165 \
    --iam-instance-profile Name="marshalldaniel-s3access-profile" \
    --region ap-southeast-1

{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-01b7516ab1e8e9003",
        "InstanceId": "i-0f24d81d67f938165",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::152848913167:instance-profile/marshalldaniel-s3access-profile",
            "Id": "AIPASHFUBKMHV3PIP4IEK"
        },
        "State": "associating"
    }
}
```

- Commands to copy the S3 file to a folder inside the instance (executed from inside the EC2 Instance):
```
- Connect to bastion instance
ssh -A ec2-user@ec2-18-140-248-48.ap-southeast-1.compute.amazonaws.com


       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/


- Copy s3 file to local storage
aws s3api get-object --bucket marshalldaniel-c02-aws02 --key test.md test.md

{
    "AcceptRanges": "bytes", 
    "ContentType": "binary/octet-stream", 
    "LastModified": "Fri, 18 Feb 2022 02:01:04 GMT", 
    "ContentLength": 10, 
    "ETag": "\"248f606636cd34d90cd775ff9b7cc6b8\"", 
    "Metadata": {}
}
```

- Add a brief description of the challenges you faced:
```
- Using s3api command to create a bucket required a region to be specified.
- Downloading a file from S3 requires either internet access or gateway endpoints. So commands were run from the bastion instance which has internet access.
```

<!-- Don't change anything below this point-->
<!-- Before committing, remove both commented lines--> 
***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)