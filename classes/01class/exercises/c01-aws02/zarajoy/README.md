# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:

https://awscli.amazonaws.com/v2/documentation/api/latest/reference/s3api/create-bucket.html
```
z@baacon:~$ aws s3api create-bucket --bucket zjdoa-bucket --region ap-southeast-2 --create-bucket-configuration LocationConstraint=ap-southeast-2

{
    "Location": "http://zjdoa-bucket.s3.amazonaws.com/"
}

z@bacon:~$ aws s3 cp ./Documents/upload.txt s3://zjdoa-bucket

upload: Documents/upload.txt to s3://zjdoa-bucket/upload.txt    
z@bacon:~$ aws s3 ls zjdoa-bucket

2020-06-21 11:31:01         16 upload.txt

```

- Commands to allow the EC2 instance to access the files in S3:

https://aws.amazon.com/premiumsupport/knowledge-center/ec2-instance-access-s3-bucket/

https://aws.amazon.com/premiumsupport/knowledge-center/iam-assume-role-cli/

https://docs.aws.amazon.com/cli/latest/reference/iam/create-role.html

https://aws.amazon.com/blogs/security/organize-your-permissions-by-using-separate-managed-policies/

```
//create the role-policy-document.json file
z@bacon:~$ vim assume-role-policy.json

//create the role
z@bacon:~$ aws iam create-role --role-name access-zjdoa-bucket --assume-role-policy-document file://assume-role-policy.json

{
    "Role": {
        "Path": "/",
        "RoleName": "access-zjdoa-bucket",
        "RoleId": "AROAXOYORRTGIACR76FXF",
        "Arn": "arn:aws:iam::512742231244:role/access-zjdoa-bucket",
        "CreateDate": "2020-06-21T01:32:39Z",
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

//waas requested to create my own policy insteaad of using aaws manaaged policy
z@bacon:~$ vim ROpolicy.json
//put below into editor aand save - allows listing of objects and fetching of objects to my bucket
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
                "arn:aws:s3:::zjdoa-bucket",
                "arn:aws:s3:::zjdoa-bucket/*"
            ]
        }
    ]
}

//attach newly created policy to my role
z@bacon:~$ aws iam put-role-policy --role-name access-zjdoa-bucket --policy-name ROpolicy --policy-document file://ROpolicy.json

z@bacon:~$ aws iam create-instance-profile --instance-profile-name ROaccess-zjdoa-bucket

{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "ROaccess-zjdoa-bucket",
        "InstanceProfileId": "AIPAXOYORRTGEWRCD3DT6",
        "Arn": "arn:aws:iam::512742231244:instance-profile/ROaccess-zjdoa-bucket",
        "CreateDate": "2020-06-21T01:38:37Z",
        "Roles": []
    }
}

z@bacon:~$ aws iam add-role-to-instance-profile --instance-profile-name ROaccess-zjdoa-bucket --role-name access-zjdoa-bucket

//get instanceID
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

z@bacon:~$ aws ec2 associate-iam-instance-profile --instance-id i-00cb16d60056e7353 --iam-instance-profile Name=ROaccess-zjdoa-bucket
{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-0d87a8c4260217f07",
        "InstanceId": "i-00cb16d60056e7353",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::512742231244:instance-profile/ROaccess-zjdoa-bucket",
            "Id": "AIPAXOYORRTGEWRCD3DT6"
        },
        "State": "associating"
    }
}

```

- Commands to copy the S3 file to a folder inside the instace (executed from inside the EC2 Instance):
```
//connect to public ec2 (c01-aaws01)
z@bacon:~$ ssh ec2-user@13.239.28.37
Last login: Fri Jun 19 05:19:35 2020 from 180-150-38-8.b49626.bne.nbn.aussiebb.net

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/

//try to copy file from the bucket while connected via ec2
[ec2-user@ip-172-31-36-157 ~]$ aws s3 cp s3://zjdoa-bucket/upload.txt .
download: s3://zjdoa-bucket/upload.txt to ./upload.txt           

```

- Add a brief description of the challenges you faced:
```
alot of the documentation is for console rather than CLI. Involved following a guide for console but having to find each command as CLI.
Was stuck for the longest time on creating the  role-policy-document.json (i excluded the many errors i got from the answer) until i found https://www.concurrencylabs.com/blog/publish-jmeter-test-results-to-cloudwatch-logs-manual-steps/. It helped me with the JSON and manged Policies.
All in all middle exercise just took a long time to get my head around all the parts.
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)