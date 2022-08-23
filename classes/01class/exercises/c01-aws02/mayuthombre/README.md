# C01-AWS02

## Commands Execution Output

# Use the CLI to create a S3 bucket and upload a file to it.
```
aws s3api create-bucket --bucket mayu-bucket-dojo --region us-east-1 
> Output
{
    "Location": "/mayu-bucket-dojo"
}
To upload file to S3
aws s3api put-object --bucket mayu-bucket-dojo --key test.png --body test.png  
> Output
{
    "ETag": "\"a055e1481ff2e9f715d912d7aba57da8\""
}
```

# Access the file on the S3 bucket from any of the EC2 instances created in the previous exercise.

- Commands to allow the EC2 instance to access the files in S3:

```
Create a JSON policy that will be attached to the IAM role. Create a new JSON file with following policy line
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Principal": {"Service": "ec2.amazonaws.com"},
    "Action": "sts:AssumeRole"
  }
}
```

Then, using CLI run the command

```
aws iam create-role --role-name S3BucketRole --description "Allow Access to S3Bucket"  --assume-role-policy-document file://s3bucketEc2-Role-Trust-Policy.json
> Output
{
    "Role": {
        "Path": "/",
        "RoleName": "S3BucketRole",
        "RoleId": "AROASHFUBKMHRLKUP5VIR",
        "Arn": "arn:aws:iam::152848913167:role/S3BucketRole",
        "CreateDate": "2022-08-17T00:03:06+00:00",
        "AssumeRolePolicyDocument": {
            "Version": "2012-10-17",
            "Statement": {
                "Effect": "Allow",
                "Principal": {
                    "Service": "ec2.amazonaws.com"
                },
                "Action": "sts:AssumeRole"
            }
        }
    }
}
```

Now to attach the just created policy to the role,

```
aws iam attach-role-policy --role-name S3BucketRole --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess
```

To create instance profile

```
aws iam create-instance-profile --instance-profile-name Mayu-s3bucket-access-profile
> Output:
{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "Mayu-s3bucket-access-profile",
        "InstanceProfileId": "AIPASHFUBKMHRESNORMGK",
        "Arn": "arn:aws:iam::152848913167:instance-profile/Mayu-s3bucket-access-profile",
        "CreateDate": "2022-08-17T00:09:20+00:00",
        "Roles": []
    }
}
```
Add role to the instance profile

```
aws iam add-role-to-instance-profile --instance-profile-name Mayu-s3bucket-access-profile --role-name S3BucketRole
```
Finally, associate instance profile to instance ID
```
aws ec2 associate-iam-instance-profile --instance-id i-0721c0fec6d206721 --iam-instance-profile Name="Mayu-s3bucket-access-profile" 
> Output:
{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-026d9087051ffe00a",
        "InstanceId": "i-0e3c863d681622cd0",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::152848913167:instance-profile/Mayu-s3bucket-access-profile",
            "Id": "AIPASHFUBKMHRESNORMGK"
        },
        "State": "associating"
    }
}
```

Test if S3 access is allowed using command

```
aws s3 ls s3://mayu-bucket-dojo
> Output should look like
2022-08-16 07:31:01     226496 test.png
```

- Commands to copy the S3 file to a folder inside the instance (executed from inside the EC2 Instance):

Assuming you already have logged into the EC2 via CLI. If not please refer to exercice c01-aws01
To copy all objects in an S3 bucket to your local machine simply use the aws s3 cp command with the --recursive option.

```
aws s3 cp s3://mayu-bucket-dojo/test.png test.png
> output
download: s3://mayu-bucket-dojo/test.png to ./test.png   
```

use ls command to check if file is downloaded
```
Reference - https://docs.aws.amazon.com/cli/latest/reference/s3/cp.html

# Add a brief description of the challenges you faced:
```
- I faced errors creating JSON policy and attaching it to the IAM instance profile
- Also, finding IPv4 for newly created instance was like finding a needle in haystack. So easiest way was to obtain IP from AWS management console.
- Lastly, for creating pem key I had to rely on AWS console again. I tried creating pem key via CLI but it wouldnt download the key. Subsequebtly, I couldn't access the EC2 instance without key. 
```


***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)