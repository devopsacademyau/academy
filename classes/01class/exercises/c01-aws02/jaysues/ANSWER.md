# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
first command to make the bucket:
➜  ~ aws s3 mb s3://jaysues-c01-aws02
make_bucket: jaysues-c01-aws02

Then we needed a file to upload:
➜  ~ touch testfile.txt
➜  ~ vim testfile.txt

Once that was done we copied the test file to the bucket:
➜  ~ aws s3 cp testfile.txt s3://jaysues-c01-aws02
upload: ./testfile.txt to s3://jaysues-c01-aws02/testfile.txt

Then we verified the file was in the bucket:

➜  ~ aws s3 ls s3://jaysues-c01-aws02
2022-02-15 12:38:40         20 testfile.txt
```

- Commands to allow the EC2 instance to access the files in S3:
```
First we had to define a trust policy to allow access:

➜  jaysues git:(jaysues/c01-aws02) ✗ touch ec2-trust-policy.json
➜  jaysues git:(jaysues/c01-aws02) ✗ vim ec2-trust-policy.json
(File for this is attached to lesson)

Then we needed to create the role for the EC2 to assume:
➜  jaysues git:(jaysues/c01-aws02) ✗ aws iam create-role --role-name ec2-access-s3-role --assume-role-policy-document file://ec2-trust-policy.json

This was followed by attaching a policy to the role:
➜  jaysues git:(jaysues/c01-aws02) ✗ aws iam attach-role-policy --role-name ec2-access-s3-role --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess

We then created an instance profile and added the role to the profile:
➜  jaysues git:(jaysues/c01-aws02) ✗ aws iam create-instance-profile --instance-profile-name ec2-access-s3-profile
➜  jaysues git:(jaysues/c01-aws02) ✗ aws iam add-role-to-instance-profile --role-name ec2-access-s3-role --instance-profile-name ec2-access-s3-profile

Following the above we then needed to assign the profile to our instance:
➜  jaysues git:(jaysues/c01-aws02) ✗ aws ec2 associate-iam-instance-profile --instance-id i-0c1dc8e0e5f8b724e --iam-instance-profile Name=ec2-access-s3-profile

After waiting for it to attach we verified it was attached with below:

➜  jaysues git:(jaysues/c01-aws02) ✗ aws ec2 describe-iam-instance-profile-associations
```

- Commands to copy the S3 file to a folder inside the instance (executed from inside the EC2 Instance):
```
Add your commands and their outputs here
```
[ec2-user@ip-172-31-47-188 tests3]$ aws s3 cp s3://jaysues-c01-aws02/testfile.txt .
download: s3://jaysues-c01-aws02/testfile.txt to ./testfile.txt
- Add a brief description of the challenges you faced:
```
There was an interesting challenge in that the original policy I wrote had only read access. I created a new policy which allowed write access only to the testfile.txt document so that I could copy it to the ec2 instance. This kept the least privilege access as adding full write perms to the bucket would allow the ec2 to add and remove things as they'd like. The modified line is:
        {
            "Sid": "AllObjectActions",
            "Effect": "Allow",
            "Action": "s3:*Object",
            "Resource": [
                "arn:aws:s3:::jaysues-c01-aws02/testfile.txt"
            ]
        }
```

<!-- Don't change anything below this point-->
<!-- Before committing, remove both commented lines--> 
***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)