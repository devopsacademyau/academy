# c04-iam01

## Command Execution Output

```
#create user
aws iam create-user --user-name user_readonly_S3

#create policy
aws iam create-policy --policy-name S3readOnly --policy-document file://iam_policy.json

# attach policy to user
aws iam attach-user-policy --policy-arn arn:aws:iam::639247960747:policy/S3readOnly  --user-name user_readonly_S3

# create access key for user
aws iam create-access-key --user-name user_readonly_S3

# configure profiles
cat ~/.aws/credentials
[default]
aws_access_key_id = REDACTED
aws_secret_access_key = REDACTED
[iam_class]
aws_access_key_id = REDACTED
aws_secret_access_key = REDACTED

# switch to "iam_class" profile
export AWS_PROFILE=iam_class

# confirm user is user_readonly_S3
aws sts get-caller-identity
{
    "UserId": "AIDAZJVRFZKV2OYJAALNC",
    "Account": "639247960747",
    "Arn": "arn:aws:iam::639247960747:user/user_readonly_S3"
}

# list s3 buckets
$ aws s3 ls --profile iam_class
2022-02-16 11:49:08 c01-aws02-20220216
2021-11-25 18:23:29 cf-templates-1b0f17j97pa58-ap-southeast-1
2021-11-20 16:21:06 cf-templates-1b0f17j97pa58-ap-southeast-2
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c04-iam01](https://github.com/devopsacademyau/academy/blob/4d3701fa0791064e8a5b737acae52c992faaa07e/classes/04class/exercises/c04-iam01/README.md)


