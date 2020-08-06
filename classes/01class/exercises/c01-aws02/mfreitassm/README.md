# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
aws s3api create-bucket --bucket devops-c01-s3 --region ap-southeast-2 --create-bucket-configuration LocationConstraint=ap-southeast-2
{
    "Location": "http://devops-c01-s3.s3.amazonaws.com/"
}

aws s3api put-object --bucket devops-c01-s3 --key Star-wars-logo-new-tall.webp --body //home/mfreitas/Documents/projects/images/Star-wars-logo-new-tall.webp
{
    "ETag": "\"6b0bd8bc8dc3f30eed8f5f26e4bfbf33\""
}
```

- Commands to allow the EC2 instance to access the files in S3:
```
cat s3bucketEc2-Role-Trust-Policy.json
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Principal": {"Service": "ec2.amazonaws.com"},
    "Action": "sts:AssumeRole"
  }
}

aws iam create-role --role-name S3BucketRole --description "Allow Access to S3Bucket"  --assume-role-policy-document file://s3bucketEc2-Role-Trust-Policy.json
{
    "Role": {
        "Path": "/",
        "RoleName": "S3BucketRole",
        "RoleId": "AROAXEKFEEQA6WQFTX4LG",
        "Arn": "arn:aws:iam::490308117505:role/S3BucketRole",
        "CreateDate": "2020-08-06T06:44:46Z",
        "AssumeRolePolicyDocument": {
            "Version": "2012-10-17",
            "Statement": {
                "Effect": "Allow",
                "Principal": {
                    "Service": "ec2.amazonaws.com"
                },
                "Action": "sts:AssumeRole"
            }
        }
    }
}
aws iam attach-role-policy --role-name S3BucketRole --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess

aws iam create-instance-profile --instance-profile-name devops-s3bucket-access-profile
{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "devops-s3bucket-access-profile",
        "InstanceProfileId": "AIPAXEKFEEQA7UPBDEURD",
        "Arn": "arn:aws:iam::490308117505:instance-profile/devops-s3bucket-access-profile",
        "CreateDate": "2020-08-06T06:54:26Z",
        "Roles": []
    }
}

aws iam add-role-to-instance-profile --instance-profile-name devops-s3bucket-access-profile --role-name S3BucketRole

aws ec2 associate-iam-instance-profile --instance-id i-0f2563f665748c349 --iam-instance-profile Name="devops-s3bucket-access-profile" 
{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-041046805c20134a7",
        "InstanceId": "i-0f2563f665748c349",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::490308117505:instance-profile/devops-s3bucket-access-profile",
            "Id": "AIPAXEKFEEQA7UPBDEURD"
        },
        "State": "associating"
    }
}
aws ec2 describe-iam-instance-profile-associations
{
    "IamInstanceProfileAssociations": [
        {
            "AssociationId": "iip-assoc-041046805c20134a7",
            "InstanceId": "i-0f2563f665748c349",
            "IamInstanceProfile": {
                "Arn": "arn:aws:iam::490308117505:instance-profile/devops-s3bucket-access-profile",
                "Id": "AIPAXEKFEEQA7UPBDEURD"
            },
            "State": "associated"
        }
    ]
}
```

- Commands to copy the S3 file to a folder inside the instance (executed from inside the EC2 Instance):
```
ssh -i "DevopsAcademy.pem" ec2-user@ec2-3-25-87-178.ap-southeast-2.compute.amazonaws.com
The authenticity of host 'ec2-3-25-87-178.ap-southeast-2.compute.amazonaws.com (3.25.87.178)' can't be established.
ECDSA key fingerprint is SHA256:S53y0iyneQ8CgE2LJ6CuL5jpkmGtM2hIC939z7e3LhQ.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'ec2-3-25-87-178.ap-southeast-2.compute.amazonaws.com,3.25.87.178' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
4 package(s) needed for security, out of 8 available
Run "sudo yum update" to apply all updates.
ec2-user@ip-172-31-33-50 ~]$ ls
[ec2-user@ip-172-31-33-50 ~]$ aws s3 cp s3://devops-c01-s3/Star-wars-logo-new-tall.webp Star-wars-logo-new-tall.webp
download: s3://devops-c01-s3/Star-wars-logo-new-tall.webp to ./Star-wars-logo-new-tall.webp
[ec2-user@ip-172-31-33-50 ~]$ ls
Star-wars-logo-new-tall.webp

```

- Add a brief description of the challenges you faced:
```
I had some error like "An error occurred (MalformedPolicyDocument) when calling the CreateRole operation: Has prohibited field Resource"
So I Discover that The policy document should be something like:

{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Principal": {"Service": "ec2.amazonaws.com"},
    "Action": "sts:AssumeRole"
  }
}
This is called a trust relationship policy document. This is different from a policy document. Whatever you have pasted is for the policy attached to a role which is done using attach role policy and in the AWS console, for roles there is a separate tab for trust relationship.

```

***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)