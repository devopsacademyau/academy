# c04-iam01

## Command Execution Output
- aws iam create-user --user-name neljn-user_readonly_s3
- aws iam create-policy --policy-name neljn-user_readonly_s3_policy --policy-document file://neljn-user_readonly_s3_policy.json
- aws iam attatch-user-policy --policy-arm arn:aws:iam:<accountid>:aws:policy/neljn-user_readonly_s3_policy --user-name neljn-user_readonly_s3

Straight forward read only policy for all
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "s3readonly",
            "Effect": "Allow",
            "Action": [
                "s3:List*",
                "s3:Get*"
            ],
            "Resource": "*"
        }
    ]
}
```
- aws iam create-access-key --user-name neljn-user_readonly_S3 > neljn-user_readonly_s3_keys
- create a new section in "~/.aws/config
```
[s3ReadOnlyprofile]
region=ap-southeast-2
aws_access_key_id="value"
aws_secret_access_key="value"
```
- aws s3 ls --profile s3ReadOnlyProfile


<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c04-iam01](https://github.com/devopsacademyau/academy/blob/4d3701fa0791064e8a5b737acae52c992faaa07e/classes/04class/exercises/c04-iam01/README.md)


