# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```bash
# Create the bucket
❯ aws s3 mb s3://da-c01-aws02 --region ap-southeast-2
make_bucket: da-c01-aws02

# The following command lists all buckets
❯ aws s3 ls                  
2020-06-16 22:40:17 da-c01-aws02

# Create the file.txt
❯ touch file.txt

# Upload the file.txt to s3 bucket
❯ aws s3 cp file.txt s3://da-c01-aws02/
upload: ./file.txt to s3://da-c01-aws02/file.txt

# The following command lists all objects and folders
❯ aws s3 ls s3://da-c01-aws02
2020-06-16 22:41:54          0 file.txt

```

- Commands to allow the EC2 instance to access the files in S3:
```bash

# 1 - Create the following trust policy and save it in a text file named ec2-role-trust-policy.json.

❯ cat <<EOF > ec2-role-trust-policy.json
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
EOF

❯ ls
ec2-role-trust-policy.json

# 2 - Create the s3access role and specify the trust policy that you created using the create-role command.

❯ aws iam create-role --role-name s3access --assume-role-policy-document file://ec2-role-trust-policy.json
{
    "Role": {
        "Path": "/",
        "RoleName": "s3access",
        "RoleId": "AROA6HNPHMJJEKKWM6AHY",
        "Arn": "arn:aws:iam::978009416274:role/s3access",
        "CreateDate": "2020-06-18T12:21:47Z",
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

# 3 - Create an access policy and save it in a text file named ec2-role-access-policy.json. 

❯ cat <<EOF > ec2-role-access-policy.json
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
              "arn:aws:s3:::da-c01-aws02/*",
              "arn:aws:s3:::da-c01-aws02"
            ]
        }
    ]
}
EOF

❯ ls
ec2-role-access-policy.json ec2-role-trust-policy.json  file.txt

# 4 - Attach the access policy to the role using the put-role-policy command.

❯ aws iam put-role-policy --role-name s3access --policy-name S3-Permissions --policy-document file://ec2-role-access-policy.json

# 5 - Create an instance profile named s3access-profile using the create-instance-profile command.
❯ aws iam create-instance-profile --instance-profile-name s3access-profile
{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "s3access-profile",
        "InstanceProfileId": "AIPA6HNPHMJJLLX56P5DU",
        "Arn": "arn:aws:iam::978009416274:instance-profile/s3access-profile",
        "CreateDate": "2020-06-18T12:33:26Z",
        "Roles": []
    }
}

# 6 - Add the s3access role to the s3access-profile instance profile.
❯ aws iam add-role-to-instance-profile --instance-profile-name s3access-profile --role-name=s3access-profile

# To attach an IAM role to an instance (AWS CLI)

# 1 - Describe your instances to get the ID of the instance to which to attach the role.

❯ aws ec2 describe-instances \
    --query "Reservations[*].Instances[*].[InstanceId,SecurityGroups[*].{SecurityGroups:GroupName}]"
[
    [
        [
            "i-04d1e6d37f6a14b43",
            [
                {
                    "SecurityGroups": "my-sg-private"
                }
            ]
        ]
    ],
    [
        [
            "i-0e9b53b7b399b309b",
            [
                {
                    "SecurityGroups": "my-sg-public"
                }
            ]
        ]
    ]
]

# 2 - Use the associate-iam-instance-profile command to attach the IAM role to the instance by specifying the instance profile. You can use the Amazon Resource Name (ARN) of the instance profile, or you can use its name.

❯ aws ec2 associate-iam-instance-profile --instance-id i-0e9b53b7b399b309b --iam-instance-profile Name=s3access-profile          
{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-075baa3c0b42a0cd6",
        "InstanceId": "i-0e9b53b7b399b309b",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::978009416274:instance-profile/s3access-profile",
            "Id": "AIPA6HNPHMJJLLX56P5DU"
        },
        "State": "associating"
    }
}


```

- Commands to copy the S3 file to a folder inside the instance (executed from inside the EC2 Instance):
```
❯ ssh -A ec2-user@3.25.124.184
Last login: Thu Jun 18 13:14:34 2020 from 203.220.191.128

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 10 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-42-92 ~]$ aws s3 ls
2020-06-17 13:38:56 da-c01-aws02
[ec2-user@ip-172-31-42-92 ~]$ ls
[ec2-user@ip-172-31-42-92 ~]$ aws s3 cp s3://da-c01-aws02/file.txt folder/local-copy.txt
download: s3://da-c01-aws02/file.txt to folder/local-copy.txt
[ec2-user@ip-172-31-42-92 ~]$ ls
folder  local-copy.txt
[ec2-user@ip-172-31-42-92 ~]$ ls folder
local-copy.txt

```

- Add a brief description of the challenges you faced:

```
I had to do some research to understand the relationship between instance profile, policy and roles. I found this doc `IAM roles for Amazon EC2` that helped me with the understanding of this relationship and also how to create them via CLI.
```
[IAM roles for Amazon EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html) 

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)