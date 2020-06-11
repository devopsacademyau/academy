# C01-AWS02

## Commands Execution Output

### Commands to create the S3 Bucket and to copy the file to the bucket:

```bash
# Create the bucket devops-c01-aws02
$ aws s3api create-bucket \
    --bucket devops-c01-aws02 \
    --region ap-southeast-2 \
    --create-bucket-configuration LocationConstraint=ap-southeast-2
    {
        "Location": "http://devops-c01-aws02.s3.amazonaws.com/"
    }

# Upload a text file into the bucket created
$ aws s3api put-object \
    --bucket devops-c01-aws02 \
    --key iron-man.txt \
    --body iron-man.txt
ETag: '"55ad80e6acf44dbe1525078b982e165d"'
```

### Commands to allow the EC2 instance to access the files in S3:

> Following the best practices, we are going to create a policy which will allow the
> EC2 instance to read objects from our bucket created.
> The policy will be constrained to the bucket `devops-c01-aws02` and action `s3:GetObject`.

```bash

# Create the role 'read-devops-bucket'
$ aws iam create-role \
    --role-name read-devops-bucket \
    --assume-role-policy-document file://ec2-role-trust-policy.json             
{   
    "Role": {
        "Path": "/",
        "RoleName": "read-devops-bucket",
        "RoleId": "AROARNTFJYACBRG4KEVTW",
        "Arn": "arn:aws:iam::097922957316:role/read-devops-bucket",
        "CreateDate": "2020-06-10T00:14:21Z",
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

# Assign the role access policy.
# This policy has the details to which resources will be constrained to
# and which actions will be allowed.
$ aws iam put-role-policy \
    --role-name read-devops-bucket \
    --policy-name S3-Permissions \
    --policy-document file://ec2-role-access-policy.json

# To assign a role to the EC2 instance, will need to create an instance profile first.
$ aws iam create-instance-profile --instance-profile-name devops-bucket-access-profile
{   
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "devops-bucket-access-profile",
        "InstanceProfileId": "AIPARNTFJYACE7TBUPGIV",
        "Arn": "arn:aws:iam::097922957316:instance-profile/devops-bucket-access-profile",
        "CreateDate": "2020-06-10T00:18:29Z",
        "Roles": []
    }
}

# Now we are going to add the role to the instance profile created
$ aws iam add-role-to-instance-profile \
    --instance-profile-name devops-bucket-access-profile \
    --role-name read-devops-bucket

# Last step is to link the instance profile to our instance.
# First we must have the instance id of our EC2 instance.
# I only have one instance running, the following command will print the instance id
$ aws ec2 describe-instances --query "Reservations[].Instances[].[InstanceId]" --output text
i-01cacc036a49a2c8a

# Now we link the instance-profile to our instance id.
$ aws ec2 associate-iam-instance-profile \
    --instance-id i-01cacc036a49a2c8a \
    --iam-instance-profile Name="devops-bucket-access-profile"     
{
    "IamInstanceProfileAssociation": {
        "AssociationId": "iip-assoc-05302c899e2d85611",
        "InstanceId": "i-01cacc036a49a2c8a",
        "IamInstanceProfile": {
            "Arn": "arn:aws:iam::097922957316:instance-profile/devops-bucket-access-profile",
            "Id": "AIPARNTFJYACE7TBUPGIV"
        },
        "State": "associating"
    }
}
```

<details>
<summary>
    <b>file:</b> ec2-role-trust-policy.json
</summary>
<p>

```json
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
```

</p>
</details>

<details>
<summary>
    <b>file:</b> ec2-role-access-policy.json
</summary>
<p>

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowReadDevopsS3Buckets",
      "Effect": "Allow",
      "Action": [
        "s3:GetObject"
      ],
      "Resource": [
        "arn:aws:s3:::devops-c01-aws02/*"
      ]
    }
  ]
}
```

</p>
</details>

### Commands to copy the S3 file to a folder inside the instance (executed from inside the EC2 Instance):

> Since we are using IAM policies, we are going to use the `aws cli` to copy the content into the EC2 Instance.
> The `Amazon Linux 2 AMI` already come with the `aws cli` installed. For any other distro, 
> we might need to install it using the package manager such as `apt get`.

I am going to use the following command syntax to copy the file content:

```bash
$ aws s3 cp s3://<bucket>/<path/to/file> <path/to/local/file>
```

The output of the commands can be seen below:
```bash
$ ssh -i kp-devops-c01-aws01.pem ec2-user@54.252.200.218
Last login: Wed Jun 10 00:23:25 2020 from 233.135.148.122.sta.dodo.net.au

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
[ec2-user@ip-172-31-34-231 ~]$ aws s3 cp s3://devops-c01-aws02/iron-man.txt iron-man.txt
download: s3://devops-c01-aws02/iron-man.txt to ./iron-man.txt
[ec2-user@ip-172-31-34-231 ~]$ cat iron-man.txt
You can take away my house, all my tricks and toys. One thing you cannot take away_ I am Iron Man.
```

### Add a brief description of the challenges you faced:

> The main challenge was to give permission for the EC2 Instance to connect and read the file content in the S3 bucket.
> 
> I needed to execute a series of commands to do that. Reading the [AWS User Guide](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2.html) helps me to understand the role of the IAM and how EC2 Instances use it to access AWS resources (S3 in this case).
> 
> I tried to create an access policy with substantial limitations (read objects from our bucket only). My first attempted failed because I didn't specify the resource adequately.
> Once I fix that, I learn that merely changing the access role will not be applied immediately to my EC2 Instance. I needed to use a command to replace my instance profile for the same instance profile so the permissions will be refreshed and I would be able to download the file from S3 Bucket.


***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)