# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
1. TO CREATE BUCKET: 
   aws s3 mb s3://mail2kvanitha --region ap-southeast-2
        192-168-1-106:AWS_Console vanithak$ aws s3 mb s3://mail2kvanitha --region ap-southeast-2
        make_bucket: mail2kvanitha

2. LIST BUSCKET
   aws s3 ls
        192-168-1-106:AWS_Console vanithak$ aws s3 ls
        2020-06-20 11:32:52 mail2kvanitha

3. COPY FILE TO BUCKET:
   touch test.txt and echo "Welcome to S3 Object" to test.txt
        192-168-1-106:AWS_Console vanithak$ touch test.txt
        192-168-1-106:AWS_Console vanithak$ echo "Welcome to AWS S3" > test.txt 
        192-168-1-106:AWS_Console vanithak$ more test.txt 
        Welcome to AWS S3

   aws s3 cp test.txt s3://mail2kvanitha/
        192-168-1-106:AWS_Console vanithak$ aws s3 cp test.txt s3://mail2kvanitha/
        upload: ./test.txt to s3://mail2kvanitha/test.txt                

   aws s3 ls s3://mail2kvanitha
        192-168-1-106:AWS_Console vanithak$ aws s3 ls s3://mail2kvanitha/
        2020-06-20 11:49:56         18 test.txt
        
```
Add your commands and their outputs here
```
Please see above for comamnds and their outputs.

- Commands to allow the EC2 instance to access the files in S3:
1. CREATE JSON file policy document that grants read access to EC2 instance to access S3
        192-168-1-106:AWS_Console vanithak$ more ec2tos3-read-role.json 
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


2. CREATE ROLE using the above policy document.
aws iam create-role --role-name ec2tos3-read-role --assume-role-policy-document file:////Users/vanithak/AWS/AWS_Console/ec2tos3-read-role.json

{
    "Role": {
        "Path": "/",
        "RoleName": "ec2tos3-read-role",
        "RoleId": "AROA37J5DM6XDANO4GIUZ",
        "Arn": "arn:aws:iam::823151257518:role/ec2tos3-read-role",
        "CreateDate": "2020-06-20T02:24:02+00:00",
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

3. Create policy document file S3ReadOnlyAccess.json that grants read only access to S3 buckets.
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
                "arn:aws:s3:::mail2kvanitha",
                "arn:aws:s3:::mail2kvanitha/*"
            ]
        }
    ]
}

4. Attach the policy to the role. 
        aws iam put-role-policy --role-name ec2tos3-read-role --policy-name S3ReadOnlyAccess —policy-document file:////Users/vanithak/AWS/AWS_Console/S3ReadOnlyAccess.json

5. Create Instance profile for EC2 instance
192-168-1-106:AWS_Console vanithak$ aws iam create-instance-profile --instance-profile-name ec2tos3-instance-profile
{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "ec2tos3-instance-profile",
        "InstanceProfileId": "AIPA37J5DM6XOYC6WYPPW",
        "Arn": "arn:aws:iam::823151257518:instance-profile/ec2tos3-instance-profile",
        "CreateDate": "2020-06-20T02:50:42+00:00",
        "Roles": []
    }
}

6. Add role to Instance profile
aws iam add-role-to-instance-profile --instance-profile-name fec2tos3-instance-profile --role-name ec2tos3-read-role

7. Associate the instance profile to instance
aws ec2 associate-iam-instance-profile --instance-id i-09a20ec4f84f23213 --iam-instance-profile Name=ec2tos3-instance-profile
{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-09f869ae2daf767ff",
        "InstanceId": "i-09a20ec4f84f23213",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::823151257518:instance-profile/ec2tos3-instance-profile",
            "Id": "AIPA37J5DM6XOYC6WYPPW"
        },
        "State": "associating"
    }
}


8. List the Instance profile association.
192-168-1-106:AWS_Console vanithak$ aws ec2 describe-iam-instance-profile-associations
{
    "IamInstanceProfileAssociations": [
        {
            "AssociationId": "iip-assoc-09f869ae2daf767ff",
            "InstanceId": "i-09a20ec4f84f23213",
            "IamInstanceProfile": {
                "Arn": "arn:aws:iam::823151257518:instance-profile/ec2tos3-instance-profile",
                "Id": "AIPA37J5DM6XOYC6WYPPW"
            },
            "State": "associated"
        }
    ]
}




```
Add your commands and their outputs here
```

- Commands to copy the S3 file to a folder inside the instace (executed from inside the EC2 Instance):
```
Add your commands and their outputs here
```
192-168-1-106:S3ReadOnly vanithak$ aws s3 ls s3://mail2kvanitha
2020-06-20 11:49:56         18 test.txt
192-168-1-106:S3ReadOnly vanithak$ aws s3 cp s3://mail2kvanitha/test.txt .
download: s3://mail2kvanitha/test.txt to ./test.txt              
192-168-1-106:S3ReadOnly vanithak$ ls -l test.txt
-rw-r--r--  1 vanithak  staff  18 20 Jun 11:49 test.txt
192-168-1-106:S3ReadOnly vanithak$ 



- Add a brief description of the challenges you faced:
```
Add comments here
```
Granting access through AWS console is easier than doing it through command line. The steps to follow to get access from ec2 instance to S3 is so long and requires more understanding.
<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)
