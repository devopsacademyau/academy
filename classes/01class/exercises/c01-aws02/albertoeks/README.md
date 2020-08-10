# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
``` sh
#create a bucket
$ aws s3 mb s3://c01-aws02 --region ap-southeast-2
make_bucket: c01-aws02

#list bucket
$ aws s3 ls
2020-08-09 15:18:07 c01-aws02

#copy a file to the bucket
$ aws s3 cp file.txt s3://c01-aws02/file.txt
upload: ./file.txt to s3://c01-aws02/file.txt
```

- Commands to allow the EC2 instance to access the files in S3:

``` sh
$ cat <<EOF > ec2-role-trust-policy.json
 {
   "Version": "2012-10-17",
   "Statement": [
     {
       "Effect": "Allow",
       "Principal": { "Service": "ec2.amazonaws.com"},
       "Action": "sts:AssumeRole"
     }
   ]
 }
EOF

#create a role s3access
$ aws iam create-role --role-name s3access --assume-role-policy-document ec2-role-trust-policy.json

#Struggled with 'An error occurred (MalformedPolicyDocument) when calling the CreateRole operation: This policy contains invalid Json'
#Realized that need to amend file:// at the beginning

$ aws iam create-role --role-name s3access --assume-role-policy-document file://ec2-role-trust-policy.json
{
    "Role": {
        "Path": "/",
        "RoleName": "s3access",
        "RoleId": "AROAQ3YX5V65YVHC2K3ZC",
        "Arn": "arn:aws:iam::059642851259:role/s3access",
        "CreateDate": "2020-08-09T05:27:03+00:00",
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

$ cat <<EOF > ec2-role-access-policy.json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::c01-aws02/file.txt",
                "arn:aws:s3:::c01-aws02"
            ]
        }
    ]
}
EOF

#attach the policy to s3access role 
$ aws iam put-role-policy --role-name s3access --policy-name S3-Permissions --policy-document file://ec2-role-access-policy.json

#create instance profile
$ aws iam create-instance-profile --instance-profile-name s3access-profile
{
    "InstanceProfile": {
        "Path": "/",
        "InstanceProfileName": "s3access-profile",
        "InstanceProfileId": "AIPAQ3YX5V65R7WC2ZDJM",
        "Arn": "arn:aws:iam::059642851259:instance-profile/s3access-profile",
        "CreateDate": "2020-08-09T05:40:25+00:00",
        "Roles": []
    }
}

#attach the role to instance profile 
$ aws iam add-role-to-instance-profile --instance-profile-name s3access-profile --role-name s3access
```

- Commands to copy the S3 file to a folder inside the instance (executed from inside the EC2 Instance):
``` sh

#the following 3 steps are just to fire up a new ec2 instance
$ aws ec2 create-security-group --group-name SG-PUBLIC --description "SG-PUBLIC"
{
    "GroupId": "sg-0fbf0061cf7aa8df1"
}

$ aws ec2 authorize-security-group-ingress --group-id sg-0fbf0061cf7aa8df1 --protocol tcp --port 22 --cidr 0.0.0.0/0 --region ap-southeast-2

$ aws ec2 run-instances --image-id ami-04fcc97b5f6edcd89 --instance-type t2.micro --count 1  --security-group-ids sg-0fbf0061cf7aa8df1 --subnet-id subnet-701e7c28 --region ap-southeast-2 --associate-public-ip-address --key-name AlbertoKeyPair --iam-instance-profile 

#access the ec2 instance
$ ssh -i AlbertoKeyPair.pem ubuntu@13.210.113.24

#As my ec2 instance was a ubuntu one, there was no aws-cli out-of-the-box. So, I had to install aws-cli before move on

ubuntu@13.210.113.24$ sudo snap install aws-cli --classic

ubuntu@13.210.113.24$ aws s3 ls c01-aws02
2020-07-27 12:40:55         10 file.txt

ubuntu@13.210.113.24$ ls
file.txt

ubuntu@13.210.113.24$ cat file.txt
Hello S3! 
```

- Add a brief description of the challenges you faced:
```
Two challenges that I would highlight on this exercise are:

1. An error with invalid json, when I tried to create a role from a json file, but actually the error was that I missed the 'file://' on --assume-role-policy-document argument. For me, the message wasn't quite helpful.

2. I'd consider using an Amazon Linux instance next time as I had to add an extra step (install aws cli on ec2 instance) to get the task done.
```

***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)