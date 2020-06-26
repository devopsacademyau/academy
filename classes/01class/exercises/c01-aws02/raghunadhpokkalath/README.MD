# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
Create S3 bucket in syndney region

> aws s3 mb s3://raghunadhpokkalath-devopsacademyau --region ap-southeast-2
make_bucket: raghunadhpokkalath-devopsacademyau

Copy file to s3 bucket

> aws s3 cp s3test.txt s3://raghunadhpokkalath-devopsacademyau

upload: ./s3test.txt to s3://raghunadhpokkalath-devopsacademyau/s3test.txt

Confirm File is uploadded in S3
> aws s3 ls s3://raghunadhpokkalath-devopsacademyau/   
2020-06-17 22:42:29         31 s3test.txt
```

- Commands to allow the EC2 instance to access the files in S3:
```
 Create a trust policy for EC2 and save it to ec2-trust-policy.json
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

Create a IAM role to access S3 based on trust policy

> aws iam create-role --role-name ec2-s3-access-role --assume-role-policy-document file://ec2-trust-policy.json
{
    "Role": {
        "Path": "/",
        "RoleName": "ec2-s3-access-role",
        "RoleId": "AROAVILGUBXHRMSC7NI3E",
        "Arn": "arn:aws:iam::361529347535:role/ec2-s3-access-role",
        "CreateDate": "2020-06-18T12:00:38+00:00",
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

Attach S3 readonly access role policy to IAM role
> aws iam attach-role-policy --role-name ec2-s3-access-role --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess

Create an instance profile
> aws iam create-instance-profile --instance-profile-name ec2-s3-acces-profile
{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "ec2-s3-acces-profile",
        "InstanceProfileId": "AIPAVILGUBXH7EZXOFGET",
        "Arn": "arn:aws:iam::361529347535:instance-profile/ec2-s3-acces-profile",
        "CreateDate": "2020-06-18T12:02:10+00:00",
        "Roles": []
    }
}

Add role to instance profile
> aws iam add-role-to-instance-profile --role-name ec2-s3-access-role --instance-profile-name ec2-s3-acces-profile

Associate instance profile with existing EC2 instance
>aws ec2 associate-iam-instance-profile --instance-id i-0c98ac03e17a8323b --iam-instance-profile Name=ec2-s3-acces-profile
{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-0da2aca6451b402f0",
        "InstanceId": "i-0c98ac03e17a8323b",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::361529347535:instance-profile/ec2-s3-acces-profile",
            "Id": "AIPAVILGUBXH7EZXOFGET"
        },
        "State": "associating"
    }
}

Verify instance profile is attached
> aws ec2 describe-iam-instance-profile-associations

{
    "IamInstanceProfileAssociations": [
        {
            "AssociationId": "iip-assoc-0da2aca6451b402f0",
            "InstanceId": "i-0c98ac03e17a8323b",
            "IamInstanceProfile": {
                "Arn": "arn:aws:iam::361529347535:instance-profile/ec2-s3-acces-profile",
                "Id": "AIPAVILGUBXH7EZXOFGET"
            },
            "State": "associated"
        }
    ]
}

Connect to EC2 instance
> ssh ec2-user@3.25.132.226
Last login: Thu Jun 18 11:45:39 2020 from 89.95.96.58.static.exetel.com.au

       __|  __|_  )
       _|  (     /   Amazon Linux AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-ami/2018.03-release-notes/
5 package(s) needed for security, out of 7 available
Run "sudo yum update" to apply all updates.

Verify S3 can be connected
> aws s3 ls s3://raghunadhpokkalath-devopsacademyau/
2020-06-17 12:42:29         31 s3test.txt

```


- Commands to copy the S3 file to a folder inside the instace (executed from inside the EC2 Instance):


```
Create a directory in EC2
[ec2-user@ip-172-31-47-59 ~]$ mkdir s3file
[ec2-user@ip-172-31-47-59 ~]$ cd s3file/

Use AWS S3 Copy to download file to EC2 folder

[ec2-user@ip-172-31-47-59 s3file]$ aws s3 cp s3://raghunadhpokkalath-devopsacademyau/s3test.txt .
download: s3://raghunadhpokkalath-devopsacademyau/s3test.txt to ./s3test.txt
[ec2-user@ip-172-31-47-59 s3file]$ ls -lrt
total 4
-rw-rw-r-- 1 ec2-user ec2-user 31 Jun 17 12:42 s3test.txt
[ec2-user@ip-172-31-47-59 s3file]$ 
```

- Add a brief descrition of the challenges you faced:
```
I have faced below challenges.
1.Creating s3 bucket in particular region
2.Creating IAM role 
3.Associating IAM role with EC2 instance

```


***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)