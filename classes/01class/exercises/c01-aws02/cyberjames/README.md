# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
$ aws s3 mb s3://c01-aws02-james-contino
make_bucket: c01-aws02-james-contino

$ aws s3 cp README.md s3://c01-aws02-james-contino/
upload: ./README.md to s3://c01-aws02-james-contino/README.md
```

- Commands to allow the EC2 instance to access the files in S3:
```
# Create the file named c01-aws02-trust-policy.json containing the policy.
$ cat << EOF > c01-aws02-trust-policy.json
heredoc> {
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Principal": {"Service": "ec2.amazonaws.com"},
    "Action": "sts:AssumeRole"
  }
}
heredoc> EOF

# Create s3 permission policy
$ cat << EOF > c01-aws02-s3-policy.json
heredoc> {
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": [
      "s3:ListBucket",
      "s3:GetObject",
      "s3:PutObject"
    ],
    "Resource": [
      "arn:aws:s3:::c01-aws02-james-contino",
      "arn:aws:s3:::c01-aws02-james-contino/*"
    ]
  }
}
heredoc> EOF

# Create the IAM role
$ aws iam create-role --role-name c01-aws02-s3-role --assume-role-policy-document file://./c01-aws02-trust-policy.json

{
    "Role": {
        "Path": "/",
        "RoleName": "c01-aws02-s3-role",
        "RoleId": "AROASHFUBKMH4HALGLWL6",
        "Arn": "arn:aws:iam::152848913167:role/c01-aws02-s3-role",
        "CreateDate": "2022-08-23T10:41:35+00:00",
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

# Attach s3 permission policy to the IAM Role as inline policy.
$ aws iam put-role-policy --role-name c01-aws02-s3-role --policy-name perms-ec2-to-s3 --policy-document file://./c01-aws02-s3-policy.json

# Create an instance profile
$ aws iam create-instance-profile --instance-profile-name  c01-aws02-s3

{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "c01-aws02-s3",
        "InstanceProfileId": "AIPASHFUBKMHT3T26J525",
        "Arn": "arn:aws:iam::152848913167:instance-profile/c01-aws02-s3",
        "CreateDate": "2022-08-23T10:47:35+00:00",
        "Roles": []
    }
}

# Add/Attach IAM role to the instance profile
$ aws iam add-role-to-instance-profile \
> --role-name c01-aws02-s3-role \
> --instance-profile-name c01-aws02-s3

# Attach the instance profile to the Jump box EC2 instance
$ aws ec2 associate-iam-instance-profile \
--instance-id i-0cbc17fa9f387fed3 \
--iam-instance-profile Name=c01-aws02-s3

{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-0bd9b273465042586",
        "InstanceId": "i-0cbc17fa9f387fed3",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::152848913167:instance-profile/c01-aws02-s3",
            "Id": "AIPASHFUBKMHT3T26J525"
        },
        "State": "associating"
    }
}

# SSH to Jumpbox EC2 Instance
$ ssh ec2-user@3.26.185.236
Warning: Permanently added '3.26.185.236' (ED25519) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
3 package(s) needed for security, out of 7 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-38-3 ~]$ aws s3 ls --human-readable s3://c01-aws02-james-contino/
2022-08-23 10:12:40    0 Bytes README.md
```

- Commands to copy the S3 file to a folder inside the instance (executed from inside the EC2 Instance):
```
[ec2-user@ip-172-31-38-3 ~]$ aws s3 cp 1k.txt s3://c01-aws02-james-contino/
upload: ./1k.txt to s3://c01-aws02-james-contino/1k.txt
```

- Add a brief description of the challenges you faced:
```
Without specifying the S3 bucket permissions policy to attach on IAM role `c01-aws02-s3-role`, you will face a permission issues to access or copying files from EC2 instance to the AWS S3 bucket.
```

<!-- Don't change anything below this point-->
<!-- Before committing, remove both commented lines--> 
***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)