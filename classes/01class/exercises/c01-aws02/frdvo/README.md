# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:

Create the bucket with mb command in Au region

`aws s3 mb s3://frdvo --region ap-southeast-2`

````bash
make_bucket: frdvo
````

Check the file on bucket with ls

`aws s3 ls frdvo`

````bash
2020-06-15 11:47:02         26 file.txt
````

- Commands to allow the EC2 instance to access the files in S3:

Create a JSON file with the role **ec2-read-s3-role** that apply to EC2 instances and will have a policy to allow S3 read only access

`nano ec2-read-s3-role.json`

Paste the content below:
````bash
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
````

Run the follow command to create the role

`aws iam create-role --role-name ec2-read-s3-role --assume-role-policy-document file:///home/fer/ec2-read-s3-role.json`

````bash
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
````

Create a JSON file with a policy based on AmazonS3ReadOnlyAccess that allows read only access to our bucket> it will allow get (to dowload the files), list files, from the frdvo bucket and the objects inside frvdo/*

`nano S3ReadOnlyInt.json`

````bash
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
````

Run the command to put the role in the policy

`aws iam put-role-policy --role-name ec2-read-s3-role --policy-name S3ReadOnlyInt --policy-document file:///home/fer/S3ReadOnlyInt.json`

Create a instance profile

`aws iam create-instance-profile --instance-profile-name frdvo-bucket-access-from-ec2`

````bash
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
````

Add role to intance profile

`aws iam add-role-to-instance-profile --instance-profile-name frdvo-bucket-access-from-ec2 --role-name ec2-read-s3-role`

Associate the profile to instance.

*Because we can perform S3 copy from any instance from the previous exercise I recommend to use the Jump Box instance, it is ready to go. To use the internal instance you need to configure the network to allow access to the internal S3 endpoint.*

`aws ec2 associate-iam-instance-profile --instance-id i-02f268a05455dc892 --iam-instance-profile Name=frdvo-bucket-access-from-ec2`

````bash
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
````

Run the following command to check the profile association

`aws ec2 describe-iam-instance-profile-associations`

````bash
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
````

- Commands to copy the S3 file to a folder inside the instace (executed from inside the EC2 Instance):

`ssh -i dajb.pem ec2-user@3.25.62.164`

````bash
Last login: Mon Jun 15 11:00:38 2020 from 203.194.9.96

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 8 available
Run "sudo yum update" to apply all updates.
````

I will list all S3 buckets to check if the restritive role is working

`aws s3 ls`

````bash
An error occurred (AccessDenied) when calling the ListBuckets operation: Access Denied
````

Yes, it is restrict.  Mow check if I can list the frdvo bucket

`aws s3 ls frdvo`

````bash
2020-06-15 02:17:02         26 file.txt
````

Copy the file

`aws s3 cp s3://frdvo/file.txt file.txt`

````bash
download: s3://frdvo/file.txt to ./file.txt
````

Check the downloaded file size

`ls -l`

````bash
total 4
-rw-rw-r-- 1 ec2-user ec2-user 26 Jun 15 02:17 file.txt
````

- Add a brief descrition of the challenges you faced:

I had to learn about IAM, Roles, Policies, Profiles, Association, ARN, how to find ARNs, how to create JSON files for roles and policies.

IAM basics and roles and policies:

**role** - it is like a "user" that assume an AWS resouce (EC2 here)

**policy** - it is like a permission to access a service with the AWS (Read access to a S3 bucket here)

Remember: A role contains policies. 

A instance need to be associate with a profile with the role assignement.

**profile** - applies the role with the policies to a EC2 instance

Once the instance is associated, the aws cli is allowed to run access services as described on the policies. 

Instructions to create JSON files for roles and polices.
https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html

You can use The Visual Editor and the managed policies on AWS portal as reference to write your policies.



***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)