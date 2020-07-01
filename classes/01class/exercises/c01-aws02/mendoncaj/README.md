# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
$ aws s3api create-bucket \
--bucket devops-academy-30062020-1140 \
--region us-east-1

$ aws s3api put-bucket-tagging \
--bucket devops-academy-30062020-1140 \
--tagging 'TagSet=[{Key=ref,Value=devops-academy}]'

$ aws s3api put-public-access-block \
--bucket devops-academy-30062020-1140 \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"

$ aws s3api put-object \
--bucket devops-academy-30062020-1140 \
--key docs/README.md \
--body ~/scm/academy-backup/academy/classes/01class/exercises/c01-aws02/mendoncaj/README.md
```

- Commands to allow the EC2 instance to access the files in S3:

```
# Create the role and attach the trust policy that allows EC2 to assume this role.
$ aws iam create-role \
--role-name ec2-trust-policy-da-bucket-full-access-role \
--assume-role-policy-document file://~/aws-policies/ec2-trust-policy.json

# adding permissions into role trust policy, this role policy specifies what it is allowed to do.
$ aws iam put-role-policy \
--role-name ec2-trust-policy-da-bucket-full-access-role \
--policy-name da-bucket-full-access-policy \
--policy-document file://~/aws-policies/bucket-access.json 

# Create the instance profile required by EC2 to contain the role
$ aws iam create-instance-profile \
--instance-profile-name ec2-trust-policy-da-bucket-full-access-role

# add the role to the instance profile
$ aws iam add-role-to-instance-profile \
--instance-profile-name ec2-trust-policy-da-bucket-full-access-role \
--role-name ec2-trust-policy-da-bucket-full-access-role

# finally, Attach the IAM instance profile to the EC2 instance 

>>> public instance <<<
$ aws ec2 associate-iam-instance-profile \
--instance-id i-0e42d482aeeb370bc \
--iam-instance-profile Name=ec2-trust-policy-da-bucket-full-access-role

>>> private instance <<<
$ aws ec2 associate-iam-instance-profile \
--instance-id i-020f5d08ce00716fe \
--iam-instance-profile Name=ec2-trust-policy-da-bucket-full-access-role
```

- Commands to copy the S3 file to a folder inside the instace (executed from inside the EC2 Instance):
```
Add your commands and their outputs here

$ aws s3api list-objects \
--bucket devops-academy-30062020-1140 \
--query 'Contents[].{Key: Key, Size: Size}'

>>> public instance <<<
$ aws s3 cp s3://devops-academy-30062020-1140/docs/README.md .

>>> private instance <<<
1) create an elastic ip
$ aws ec2 allocate-address --dry-run

2) create a nat gateway ( into public subnet )
$ aws ec2 create-nat-gateway \
--subnet-id subnet-023eea3a77ed5cba5 \
--allocation-id eipalloc-03d10df32ccdec79a

3) update the private route table to add the nat gateway entry.
aws ec2 create-route \
--route-table-id rtb-046db089d6e210030 \
--destination-cidr-block 0.0.0.0/0 \
--nat-gateway-id nat-0733ab2c12a4540cb

$ aws s3 cp s3://devops-academy-30062020-1140/docs/README.md .
```

- Add a brief description of the challenges you faced:
```
1) it was hard to join the pieces to create role and instance profile to allow ec2 instances to have access to non public s3 objects.

2) a lot of steps to provide a way to communicate a private instances to have access to internet and consecutively to s3 objects.
```

> ec2-trust-policy.json
```
{
    "Version": "2012-10-17",
    "Statement": {
        "Effect": "Allow",
        "Principal": {"Service": "ec2.amazonaws.com"},
        "Action": "sts:AssumeRole"
    }
}
```

> bucket-access.json 
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": [
                "arn:aws:s3:::devops-academy-30062020-1140",
                "arn:aws:s3:::devops-academy-30062020-1140/*"
            ]
        }
    ]
}
```
 
***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)