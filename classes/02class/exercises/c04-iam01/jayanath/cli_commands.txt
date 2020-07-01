# c04-iam01

## Command Execution Output
```
> aws iam create-user --user-name user_readonly_S3
    {
        "User": {
            "Path": "/",
            "UserName": "user_readonly_S3",
            "UserId": "AIDA5GMYZ45KCWKCMXDUP",
            "Arn": "arn:aws:iam::907095435092:user/user_readonly_S3",
            "CreateDate": "2020-06-29T10:39:20+00:00"
        }
    }

## Create a file with policy json with below content.
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": [
                    "s3:Get*",
                    "s3:List*"
                ],
                "Resource": "*"
            }
        ]
    }

> aws iam create-policy --policy-name S3readOnly --policy-document file://S3readOnly.json
    {
        "Policy": {
            "PolicyName": "S3readOnly",
            "PolicyId": "ANPA5GMYZ45KNTHTQPBEY",
            "Arn": "arn:aws:iam::907095435092:policy/S3readOnly",
            "Path": "/",
            "DefaultVersionId": "v1",
            "AttachmentCount": 0,
            "PermissionsBoundaryUsageCount": 0,
            "IsAttachable": true,
            "CreateDate": "2020-06-29T11:34:32+00:00",
            "UpdateDate": "2020-06-29T11:34:32+00:00"
        }
    }

> aws iam attach-user-policy \
    --user-name user_readonly_S3 \
    --policy-arn arn:aws:iam::907095435092:policy/S3readOnly

## below access key and secret access key were deleted before committing the code :-)
> aws iam create-access-key --user-name user_readonly_S3

    {
        "AccessKey": {
            "UserName": "user_readonly_S3",
            "AccessKeyId": "AKIA5GMYZ45KP2FH5T6A",
            "Status": "Active",
            "SecretAccessKey": "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",
            "CreateDate": "2020-06-29T11:15:28+00:00"
        }
    }

> aws sts get-caller-identity

    {
        "UserId": "AIDA5GMYZ45KCWKCMXDUP",
        "Account": "907095435092",
        "Arn": "arn:aws:iam::907095435092:user/user_readonly_S3"
    }

> aws s3 ls
    2020-06-29 21:45:11 devops-academy-rocks-9930.com


```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines-->
***
Answer for exercise [c04-iam01](https://github.com/devopsacademyau/academy/blob/4d3701fa0791064e8a5b737acae52c992faaa07e/classes/04class/exercises/c04-iam01/README.md)


