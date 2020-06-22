# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
$ aws s3 mb s3://my-unique-bucket-048 --region ap-southeast-2
make_bucket: my-unique-bucket-048

$ aws s3 cp myFile.txt s3://my-unique-bucket-048/
upload: ./myFile.txt to s3://my-unique-bucket-048/myFile.txt
```

- Commands to allow the EC2 instance to access the files in S3:
```
# EC2 Role Policy
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
```

```
$ aws iam create-role --role-name s3-access --assume-role-policy-document file://ec2-trust-policy.json
{
    "Role": {
        "Path": "/",
        "RoleName": "s3-access",
        "RoleId": "AROAV7C6Y3VIC5IAULFDA",
        "Arn": "arn:aws:iam::410368138576:role/s3-access",
        "CreateDate": "2020-06-22T11:23:02+00:00",
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
```

```
# S3 Access Policy
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
              "arn:aws:s3:::my-unique-bucket-048",
              "arn:aws:s3:::my-unique-bucket-048/*"
            ]
        }
    ]
}
```

```
$ aws iam put-role-policy --role-name s3-access --policy-name s3-access-policy --policy-document file://s3-access-policy.json
```

```
$ aws iam create-instance-profile --instance-profile-name s3-access-profile
{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "s3-access-profile",
        "InstanceProfileId": "AIPAV7C6Y3VINTYT7WYTH",
        "Arn": "arn:aws:iam::410368138576:instance-profile/s3-access-profile",
        "CreateDate": "2020-06-22T11:41:56+00:00",
        "Roles": []
    }
}
```

```
aws iam add-role-to-instance-profile --instance-profile-name s3-access-profile --role-name=s3-access
```

```
$ aws ec2 associate-iam-instance-profile --instance-id i-02e9881307f0bb222 --iam-instance-profile Name=s3-access-profile
{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-0a712f8c096ffecdb",
        "InstanceId": "i-02e9881307f0bb222",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::410368138576:instance-profile/s3-access-profile",
            "Id": "AIPAV7C6Y3VINTYT7WYTH"
        },
        "State": "associating"
    }
}
```

- Commands to copy the S3 file to a folder inside the instace (executed from inside the EC2 Instance):
```
$ ssh -A ec2-user@13.211.173.223
Last login: Mon Jun 22 10:02:40 2020 from 194-193-191-30.tpgi.com.au

       __|  __|_  )
       _|  (     /   Amazon Linux AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-ami/2018.03-release-notes/
5 package(s) needed for security, out of 7 available
Run "sudo yum update" to apply all updates.
```

```
[ec2-user@ip-172-31-45-101 ~]$ aws s3 cp s3://my-unique-bucket-048/myFile.txt myFileEC2.txt
download: s3://my-unique-bucket-048/myFile.txt to ./myFileEC2.txt
```

- Add a brief description of the challenges you faced:
```
The main challenge was to understand the concepts of roles, policies, instance profiles and how they fit in all together to get the job done, i.e. creating the necessary access rights in this case. Another interesting learning experience is how the policies are declared in the form of JSON. 
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)