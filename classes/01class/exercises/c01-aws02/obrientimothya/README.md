# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:

```
AWS_ACCESS_KEY_ID=<HOWABOUTNO>
AWS_SECRET_ACCESS_KEY=<NOTTODAYJIM>
AWS_DEFAULT_REGION=us-east-1

aws s3 mb s3://obrientimothyaaws02
aws s3 cp ~/code/test.sh s3://obrientimothyaaws02/

# output
upload: ../test.sh to s3://obrientimothyaaws02/test.sh
```

- Commands to allow the EC2 instance to access the files in S3:

```
AWS_ACCESS_KEY_ID=<HOWABOUTNO>
AWS_SECRET_ACCESS_KEY=<NOTTODAYJIM>

aws iam create-policy --policy-name ReadAws02Bucket --policy-document file:///tmp/policy.json

#output
{
    "Policy": {
        "PolicyName": "ReadAws02Bucket",
        "PolicyId": "ANPAWLZJXXALKPMMT4JOE",
        "Arn": "arn:aws:iam::437637330966:policy/ReadAws02Bucket",
        "Path": "/",
        "DefaultVersionId": "v1",
        "AttachmentCount": 0,
        "PermissionsBoundaryUsageCount": 0,
        "IsAttachable": true,
        "CreateDate": "2020-06-23T06:47:56+00:00",
        "UpdateDate": "2020-06-23T06:47:56+00:00"
    }
}

cat <<EOF > /tmp/assumepolicy.json
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

aws iam create-role --role-name EC2ReadAws02Bucket --assume-role-policy-document file:///tmp/assumepolicy.json

# output
{
    "Role": {
        "Path": "/",
        "RoleName": "EC2ReadAws02Bucket",
        "RoleId": "AROAWLZJXXALEX64FM355",
        "Arn": "arn:aws:iam::437637330966:role/EC2ReadAws02Bucket",
        "CreateDate": "2020-06-23T07:04:04+00:00",
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


cat <<EOF > /tmp/policy.json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetLifecycleConfiguration",
                "s3:GetBucketTagging",
                "s3:GetInventoryConfiguration",
                "s3:GetObjectVersionTagging",
                "s3:ListBucketVersions",
                "s3:GetBucketLogging",
                "s3:ListBucket",
                "s3:GetAccelerateConfiguration",
                "s3:GetBucketPolicy",
                "s3:GetObjectVersionTorrent",
                "s3:GetObjectAcl",
                "s3:GetEncryptionConfiguration",
                "s3:GetBucketObjectLockConfiguration",
                "s3:GetBucketRequestPayment",
                "s3:GetAccessPointPolicyStatus",
                "s3:GetObjectVersionAcl",
                "s3:GetObjectTagging",
                "s3:GetMetricsConfiguration",
                "s3:GetBucketPublicAccessBlock",
                "s3:GetBucketPolicyStatus",
                "s3:ListBucketMultipartUploads",
                "s3:GetObjectRetention",
                "s3:GetBucketWebsite",
                "s3:GetBucketVersioning",
                "s3:GetBucketAcl",
                "s3:GetObjectLegalHold",
                "s3:GetBucketNotification",
                "s3:GetReplicationConfiguration",
                "s3:ListMultipartUploadParts",
                "s3:GetObject",
                "s3:GetObjectTorrent",
                "s3:DescribeJob",
                "s3:GetBucketCORS",
                "s3:GetAnalyticsConfiguration",
                "s3:GetObjectVersionForReplication",
                "s3:GetBucketLocation",
                "s3:GetAccessPointPolicy",
                "s3:GetObjectVersion"
            ],
            "Resource": "arn:aws:s3:::obrientimothyaaws02"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetAccessPoint",
                "s3:GetAccountPublicAccessBlock",
                "s3:ListAllMyBuckets",
                "s3:ListAccessPoints",
                "s3:ListJobs",
                "s3:HeadBucket"
            ],
            "Resource": "*"
        }
    ]
}
EOF

aws iam put-role-policy --role-name EC2ReadAws02Bucket --policy-name Read02Bucket --policy-document file:///tmp/policy.json

aws iam create-instance-profile --instance-profile-name EC2Read02BucketProfile

#output
{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "EC2Read02BucketProfile",
        "InstanceProfileId": "AIPAWLZJXXALLETBRE37W",
        "Arn": "arn:aws:iam::437637330966:instance-profile/EC2Read02BucketProfile",
        "CreateDate": "2020-06-23T07:14:49+00:00",
        "Roles": []
    }
}

aws iam add-role-to-instance-profile --role-name EC2ReadAws02Bucket --instance-profile-name EC2Read02BucketProfile

aws ec2 associate-iam-instance-profile --instance-id i-0b704b4be5b1197db --iam-instance-profile Name=EC2Read02BucketProfile

# output
{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-06bfab58cf8f2675a",
        "InstanceId": "i-0b704b4be5b1197db",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::437637330966:instance-profile/EC2Read02BucketProfile",
            "Id": "AIPAWLZJXXALLETBRE37W"
        },
        "State": "associating"
    }
}

```

- Commands to copy the S3 file to a folder inside the instace (executed from inside the EC2 Instance):

```
# ssh to instance, then
aws s3 cp s3://obrientimothyaaws02/test.sh ./test.sh

# output
download: s3://obrientimothyaaws02/test.sh to ./test.sh
```

- Add a brief description of the challenges you faced:

```
I have done this process before. However, one tricky thing to remember is the need to create an instance profile before assigning a role to the ec2 instance.
```

---

Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)
