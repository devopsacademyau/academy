# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
aws s3 mb s3://devopsacademy-rodrigo --region ap-southeast-2
make_bucket: devopsacademy-rodrigo

touch file_for_s3.txt
rodrigo@rodrigo-Aspire-V5-471:~/DevOps/academy/classes/01class/exercises/c01-aws02/rodrigovcesar$ echo 'Content of the file for test' > file_for_s3.txt

aws s3 cp ./file_for_s3.txt s3://devopsacademy-rodrigo/
upload: ./file_for_s3.txt to s3://devopsacademy-rodrigo/file_for_s3.txt

```

- Commands to allow the EC2 instance to access the files in S3:
```
cat role-ec2.json 
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Principal": {"Service": "ec2.amazonaws.com"},
    "Action": "sts:AssumeRole"
  }
}


aws iam create-role --role-name EC2S3Role --assume-role-policy-document=file://role-ec2.json
{
    "Role": {
        "Path": "/",
        "RoleName": "EC2S3Role",
        "RoleId": "AROARP4GZM4KY3HSV6OWC",
        "Arn": "arn:aws:iam::102825027349:role/EC2S3Role",
        "CreateDate": "2020-06-20T11:08:04+00:00",
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

cat restrictedS3Policy.json 
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "s3:ListBucket",
    "Resource": "arn:aws:s3:::devopsacademy-rodrigo"
  }
}


aws iam put-role-policy --role-name EC2S3Role --policy-name Ec2Policy --policy-document file://restrictedS3Policy.json


aws iam create-instance-profile --instance-profile-name read-bucket-ec2
{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "read-bucket-ec2",
        "InstanceProfileId": "AIPARP4GZM4KYXBAOE6X3",
        "Arn": "arn:aws:iam::102825027349:instance-profile/read-bucket-ec2",
        "CreateDate": "2020-06-20T12:09:35+00:00",
        "Roles": []
    }
}

aws iam add-role-to-instance-profile --instance-profile-name read-bucket-ec2 --role-name EC2S3Role

aws ec2 describe-instances --query "Reservations[].Instances[].[InstanceId, PublicIpAddress]"
[
    [
        "i-02f593918dfdbae4c",
        "13.236.162.87"
    ],
    [
        "i-0c0dcd57c54d427e9",
        null
    ]
]

# In my case I want to link this instance profile with the private EC2, which does not have the public IP.


aws ec2 associate-iam-instance-profile --instance-id i-0c0dcd57c54d427e9 --iam-instance-profile Name="read-bucket-ec2"
{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-0176d3bec4acb79c4",
        "InstanceId": "i-0c0dcd57c54d427e9",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::102825027349:instance-profile/read-bucket-ec2",
            "Id": "AIPARP4GZM4KYXBAOE6X3"
        },
        "State": "associating"
    }
}



```

- Commands to copy the S3 file to a folder inside the instace (executed from inside the EC2 Instance):
```
Add your commands and their outputs here
```

- Add a brief description of the challenges you faced:
```
Add comments here
```


***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)