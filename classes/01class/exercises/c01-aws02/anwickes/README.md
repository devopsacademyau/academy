## c01-aws02

- Use the CLI to create a S3 bucket and upload a file to it.
- Access the file on the S3 bucket from any of the EC2 instances created in the previous exercise.

# Use CLI to create a new S3 bucket

- Create bucket "anwickes-bucket"
> aws s3api create-bucket --bucket anwickes-devopsacademyau-bucket --region ap-southeast-2 --create-bucket-configuration LocationConstraint=ap-southeast-2

```
{
    "Location": "http://anwickes-devopsacademyau-bucket.s3.amazonaws.com/"
}
```

# Use CLI to upload file to S3 bucket created above

- Upload file "index.html"
> aws s3 cp index.html s3://anwickes-devopsacademyau-bucket

```
upload: .\index.html to s3://anwickes-devopsacademyau-bucket/index.html
```

> aws s3 ls s3://anwickes-devopsacademyau-bucket

```
2020-07-12 16:50:06        171 index.html
```

# Create IAM role that grants S3 access and attach to EC2 instance

- Create role
> aws iam create-role --role-name anwickes-devopsacademyau-bucket-role --assume-role-policy-document file://anwickes-devopsacademyau-bucket-role.json

```
{
        "RoleId": "AROAYVE3JVV7MHKVLXFEW",
        "Arn": "arn:aws:iam::595178663294:role/anwickes-devopsacademyau-bucket-role",
        "CreateDate": "2020-07-12T07:07:47+00:00",
        "AssumeRolePolicyDocument": {
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
    }
}
```

- Create policy and attach it to role
> aws iam put-role-policy --role-name anwickes-devopsacademyau-bucket-role --policy-name anwickes-devopsacademyau-bucket-ro-policy --policy-document file://anwickes-devopsacademyau-bucket-ro-policy.json

- Create IAM instance profile and attach to EC2 instance
> aws iam create-instance-profile --instance-profile-name anwickes-devopsacademyau-bucket-RO-instance

```
{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "anwickes-devopsacademyau-bucket-RO-instance",
        "InstanceProfileId": "AIPAYVE3JVV7OIOE3RX7G",
        "Arn": "arn:aws:iam::595178663294:instance-profile/anwickes-devopsacademyau-bucket-RO-instance",
        "CreateDate": "2020-07-12T07:56:18+00:00",
        "Roles": []
    }
}
```

- Add role to instance profile
> aws iam add-role-to-instance-profile --role-name anwickes-devopsacademyau-bucket-role --instance-profile-name anwickes-devopsacademyau-bucket-RO-instance

- Associate IAM instance profile to instance
> aws ec2 associate-iam-instance-profile --instance-id i-0eb95b5ec77d4ed6d --iam-instance-profile Name=anwickes-devopsacademyau-bucket-RO-instance

```
{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-045e8648473de8292",
        "InstanceId": "i-0eb95b5ec77d4ed6d",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::595178663294:instance-profile/anwickes-devopsacademyau-bucket-RO-instance",
            "Id": "AIPAYVE3JVV7OIOE3RX7G"
        },
        "State": "associating"
    }
}
```

# SSH to EC2 instance and attempt to access S3 bucket contents

> ssh -i anwickesPub.pem ec2-user@54.206.32.27
> aws s3 ls anwickes-devopsacademyau-bucket

```
2020-07-12 06:50:06        171 index.html
```