# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
// creating the bucket with LocationConstraint as our region is not us-east-1
> aws s3api create-bucket --bucket devops-academy-rocks-9930.com \
    --region ap-southeast-2 \
    --create-bucket-configuration LocationConstraint=ap-southeast-2

{
    "Location": "http://devops-academy-rocks-9930.com.s3.amazonaws.com/"
}

// don't want to have a public bucket :-)
> aws s3api put-public-access-block \
    --bucket devops-academy-rocks-9930.com \
    --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"

// uploading some coffee to the bucket
> aws s3 cp coffee.json s3://devops-academy-rocks-9930.com
upload: ./coffee.json to s3://devops-academy-rocks-9930.com/coffee.json

```

- Commands to allow the EC2 instance to access the files in S3:
```
// we will use an instance profile with permissions to access S3
// and associate that to our EC2

// create a role to be used with an instance profile
> aws iam create-role --role-name ec2ManagerRole --assume-role-policy-document file://./assume_role_policy.json

// content of the assume_role_policy.json
{
    "Version": "2012-10-17",
    "Statement": [
    {
        "Effect": "Allow",
        "Principal": {
        "Service": [
            "ec2.amazonaws.com"
        ]
        },
        "Action": [
        "sts:AssumeRole"
        ]
    }
    ]
}

// attach S3ReadOnly managed policy to the role
> aws iam attach-role-policy --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess --role-name ec2ManagerRole

// create instance profile for the EC2 and attach our role
> aws iam create-instance-profile --instance-profile-name ec2Manager
> aws iam add-role-to-instance-profile --instance-profile-name ec2Manager --role-name ec2ManagerRole

// associate instance profile to our EC2
> aws ec2 associate-iam-instance-profile --instance-id i-00b83a4dd2b959bb6 --iam-instance-profile Name=ec2Manager 

// trying to access s3 buckets from our instance
> ssh ec2-user@3.104.66.194                                                                                     
    Last login: Sun Jun 14 09:01:47 2020 from 121-200-5-117.79c805.syd.nbn.aussiebb.net

        __|  __|_  )
        _|  (     /   Amazon Linux 2 AMI
        ___|\___|___|

    https://aws.amazon.com/amazon-linux-2/
    [ec2-user@ip-172-31-39-209 ~]$ aws s3 ls
    2020-06-14 07:10:31 devops-academy-rocks-9930.com
    [ec2-user@ip-172-31-39-209 ~]$

```

- Commands to copy the S3 file to a folder inside the instace (executed from inside the EC2 Instance):
```
> ssh ec2-user@3.104.66.194                                                                                     
    Last login: Sun Jun 14 08:50:41 2020 from 121-200-5-117.79c805.syd.nbn.aussiebb.net

        __|  __|_  )
        _|  (     /   Amazon Linux 2 AMI
        ___|\___|___|

    https://aws.amazon.com/amazon-linux-2/
    [ec2-user@ip-172-31-39-209 ~]$
    [ec2-user@ip-172-31-39-209 ~]$
    [ec2-user@ip-172-31-39-209 ~]$ aws s3 cp s3://devops-academy-rocks-9930.com/coffee.json .
    download: s3://devops-academy-rocks-9930.com/coffee.json to ./coffee.json
    [ec2-user@ip-172-31-39-209 ~]$

```

- Add a brief descrition of the challenges you faced:
```
1. Creating S3 from AWS CLI in outside region us-east-1 needs location constraints specified.
2. Secure the bucket to be private.
3. Use an instance profile with a role with appropriate permissions to access S3.

```
 
***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)