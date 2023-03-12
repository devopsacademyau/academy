# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
#Create an S3 bucket 
aws s3 mb s3://bucket-c01-aws02-1

#Create an empty file to copy
touch test2.txt
#Copy in the s3 bucket 
aws s3 cp test2.txt s3://bucket-c01-aws02-1

```


- Commands to allow the EC2 instance to access the files in S3:


```

#Create policy file named ec2-s3-read-access.json
cat << EOF > s3-read-access.json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetBucketLocation",
                "s3:ListAllMyBuckets"
            ],
            "Resource": "arn:aws:s3:::*"
        },
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::bucket-c01-aws02-1",
                "arn:aws:s3:::bucket-c01-aws02-1/*"
            ]
        }
    ]
}
EOF

#Enables access to ec2 instances to the previous policy 
cat << EOF > ec2-trust-policy.json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

#Create an IAM role 
aws iam create-role \
    --role-name read-s3-bucket \
    --assume-role-policy-document file://ec2-trust-policy.json

#Create an IAM policy 
aws iam put-role-policy \
    --role-name read-s3-bucket  \
    --policy-name s3-read-access \
    --policy-document file://s3-read-access.json

#Create an ec2 instance profile
aws iam create-instance-profile \
    --instance-profile-name EC2-S3-Access

#Associate instance profile with current ec2 instance 
aws ec2 associate-iam-instance-profile \
    --instance-id i-035f9526c4f5c9718 \
    --iam-instance-profile Name=EC2-S3-Access
```



- Commands to copy the S3 file to a folder inside the instance (executed from inside the EC2 Instance):
```
ssh -i kp-devops-c01-aws01.pem ubuntu@54.79.122.57

aws sts get-caller-identity
aws s3 cp s3://bucket-c01-aws02-1/test2.txt 

```

- Add a brief description of the challenges you faced:
```
Getting access to the ec2 instance was the most challanging part because there were so many ways. 
There were enough documentation on how to create IAM roles and policies. 
The CLI isn't my first option, but it was good to practice this skill. 
```

<!-- Don't change anything below this point-->
<!-- Before committing, remove both commented lines--> 
***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)