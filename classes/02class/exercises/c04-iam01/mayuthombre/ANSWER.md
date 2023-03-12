# c04-iam01

## Command Execution Output
- [cli_commands.txt](cli_commands.txt)

- Create a new IAM User called user_readonly_S3

To create a new user, use the following command

```
aws iam create-user --user-name user_readonly_S3

Output
    {
        "User": {
            "Path": "/",
            "UserName": "user_readonly_S3",
            "UserId": "AIDA34ZGGFMF6TTKRUD2M",
            "Arn": "arn:aws:iam::817734494987:user/user_readonly_S3",
            "CreateDate": "2022-08-25T05:06:47+00:00"
        }
    }
```
- Create a new Policy called S3readOnly that ALLOWS only S3 reads on every S3 resource. 

Before we go on to create a policy. We need the JSON file which is basically a document in the current folder that grants access to the S3 bucket for read only actions.
Therefore, go ahead and create "policy.json"

Subsequently, create the policy but first ensure that you are working on the directory where the JSON policy is stored.
```
aws iam create-policy --policy-name S3readOnly --policy-document file://policy.json

Output
    {
        "Policy": {
            "PolicyName": "S3readOnly",
            "PolicyId": "ANPA34ZGGFMF3J7BBP7V2",
            "Arn": "arn:aws:iam::817734494987:policy/S3readOnly",
            "Path": "/",
            "DefaultVersionId": "v1",
            "AttachmentCount": 0,
            "PermissionsBoundaryUsageCount": 0,
            "IsAttachable": true,
            "CreateDate": "2022-08-25T05:18:49+00:00",
            "UpdateDate": "2022-08-25T05:18:49+00:00"
        }
    }
```

- Attach the policy to the use

You use this operation to attach this newly created policy to a user.

```
aws iam attach-user-policy --policy-arn arn:aws:iam::817734494987:policy/S3readOnly --user-name user_readonly_S3
```
If attach is successful there should be no new response from terminal. That means our policy has been attached successfully.


- Create a new Access Key (and secret) for this new user.

The following create-access-key command creates an access key (access key ID and secret access key) for the IAM user named user_readonly_S3:

```
aws iam create-access-key --user-name user_readonly_S3

Output
    {
        "AccessKey": {
            "UserName": "user_readonly_S3",
            "AccessKeyId": "xx",
            "Status": "Active",
            "SecretAccessKey": "xx",
            "CreateDate": "2022-08-25T05:25:12+00:00"
        }
    }
```

- Configure a new AWS CLI profile called s3ReadOnlyProfile using the credentials from the previous step.

```
aws configure --profile user_readonly_S3
```

- For checking the new user's permissions to S3, run the command below:

```
aws s3 ls

Output
    2022-06-15 18:00:26 cf-templates-dhekiz8mx6o6-us-east-1

This highlights that we have successfully created a new user who only has read only access to the S3 buckets. Try creating a new bucket or putting object in the file. It should not work since we havent granted enough privileges to allow create bucket or object. 


***
Answer for exercise [c04-iam01](https://github.com/devopsacademyau/academy/blob/4d3701fa0791064e8a5b737acae52c992faaa07e/classes/04class/exercises/c04-iam01/README.md)


