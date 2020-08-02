# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
aws s3 mb s3://igorjosesantos-devopsacademy-c01-aws02
```

```
aws s3 cp README.md s3://igorjosesantos-devopsacademy-c01-aws02
```

- Commands to allow the EC2 instance to access the files in S3:
```
aws iam create-role --role-name EC2_S3_ReadOnly_Access --assume-role-policy-document file://ec2s3ReadOnly_TrustPolicy.json

{
    "Role": {
        "Path": "/",
        "RoleName": "EC2_S3_ReadOnly_Access",
        "RoleId": "AROAWV6S3FGR5PN2ITMRP",
        "Arn": "arn:aws:iam::459466811811:role/EC2_S3_ReadOnly_Access",
        "CreateDate": "2020-07-20T14:07:48+00:00",
        "AssumeRolePolicyDocument": {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Effect": "Allow",
                    "Principal": {
                        "Service": [
                            "ec2.amazonaws.com"
                        ]
                    },
                    "Action": [
                        "sts:AssumeRole"
                    ]
                }
            ]
        }
    }
}
```

```
aws iam attach-role-policy --role-name EC2_S3_ReadOnly_Access --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess
```

```
aws iam create-instance-profile --instance-profile-name EC2_S3_ReadOnly_Access-Profile

{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "EC2_S3_ReadOnly_Access-Profile",
        "InstanceProfileId": "AIPAWV6S3FGR7PQCJ3ALR",
        "Arn": "arn:aws:iam::459466811811:instance-profile/EC2_S3_ReadOnly_Access-Profile",
        "CreateDate": "2020-07-20T14:08:18+00:00",
        "Roles": []
    }
}
```

```
aws iam add-role-to-instance-profile --role-name EC2_S3_ReadOnly_Access --instance-profile-name EC2_S3_ReadOnly_Access-Profile
```

```
aws ec2 associate-iam-instance-profile --instance-id i-0a9ecad0118adc70f --iam-instance-profile Name=EC2_S3_ReadOnly_Access-Profile

{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-00d37218055d83128",
        "InstanceId": "i-0a9ecad0118adc70f",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::459466811811:instance-profile/EC2_S3_ReadOnly_Access-Profile",
            "Id": "AIPAWV6S3FGR7PQCJ3ALR"
        },
        "State": "associating"
    }
}
```

- Commands to copy the S3 file to a folder inside the instance (executed from inside the EC2 Instance):
```
eval `ssh-agent`
ssh-add ~/.pem/c01aws01key.pem
ssh -A ubuntu@ec2-3-25-98-45.ap-southeast-2.compute.amazonaws.com

sudo snap install aws-cli --classic

aws s3 ls

aws s3 cp s3://igorjosesantos-devopsacademy-c01-aws02/README.md README.md
```

- Add a brief description of the challenges you faced:
```
None
```

***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)