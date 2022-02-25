# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
# Creating the S3 bucket
Command:
aws s3api create-bucket \
    --bucket vishaal-c01-aws02 \
    --region ap-southeast-2 \
    --acl private \
    --create-bucket-configuration LocationConstraint=ap-southeast-2

Output:
{
    "Location": "http://vishaal-c01-aws02.s3.amazonaws.com/"
}

# Uploading object.txt to the S3 bucket
Command:
aws s3 cp object.txt s3://vishaal-c01-aws02

Output:
upload: ./object.txt to s3://vishaal-c01-aws02/object.txt  
```

- Commands to allow the EC2 instance to access the files in S3:
```
# Create an IAM role that grants access to Amazon S3 with Amazon EC2 as a trusted entity
Command:
aws iam create-role \
    --role-name vishaalpal-s3-access-c01-aws02 \
    --assume-role-policy-document file://assume-role-trust-policy-document.json

Output:
{
    "Role": {
        "Path": "/",
        "RoleName": "vishaalpal-s3-access-c01-aws02",
        "RoleId": "AROA6DOT2W3CSQ7EEDA2A",
        "Arn": "arn:aws:iam::969496245957:role/vishaalpal-s3-access-c01-aws02",
        "CreateDate": "2022-02-25T03:32:46+00:00",
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

# Create a custom IAM policy that provides minimum required permissions to access the S3 bucket
Command:
aws iam create-policy \
    --policy-name vishaalpal-s3-access-c01-aws02 \
    --policy-document file://c01-aws02-s3-bucket-access-policy.json

Output:
{
    "Policy": {
        "PolicyName": "vishaalpal-s3-access-c01-aws02",
        "PolicyId": "ANPA6DOT2W3CRX42OSUCY",
        "Arn": "arn:aws:iam::969496245957:policy/vishaalpal-s3-access-c01-aws02",
        "Path": "/",
        "DefaultVersionId": "v1",
        "AttachmentCount": 0,
        "PermissionsBoundaryUsageCount": 0,
        "IsAttachable": true,
        "CreateDate": "2022-02-25T03:58:12+00:00",
        "UpdateDate": "2022-02-25T03:58:12+00:00"
    }
}

# Attach the custom IAM policy to the role 
Command:
aws iam attach-role-policy \
    --policy-arn arn:aws:iam::969496245957:policy/vishaalpal-s3-access-c01-aws02 \
    --role-name vishaalpal-s3-access-c01-aws02

Output:
➜  vishaalpal git:(vishaalpal/c01-aws02) ✗ aws iam attach-role-policy \
    --policy-arn arn:aws:iam::969496245957:policy/vishaalpal-s3-access-c01-aws02 \
    --role-name vishaalpal-s3-access-c01-aws02
➜  vishaalpal git:(vishaalpal/c01-aws02) ✗

# Create an IAM instance profile role
Command:
aws iam create-instance-profile \
    --instance-profile-name vishaalpal-s3-access-c01-aws02-instance-profile-role

Output:
{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "vishaalpal-s3-access-c01-aws02-instance-profile-role",
        "InstanceProfileId": "AIPA6DOT2W3CTBZ42AWHT",
        "Arn": "arn:aws:iam::969496245957:instance-profile/vishaalpal-s3-access-c01-aws02-instance-profile-role",
        "CreateDate": "2022-02-25T03:33:28+00:00",
        "Roles": []
    }
}

# Attach the IAM role to the instance profile role
Command:
aws iam add-role-to-instance-profile \
    --role-name vishaalpal-s3-access-c01-aws02 \
    --instance-profile-name vishaalpal-s3-access-c01-aws02-instance-profile-role

Output:
➜  vishaalpal git:(vishaalpal/c01-aws02) ✗ aws iam add-role-to-instance-profile \
    --role-name vishaalpal-s3-access-c01-aws02 \
    --instance-profile-name vishaalpal-s3-access-c01-aws02-instance-profile-role
➜  vishaalpal git:(vishaalpal/c01-aws02) ✗ 

# Attach the IAM instance profile role to the EC2 instances
Command for Bastion-Host:
aws ec2 associate-iam-instance-profile \
    --instance-id i-09987bd7975bce5d4 \
    --iam-instance-profile Name=vishaalpal-s3-access-c01-aws02-instance-profile-role

Command for Private-instance:
aws ec2 associate-iam-instance-profile \
    --instance-id i-0883f9bef57b0c607 \
    --iam-instance-profile Name=vishaalpal-s3-access-c01-aws02-instance-profile-role

Output for Bastion-Host:
{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-073124a16b86c7d01",
        "InstanceId": "i-09987bd7975bce5d4",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::969496245957:instance-profile/vishaalpal-s3-access-c01-aws02-instance-profile-role",
            "Id": "AIPA6DOT2W3CTBZ42AWHT"
        },
        "State": "associating"
    }
}

Output for Private-instance:
{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-01a9e756ebd678385",
        "InstanceId": "i-0883f9bef57b0c607",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::969496245957:instance-profile/vishaalpal-s3-access-c01-aws02-instance-profile-role",
            "Id": "AIPA6DOT2W3CTBZ42AWHT"
        },
        "State": "associating"
    }
}
```

- Commands to copy the S3 file to a folder inside the instance (executed from inside the EC2 Instance):
```
Commands for Bastion-Host:
ssh -A ec2-user@ec2-3-106-116-126.ap-southeast-2.compute.amazonaws.com
aws s3api get-object --bucket vishaal-c01-aws02 --key object.txt object.txt

Commands for Private-instance:
ssh ec2-user@172.31.6.87
aws s3api get-object --bucket vishaal-c01-aws02 --key object.txt object.txt

Output for Bastion-Host:
[ec2-user@ip-172-31-11-87 ~]$ aws s3api get-object --bucket vishaal-c01-aws02 --key object.txt object.txt
{
    "AcceptRanges": "bytes", 
    "ContentType": "text/plain", 
    "LastModified": "Wed, 23 Feb 2022 02:55:49 GMT", 
    "ContentLength": 48, 
    "ETag": "\"bad9bd526c01be66bf90974de91b5e2a\"", 
    "Metadata": {}
}
[ec2-user@ip-172-31-11-87 ~]$ 

Output for Private-instance:
This will not work as the private instance does not have a public IP address to connect to Amazon S3. There is also no S3 VPC endpoint.
```

- Add a brief description of the challenges you faced:
```
The private instance was not able to access the S3 bucket. This is because the instance resides in a public subnet without a public IP address. 
Therefore, it will not be able to route traffic to the IGW. In addition, there is no S3 VPC endpoint in my environment. 
```

<!-- Don't change anything below this point-->
<!-- Before committing, remove both commented lines--> 
***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)

