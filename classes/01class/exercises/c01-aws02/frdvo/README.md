# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
**Create the bucket with Make Bucket command in Au region**
aws s3 mb s3://frdvo --region ap-southeast-2
**Output**
make_bucket: frdvo
**Check the file on bucket with LiSt**
aws s3 ls frdvo
**Output**
2020-06-15 11:47:02         26 file.txt

- Commands to allow the EC2 instance to access the files in S3:

**Create the role ec2-read-s3-role that will allow to put S3ReadOnlyInt policy**
vim ec2-read-s3-role.json
#paste the content below
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
**Run the follow command to create the role**
aws iam create-role --role-name ec2-read-s3-role --assume-role-policy-document file:///home/fer/ec2-read-s3-role.json
**Output**
{
    "Role": {
        "Path": "/",
        "RoleName": "ec2-read-s3-role",
        "RoleId": "AROASNGDG6JWSX5OJZXSO",
        "Arn": "arn:aws:iam::165765640813:role/ec2-read-s3-role",
        "CreateDate": "2020-06-15T09:44:29Z",
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
**Create a policy based on AmazonS3ReadOnlyAccess that allows read only access to our bucket**
vim S3ReadOnlyInt.json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowReadDevopsS3Buckets",
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": [
                "arn:aws:s3:::frdvo",
                "arn:aws:s3:::frdvo/*"
            ]
        }
    ]
}

**Put role in the policy**
aws iam put-role-policy --role-name ec2-read-s3-role --policy-name S3ReadOnlyInt --policy-document file:///home/fer/S3ReadOnlyInt.json

**Create a instance profile**
aws iam create-instance-profile --instance-profile-name frdvo-bucket-access-from-ec2
**Output**
{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "frdvo-bucket-access-from-ec2",
        "InstanceProfileId": "AIPASNGDG6JWX6L2EVZG3",
        "Arn": "arn:aws:iam::165765640813:instance-profile/frdvo-bucket-access-from-ec2",
        "CreateDate": "2020-06-15T10:11:29Z",
        "Roles": []
    }
}
**Add role to intance profile**
aws iam add-role-to-instance-profile --instance-profile-name frdvo-bucket-access-from-ec2 --role-name ec2-read-s3-role

**Associate profile to instance**
aws ec2 associate-iam-instance-profile --instance-id i-02f268a05455dc892 --iam-instance-profile Name=frdvo-bucket-access-from-ec2
**Output**
{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-0ec762d0482b52b82",
        "InstanceId": "i-02f268a05455dc892",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::165765640813:instance-profile/frdvo-bucket-access-from-ec2",
            "Id": "AIPASNGDG6JWX6L2EVZG3"
        },
        "State": "associating"
    }
}

**Check the profile association**
aws ec2 describe-iam-instance-profile-associations
{
    "IamInstanceProfileAssociations": [
        {
            "AssociationId": "iip-assoc-0ec762d0482b52b82",
            "InstanceId": "i-02f268a05455dc892",
            "IamInstanceProfile": {
                "Arn": "arn:aws:iam::165765640813:instance-profile/frdvo-bucket-access-from-ec2",
                "Id": "AIPASNGDG6JWX6L2EVZG3"
            },
            "State": "associated"
        }
    ]
}



- Commands to copy the S3 file to a folder inside the instace (executed from inside the EC2 Instance):

Last login: Mon Jun 15 11:00:38 2020 from 203.194.9.96

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 8 available
Run "sudo yum update" to apply all updates.
**Check if the restritive role is working**
[ec2-user@ip-172-31-36-240 ~]$ aws s3 ls
**Output**
An error occurred (AccessDenied) when calling the ListBuckets operation: Access Denied
**Yes, it is working. now check if I can list the bucket**
[ec2-user@ip-172-31-36-240 ~]$ aws s3 ls frdvo
2020-06-15 02:17:02         26 file.txt
**Copy the file**
[ec2-user@ip-172-31-36-240 ~]$ aws s3 cp s3://frdvo/file.txt file.txt
**Output**
download: s3://frdvo/file.txt to ./file.txt
**Check filesize**
[ec2-user@ip-172-31-36-240 ~]$ ls -l
total 4
-rw-rw-r-- 1 ec2-user ec2-user 26 Jun 15 02:17 file.txt


- Add a brief descrition of the challenges you faced:

Learn about IAM, Roles, Policies, Profiles, Association, ARN, how to find ARNs, how to create JSON files for roles and policies.

First Learn basics about IAM and roles:
role - it is like a "user" that assume an AWS resouce (EC2 here)
policie - it is like a permission to access a service with the AWS (Read access to a S3 bucket here)
Remember: A role contains policies. 
A instance need to be associate with a profile with the role assignement.
Once the instance is associated, the aws cli is allowed to run access services as described on the policies. 
Instructions to create JSON files for roles and polices.
https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html
You can use The Visual Editor and the managed policies on AWS portal as reference to write your policies.



***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)