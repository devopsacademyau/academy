# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
$ aws s3 mb s3://c01-aws02-20220216
make_bucket: c01-aws02-20220216
```

- Commands to allow the EC2 instance to access the files in S3:
```
$ aws iam create-role --role-name s3readonly --assume-role-policy-document file://s3readonly.json

{
    "Role": {
        "Path": "/",
        "RoleName": "s3readonly",
        "RoleId": "AROAZJVRFZKVTZBS46JQB",
        "Arn": "arn:aws:iam::639247960747:role/s3readonly",
        "CreateDate": "2022-02-16T00:58:34+00:00",
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

$ aws iam attach-role-policy --role-name s3readonly --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess

$ aws iam create-instance-profile --instance-profile-name s3readonly

{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "s3readonly",
        "InstanceProfileId": "AIPAZJVRFZKVQEF54NGGP",
        "Arn": "arn:aws:iam::639247960747:instance-profile/s3readonly",
        "CreateDate": "2022-02-16T01:02:28+00:00",
        "Roles": []
    }
}

$ aws iam add-role-to-instance-profile --role-name s3readonly --instance-profile-name s3readonly

$ aws ec2 associate-iam-instance-profile --instance-id i-08d6f2a3bf277efed --iam-instance-profile Name=s3readonly

{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-0d4d951d6b88748ce",
        "InstanceId": "i-08d6f2a3bf277efed",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::639247960747:instance-profile/s3readonly",
            "Id": "AIPAZJVRFZKVQEF54NGGP"
        },
        "State": "associating"
    }
}
```

- Commands to copy the S3 file to a folder inside the instance (executed from inside the EC2 Instance):
```
$ ssh -A ec2-user@ec2-3-104-66-72.ap-southeast-2.compute.amazonaws.com
Last login: Wed Feb 16 00:25:17 2022 from 115-64-227-252.tpgi.com.au

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
3 package(s) needed for security, out of 6 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-31-102 ~]$
[ec2-user@ip-172-31-31-102 ~]$
[ec2-user@ip-172-31-31-102 ~]$ aws s3 ls
2022-02-16 00:49:08 c01-aws02-20220216
2021-11-25 07:23:29 cf-templates-1b0f17j97pa58-ap-southeast-1
2021-11-20 05:21:06 cf-templates-1b0f17j97pa58-ap-southeast-2
[ec2-user@ip-172-31-31-102 ~]$ aws s3 ls s3://c01-aws02-20220216
2022-02-16 01:04:12       8648 aws01.txt
[ec2-user@ip-172-31-31-102 ~]$
```

- Add a brief description of the challenges you faced:
```
I didn't really have any :grimacing:
```

***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)