# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:

# Add your commands and their outputs here
```
    - Create s3
        - 'aws s3 mb s3://abtestbucket270921 --region ap-southeast-2'
    - Copy file to s3
        - aws s3 cp /Users/andrewbrowne/Documents/Contino/AWS/test.txt s3://abtestbucket270921

- Commands to allow the EC2 instance to access the files in S3:
```
# Add your commands and their outputs here
```
Create policy
    aws iam create-policy --policy-name abS3readOnly --policy-document file://s3readonly.json

    {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*",
            ],
            "Resource": "*"
        }
    ]
    }

Create role
    aws iam create-role --role-name ab-s3-read-only --assume-role-policy-document file://s3readonly.json


    aws iam create-instance-profile --instance-profile-name ab-s3-read-only

    aws iam add-role-to-instance-profile --role-name ab-s3-read-only --instance-profile-name ab-s3-read-only

Attach role
    aws ec2 associate-iam-instance-profile --instance-id i-004fc1566495ead25 --iam-instance-profile Name=ab-s3-read-only
```

- Commands to copy the S3 file to a folder inside the instance (executed from inside the EC2 Instance):
```
# Add your commands and their outputs here
```
  - Coping the s3 file

    ```
    aws s3 cp s3://abtestbucket270921/test-file.txt test-file.txt


- Add a brief description of the challenges you faced:
```
Add comments here
```

<!-- Don't change anything below this point-->
<!-- Before committing, remove both commented lines--> 
***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)