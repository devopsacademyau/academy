# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
aws s3 mb s3://tkav-dojo --region ap-southeast-2
aws s3 cp hello.txt s3://tkav-dojo/hello.txt
```

- Commands to allow the EC2 instance to access the files in S3:

Created `ec2-role-trust-policy.json` file
```json
{
    "Version": "2012-10-17",
    "Statement": {
    "Effect": "Allow",
    "Principal": {"Service": "ec2.amazonaws.com"},
    "Action": "sts:AssumeRole"
    }
}
 ```

Create role
```
aws iam create-role --role-name tkavS3BucketRole --description "Allow Access to S3 bucket"  --assume-role-policy-document file://ec2-role-trust-policy.json
```

Output
```
{
    "Role": {
        "Path": "/",
        "RoleName": "tkavS3BucketRole",
        "RoleId": "AROASHFUBKMH3WSBZIFMG",
        "Arn": "arn:aws:iam::152848913167:role/tkavS3BucketRole",
        "CreateDate": "2021-09-29T08:30:26+00:00",
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

```
aws iam attach-role-policy --role-name tkavS3BucketRole --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess

aws iam create-instance-profile --instance-profile-name tkavS3BucketRole-Instance-Profile
```

Output
```
{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "tkavS3BucketRole-Instance-Profile",
        "InstanceProfileId": "AIPASHFUBKMHRG7UN2WKU",
        "Arn": "arn:aws:iam::152848913167:instance-profile/tkavS3BucketRole-Instance-Profile",
        "CreateDate": "2021-09-29T12:05:37+00:00",
        "Roles": []
    }
}
```

Add role to instance profile
```
aws iam add-role-to-instance-profile --role-name tkavS3BucketRole --instance-profile-name tkavS3BucketRole-Instance-Profile
```

Create instance
```
aws ec2 run-instances \
    --image-id ami-0210560cedcb09f07 \
    --key-name tk-contino-dev \
    --instance-type t2.micro \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=tk-s3-test}]'
```

Assign role
```
aws ec2 associate-iam-instance-profile --instance-id i-072cae181b5212853 --iam-instance-profile Name=tkavS3BucketRole-Instance-Profile
```

Attach security group to allow SSH
```
aws ec2 modify-instance-attribute \
	--instance-id i-072cae181b5212853 \
	--groups sg-013f620525812aaeb
```

- Commands to copy the S3 file to a folder inside the instance (executed from inside the EC2 Instance):
```
ssh ec2-user@3.26.67.77
aws s3 cp s3://tkav-dojo/hello.txt hello.txt

[ec2-user@ip-172-31-43-33 ~]$ ls
hello.txt
```

- Add a brief description of the challenges you faced:
```
I was trying to attach the role directly to the instance at first rather than creating an instance profile.
```

<!-- Don't change anything below this point-->
<!-- Before committing, remove both commented lines--> 
***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)