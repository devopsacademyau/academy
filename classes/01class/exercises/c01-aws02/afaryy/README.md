# C01-AWS02
## S3 (C01-aws02)
- Use the CLI to create a S3 bucket and upload a file to it.
- Access the file on the S3 bucket from any the EC2 instance created in the previous exercise.
- Submit a PR to the DevOpsAcademy repo under the `/classes/01class/exercises/c01-aws02/<github-username>` folder of this class with a brief description of what you did to achieve this objective. The file containing the solution you used must be named README.md


## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
aws s3 mb s3://da-co1aws02bucket
--Output:
make_bucket: da-co1aws02bucket

aws s3 cp sample.txt s3://da-co1aws02bucket
--Output:
upload: .\sample.txt to s3://da-co1aws02bucket/sample.txt

aws s3 ls s3://da-co1aws02bucket
--Output:
2020-07-05 12:58:19         19 sample.txt
```
- Commands to allow the EC2 instance to access the files in S3:
 1. Create a trust policy:
```JSON
$ cat da-c01aws02-EC2TrustPolicy.json
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

 2. Create a S3 access policy(da-c01aw02-S3ReadPolicy.json):
```JSON
$ cat da-c01aw02-S3ReadPolicy.json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "dac01aw02S31",
            "Effect": "Allow",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::da-co1aws02bucket",
                "arn:aws:s3:::da-co1aws02bucket/*"
            ]
        },
        {
            "Sid": "dac01aw02S32",
            "Effect": "Allow",
            "Action": "s3:ListAllMyBuckets",
            "Resource": "*"
        }
    ]
}
```
 3. Create an IAM Role based on the trust policy:
```
$ aws iam create-role --role-name da-EC2toS3Role --assume-role-policy-document "file://da-c01aws02-EC2TrustPolicy.json"
{
    "Role": {
        "Path": "/",
        "RoleName": "da-EC2toS3Role",
        "RoleId": "AROAWEDEMYE4IMI7BLDPF",
        "Arn": "arn:aws:iam::421117346104:role/da-EC2toS3Role",
        "CreateDate": "2020-07-05T04:22:56+00:00",
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
 4. Add the S3 access policy to the role:
```bash
$ aws iam put-role-policy --role-name da-EC2toS3Role --policy-name da-c01aw02-S3ReadPolicy --policy-document file://da-c01aw02-S3ReadPolicy.json
```
 5. Create an instance profile:
```bash
$ aws iam create-instance-profile --instance-profile-name instance-profile-EC2toS3
{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "instance-profile-EC2toS3",
        "InstanceProfileId": "AIPAWEDEMYE4ELMLVHG2L",
        "Arn": "arn:aws:iam::421117346104:instance-profile/instance-profile-EC2toS3",
        "CreateDate": "2020-07-05T04:44:02+00:00",
        "Roles": []
    }
}
```
 6. Associate the role to the instance profile:
```bash
$ aws iam add-role-to-instance-profile --instance-profile-name instance-profile-EC2toS3 --role-name da-EC2toS3Role
```
 7. Attach the instance profile to an existing EC2 instance
```bash
$ aws ec2 associate-iam-instance-profile --instance-id i-0db1e5c0c795260c3 --iam-instance-profile Name=instance-profile-EC2toS3
{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-0bda9eb3e28b770d1",
        "InstanceId": "i-0db1e5c0c795260c3",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::421117346104:instance-profile/instance-profile-EC2toS3",
            "Id": "AIPAWEDEMYE4ELMLVHG2L"
        },
        "State": "associating"
    }
}
```

- Commands to copy the S3 file to a folder inside the instance (executed from inside the EC2 Instance):
1. SSH into EC2 instance:
```bash
$ ssh -i "JupmBoxKeyForFirstEC2Instance.pem" ec2-user@ec2-3-106-132-195.ap-southeast-2.compute.amazonaws.com
```
2. copy the S3 file to a folder:
```
$ aws s3 ls
$ aws s3 cp s3://da-co1aws02bucket/sample.txt sample.txt
download: s3://da-co1aws02bucket/sample.txt to ./sample.txt
```

- Add a brief description of the challenges you faced:
```text
It is challenging for me to have a deep understanding of instance profile.
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)