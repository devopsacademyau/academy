# c04-iam01

## Command Execution Output
- [cli_commands.txt](cli_commands.txt)

# Create user
```bash
$ aws iam create-user --user-name user_readonly_S3

{
    "User": {
        "Path": "/",
        "UserName": "user_readonly_S3",
        "UserId": "AIDAXXVUXIS3EI6LOEUP2",
        "Arn": "arn:aws:iam::531881215158:user/user_readonly_S3",
        "CreateDate": "2022-08-29T06:40:10+00:00"
    }
}
```

# Create a new Policy called S3readOnly
```bash
$ aws iam create-policy --policy-name S3readOnly --policy-document file://iam_policy.json

{
    "Policy": {
        "PolicyName": "S3readOnly",
        "PolicyId": "ANPAXXVUXIS3GK4AI4LX3",
        "Arn": "arn:aws:iam::531881215158:policy/S3readOnly",
        "Path": "/",
        "DefaultVersionId": "v1",
        "AttachmentCount": 0,
        "PermissionsBoundaryUsageCount": 0,
        "IsAttachable": true,
        "CreateDate": "2022-08-29T06:41:33+00:00",
        "UpdateDate": "2022-08-29T06:41:33+00:00"
    }
}
```
# Attach the policy to the user
```bash
$ aws iam attach-user-policy --policy-arn arn:aws:iam::531881215158:policy/S3readOnly \
--user-name user_readonly_S3
```

# Create a new Access Key (and secret) for this new user
```bash
$ aws iam create-access-key --user-name user_readonly_S3

{
    "AccessKey": {
        "UserName": "user_readonly_S3",
        "AccessKeyId": "****************XNN26",
        "Status": "Active",
        "SecretAccessKey": "********************************BAq9A",
        "CreateDate": "2022-08-29T06:44:46+00:00"
    }
}
```

# Configure a new AWS CLI profile called s3ReadOnlyProfile
```bash
$ aws configure --profile s3ReadOnlyProfile

AWS Access Key ID [****************7AX7]: ****************XNN26
AWS Secret Access Key [****************K7r/]: ********************************BAq9A
Default region name: ap-southeast-2
Default output format [None]:
```

# For checking the new user's permissions to S3, run the command below:
```bash
$ aws s3 ls --profile s3ReadOnlyProfile

2022-08-29 11:49:08 c04-iam01
2022-08-28 18:23:29 cf-templates-14es24tfe5hbf-ap-southeast-2
2021-08-28 16:21:06 cf-templates-3dp4ld94kll93-ap-southeast-2
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c04-iam01](https://github.com/devopsacademyau/academy/blob/4d3701fa0791064e8a5b737acae52c992faaa07e/classes/04class/exercises/c04-iam01/README.md)

