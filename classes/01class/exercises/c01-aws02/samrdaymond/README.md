# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
Add your commands and their outputs here
```

aws s3 mb s3://samdaymond-contino-dojo-bucket

aws s3 cp ./file.txt s3://samdaymond-contino-dojo-bucket



- Commands to allow the EC2 instance to access the files in S3:
```
Add your commands and their outputs here

 create policy JSON to allow ec2 access to s3(see ec2-role-policy.json)

 create role and apply policy

 sam.daymond@contino.io@Sams-MacBook-Pro academy % aws iam create-role --role-name sd-read-s3 --assume-role-policy-document file://classes/01class/exercises/c01-aws02/samrdaymond/ec2-role-policy.json

{
    "Role": {
        "Path": "/",
        "RoleName": "sd-read-s3",
        "RoleId": "AROASHFUBKMH3PB3B6AUV",
        "Arn": "arn:aws:iam::152848913167:role/sd-read-s3",
        "CreateDate": "2022-08-24T09:32:15+00:00",
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

create read access policy and assign to role

aws iam put-role-policy --role-name sd-read-s3 --policy-name ec2-read-policy --policy-document file://classes/01class/exercises/c01-aws02/samrdaymond/ec2-read-policy.json

create instance profile 

aws iam create-instance-profile --instance-profile-name sd-s3-readprofile 


    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "sd-s3-readprofile",
        "InstanceProfileId": "AIPASHFUBKMHXFMW2TT7N",
        "Arn": "arn:aws:iam::152848913167:instance-profile/sd-s3-readprofile",
        "CreateDate": "2022-08-24T10:00:21+00:00",
        "Roles": []
    }
}

add the s3 read role to the instance profile

aws iam add-role-to-instance-profile --instance-profile-name sd-s3-readprofile --role-name sd-read-s3

add the ec2 instance to the instance profile

aws ec2 associate-iam-instance-profile --instance-id i-05bb85fce1c97ac38 --iam-instance-profile Name=sd-s3-readprofile
{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-09c2be06f2bde57c7",
        "InstanceId": "i-05bb85fce1c97ac38",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::152848913167:instance-profile/sd-s3-readprofile",
            "Id": "AIPASHFUBKMHXFMW2TT7N"
        },
        "State": "associating"
    }
}

```

- Commands to copy the S3 file to a folder inside the instance (executed from inside the EC2 Instance):
```
Add your commands and their outputs here
```

[ec2-user@ip-172-31-42-129 ~]$ aws s3 ls samdaymond-contino-dojo-bucket
2022-08-24 07:32:37          0 file.txt
[ec2-user@ip-172-31-42-129 ~]$ aws s3 cp s3://samdaymond-contino-dojo-bucket/file.txt ./filecopy.txt
download: s3://samdaymond-contino-dojo-bucket/file.txt to ./filecopy.txt
[ec2-user@ip-172-31-42-129 ~]$ 


- Add a brief description of the challenges you faced:
```
the most complex part of this for me was just making the JSON files point to where I wanted and applying them to the role the concepts here are relatively similar to User Assigned Identities in Azure, just a different way to apply them
```

<!-- Don't change anything below this point-->
<!-- Before committing, remove both commented lines--> 
***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)