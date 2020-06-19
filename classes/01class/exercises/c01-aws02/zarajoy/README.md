# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:

https://awscli.amazonaws.com/v2/documentation/api/latest/reference/s3api/create-bucket.html
```
z@bacon:~$ aws s3api create-bucket --bucket zarajoy-aws02-bucket --region ap-southeast-2 --create-bucket-configuration LocationConstraint=ap-southeast-2
{
    "Location": "http://zarajoy-aws02-bucket.s3.amazonaws.com/"
}
z@bacon:~$ aws s3 cp ./Documents/upload.txt s3://zarajoy-aws02-bucket

upload: Documents/upload.txt to s3://zarajoy-aws02-bucket/upload.txt

z@bacon:~$ aws s3 ls zarajoy-aws02-bucket

2020-06-19 12:53:14         16 upload.txt
```

- Commands to allow the EC2 instance to access the files in S3:

https://aws.amazon.com/premiumsupport/knowledge-center/ec2-instance-access-s3-bucket/
https://aws.amazon.com/premiumsupport/knowledge-center/iam-assume-role-cli/
https://docs.aws.amazon.com/cli/latest/reference/iam/create-role.html

https://www.concurrencylabs.com/blog/publish-jmeter-test-results-to-cloudwatch-logs-manual-steps/
https://aws.amazon.com/blogs/security/organize-your-permissions-by-using-separate-managed-policies/

```
//create the role-policy-document.json file
z@bacon:~$ vim assume_role_policy.json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
// to save and exit esc :w +enter :x+enter

//create IAM role and link policy document created above
z@bacon:~$ aws iam create-role --role-name access-zarajoy-aws02-bucket --assume-role-policy-document file://assume_role_policy.json
{
    "Role": {
        "Path": "/",
        "RoleName": "access-zarajoy-aws02-bucket",
        "RoleId": "AROAXOYORRTGGTDS34HA4",
        "Arn": "arn:aws:iam::512742231244:role/access-zarajoy-aws02-bucket",
        "CreateDate": "2020-06-19T04:26:36Z",
        "AssumeRolePolicyDocument": {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Sid": "",
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

z@bacon:~$ aws iam attach-role-policy --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess --role-name access-zarajoy-aws02-bucket

z@bacon:~$ aws iam create-instance-profile --instance-profile-name access-zarajoy-aws02-bucket-profile 

{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "access-zarajoy-aws02-bucket-profile",
        "InstanceProfileId": "AIPAXOYORRTGKW77SFKKZ",
        "Arn": "arn:aws:iam::512742231244:instance-profile/access-zarajoy-aws02-bucket-profile",
        "CreateDate": "2020-06-19T05:07:15Z",
        "Roles": []
    }
}

z@bacon:~$ aws iam add-role-to-instance-profile --instance-profile-name access-zarajoy-aws02-bucket-profile --role-name access-zarajoy-aws02-bucket

//get instance ID
z@bacon:~$ aws ec2 describe-instances --query "Reservations[].Instances[].[InstanceId, PublicIpAddress]"

[
    [
        "i-00cb16d60056e7353",
        "13.239.28.37"
    ],
    [
        "i-01610e356354f203d",
        null
    ]
]

z@bacon:~$ aws ec2 associate-iam-instance-profile --instance-id i-00cb16d60056e7353 --iam-instance-profile Name=access-zarajoy-aws02-bucket-profile

{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-022df6c548ed6a91c",
        "InstanceId": "i-00cb16d60056e7353",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::512742231244:instance-profile/access-zarajoy-aws02-bucket-profile",
            "Id": "AIPAXOYORRTGKW77SFKKZ"
        },
        "State": "associating"
    }
}

```

- Commands to copy the S3 file to a folder inside the instace (executed from inside the EC2 Instance):
```

z@bacon:~$ aws ec2 describe-instances --query "Reservations[].Instances[].[InstanceId, PublicIpAddress]"

[
    [
        "i-00cb16d60056e7353",
        "13.239.28.37"
    ],
    [
        "i-01610e356354f203d",
        null
    ]
]


z@bacon:~$ ssh ec2-user@13.239.28.37

Last login: Thu Jun 18 06:31:00 2020 from 180-150-38-8.b49626.bne.nbn.aussiebb.net

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/

[ec2-user@ip-172-31-36-157 ~]$ aws s3 cp s3://zarajoy-aws02-bucket/upload.txt .

download: s3://zarajoy-aws02-bucket/upload.txt to ./upload.txt   
```

- Add a brief description of the challenges you faced:
```
alot of the documentation is for console rather than CLI. Involved following a guide for console but having to find each command as CLI.
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)