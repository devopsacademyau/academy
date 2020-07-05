# c04-iam01

## Command Execution Output
- [cli_commands.txt](cli_commands.txt)

1. CREATE IAM USER: 

  > aws iam create-user --user-name user_readonly_s3 --tags Key=Name,Value=s3readonlyuser 

     {
       "User": {
          "Path": "/",
          "UserName": "user_readonly_s3",
          "UserId": "AIDATPFLUM2ILGD4Y75Y2",
          "Arn": "arn:aws:iam::238730634896:user/user_readonly_s3",
          "CreateDate": "2020-07-03T06:33:50+00:00",
          "Tags": [
              {
                "Key": "Name",
                "Value": "s3readonlyuser"
              }
          ]
      }
     }

2. CREATE POLICY JASON FILE AND CREATE POLICY:

  > aws iam create-policy --policy-name s3readOnly --policy-document file://s3readonlypolicy.json 

    {
        "Policy": {
            "PolicyName": "s3readOnly",
            "PolicyId": "ANPATPFLUM2IJH3BHGJMZ",
            "Arn": "arn:aws:iam::238730634896:policy/s3readOnly",
            "Path": "/",
            "DefaultVersionId": "v1",
            "AttachmentCount": 0,
            "PermissionsBoundaryUsageCount": 0,
            "IsAttachable": true,
            "CreateDate": "2020-07-03T07:31:49+00:00",
            "UpdateDate": "2020-07-03T07:31:49+00:00"
        }
    }

3. ATTACH POLICY TO IAM USER:

  > aws iam attach-user-policy --user-name user_readonly_s3 --policy-arn arn:aws:iam::238730634896:policy/s3readOnly 

4. CREATE ACCESS KEY FOR USER:

  > aws iam create-access-key --user-name user_readonly_s3

5. CREATE AWS CLI PROFILE WITH ACCESS KEYS

  > aws configure --profile s3ReadOnlyProfile


6. CREATE A S3 TEST BUCKET: 

  > aws s3api create-bucket --bucket devopsacademy-bucket --create-bucket-configuration LocationConstraint=ap-southeast-2

7. LIST THE BUCKET CREATED WITH NEW AWS CLI PROFILE CREATED:

  > aws s3 ls --profile s3ReadOnlyProfile
	2020-07-03 17:53:30 devopsacademy-bucket
 
<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c04-iam01](https://github.com/devopsacademyau/academy/blob/4d3701fa0791064e8a5b737acae52c992faaa07e/classes/04class/exercises/c04-iam01/README.md)


