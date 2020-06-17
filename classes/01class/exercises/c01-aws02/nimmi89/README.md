# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
>>>Command to create a s3 bucket[Should have a globally unique bucket name]
aws s3 mb s3://c01-aws02-bucket
>The command returns:
make_bucket: c01-aws02-bucket

>>>Command to check if the bucket was successfully created.
aws s3 ls
>The command returns:
2020-06-17 18:16:40 c01-aws02-bucket

>>>Command to upload files(objects) in the bucket
aws s3 cp /home/nimmi/index.html s3://c01-aws02-bucket
>The command returns:
upload: ../../../../../../../index.html to s3://c01-aws02-bucket/index.html

```

- Commands to allow the EC2 instance to access the files in S3:
```
>>>SSH into ec2 instance and giving command to access s3 asks you to configure credentials. There is a high probability that credentials can be compromised. The safer approach is to create roles.
[ec2-user@ip-172-31-32-188 ~]$ aws s3 ls
Unable to locate credentials. You can configure credentials by running "aws configure".
[ec2-user@ip-172-31-32-188 ~]$ logout
Connection to 52.64.28.243 closed.


>>> Create a json file for trust policy which permits AWS services such as EC2 to assume an IAM role on behalf of your application
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
>>>Command to create the IAM role, YourNewRole, based on the trust policy
aws iam create-role --role-name S3AccessRole --assume-role-policy-document file:///home/nimmi/Ec2RoleTrustPolicy.json

>The command returns:
{
    "Role": {
        "Path": "/",
        "RoleName": "S3AccessRole",
        "RoleId": "AROAWMG45LNQ3WIZK67FI",
        "Arn": "arn:aws:iam::438549961569:role/S3AccessRole",
        "CreateDate": "2020-06-17T08:34:53+00:00",
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

>>>Command to grant this IAM role permission to access S3 resources in your account using the AmazonS3ReadOnlyAccess AWS managed policy.
aws iam attach-role-policy --role-name S3AccessRole --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess

>>>Command to create instance profile and add it to the role.The instance profile allows EC2 to pass the IAM role, YourNewRole, to an EC2 instance. 
aws iam create-instance-profile --instance-profile-name S3AccessRole-Instance-Profile
>The command returns:
{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "S3AccessRole-Instance-Profile",
        "InstanceProfileId": "AIPAWMG45LNQ2WM5DWF5E",
        "Arn": "arn:aws:iam::438549961569:instance-profile/S3AccessRole-Instance-Profile",
        "CreateDate": "2020-06-17T08:38:29+00:00",
        "Roles": []
    }
}
aws iam add-role-to-instance-profile --role-name S3AccessRole --instance-profile-name S3AccessRole-Instance-Profile

>>>Command to attach the instance profile, YourNewRole-Instance-Profile, for the newly created IAM role, YourNewRole, to your EC2 instance, YourInstanceId.
aws ec2 associate-iam-instance-profile --instance-id i-05d7620963b672ca0 --iam-instance-profile Name=S3AccessRole-Instance-Profile
>The command returns:
{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-09051d5837a6bb5ba",
        "InstanceId": "i-05d7620963b672ca0",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::438549961569:instance-profile/S3AccessRole-Instance-Profile",
            "Id": "AIPAWMG45LNQ2WM5DWF5E"
        },
        "State": "associating"
    }
}

>>>Command to verify that the IAM role is now attached to the instance
aws ec2 describe-iam-instance-profile-associations
>The command returns:
{
    "IamInstanceProfileAssociations": [
        {
            "AssociationId": "iip-assoc-0ad4a200b37494d0b",
            "InstanceId": "i-03db9e088f065c42b",
            "IamInstanceProfile": {
                "Arn": "arn:aws:iam::438549961569:instance-profile/cloudwatchrole",
                "Id": "AIPAWMG45LNQWFJASE25M"
            },
            "State": "associated"
        },
        {
            "AssociationId": "iip-assoc-09051d5837a6bb5ba",
            "InstanceId": "i-05d7620963b672ca0",
            "IamInstanceProfile": {
                "Arn": "arn:aws:iam::438549961569:instance-profile/S3AccessRole-Instance-Profile",
                "Id": "AIPAWMG45LNQ2WM5DWF5E"
            },
            "State": "associated"
        }
    ]
}
>>>SSH into the instance and access your bucket
ssh -i /home/nimmi/C01-AWS01KeyPair.pem ec2-user@52.64.28.243
Last login: Wed Jun 17 08:29:16 2020 from 14-201-149-89.static.tpgi.com.au

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 8 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-32-188 ~]$ aws s3 ls
2020-06-17 08:16:40 c01-aws02-bucket

S3 Access Successful in the EC2 using IAM Roles!!!!!!!!!!!

```
- Commands to copy the S3 file to a folder inside the instance (executed from inside the EC2 Instance):
```
>>>Command to copy s3 file to a folder inside the instance
aws s3 cp s3://c01-aws02-bucket/index.html myEc2Folder
>The command returns:
download: s3://c01-aws02-bucket/index.html to myEc2Folder/index.html

S3 File Successfully copied into Ec2 folder!!!!!!!!!
[ec2-user@ip-172-31-32-188 ~]$ cd myEc2Folder/
[ec2-user@ip-172-31-32-188 myEc2Folder]$ ls
index.html
```

- Add a brief descrition of the challenges you faced:
```
>>>Figuring out the most secure way to access your AWS resources via EC2 instances.
>>>Attaching an instance -profile to your roles 
```

***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)
