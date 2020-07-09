# c04-iam01

## Command Execution Output
- [cli_commands.txt](cli_commands.txt)

- Command to create new user
```
aws iam create-user  --user-name user_readonly_S3
>The command returns:
{
    "User": {
        "Path": "/",
        "UserName": "user_readonly_S3",
        "UserId": "AIDAWMG45LNQQK3F2RZDK",
        "Arn": "arn:aws:iam::438549961569:user/user_readonly_S3",
        "CreateDate": "2020-07-02T08:26:34+00:00"
    }
}
```

- Policy file with required permissions
```
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
                "*"
            ]
        }
    ]
}
```
- Command to create a policy 
```
aws iam create-policy \
--policy-name S3readOnly \
--policy-document file://DAPolicy.json
>The command returns
{
    "Policy": {
        "PolicyName": "S3readOnly",
        "PolicyId": "ANPAWMG45LNQ6FVO6ILV5",
        "Arn": "arn:aws:iam::438549961569:policy/S3readOnly",
        "Path": "/",
        "DefaultVersionId": "v1",
        "AttachmentCount": 0,
        "PermissionsBoundaryUsageCount": 0,
        "IsAttachable": true,
        "CreateDate": "2020-07-02T08:30:06+00:00",
        "UpdateDate": "2020-07-02T08:30:06+00:00"
    }
}
```
- Command to attach the policy to the user
 ```
    aws iam attach-user-policy \
    --user-name user_readonly_S3 \
    --policy-arn arn:aws:iam::438549961569:policy/S3readOnly
 ```   
- Command to create a new Access Key (and secret) for the new user
```
    aws iam create-access-key \
    --user-name user_readonly_S3
    >The command returns:
    {
        "AccessKey": {
            "UserName": "user_readonly_S3",
            "AccessKeyId": "****************4NP3",
            "Status": "Active",
            "SecretAccessKey": "****************ddFD",
            "CreateDate": "2020-07-02T08:38:46+00:00"
        }
    }
```

- Command to configure a new AWS CLI profile
```
aws configure --profile s3ReadOnlyProfile
>The command returns:
AWS Access Key ID [None]: ****************4NP3
AWS Secret Access Key [None]: ****************ddFD
Default region name [None]: ap-southeast2
Default output format [None]:
```

- Command to check the new user's permissions to S3
```
aws s3 ls --profile s3ReadOnlyProfile
>The command returns the list of buckets
```

***
Answer for exercise [c04-iam01](https://github.com/devopsacademyau/academy/blob/4d3701fa0791064e8a5b737acae52c992faaa07e/classes/04class/exercises/c04-iam01/README.md)


