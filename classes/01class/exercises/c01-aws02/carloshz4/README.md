# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:
```
aws s3 mb s3://da-bucket-carlos
aws s3 cp textfile.txt s3://da-bucket-carlos/textfile.txt
```

- Commands to allow the EC2 instance to access the files in S3:

#### Create trusted policy for the role containing:

```
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

and giving that policy the name: DA_EC2_TO_S3_ROLE-Trust-Policy.json

#### Create role with trusted policy

```
aws iam create-role --role-name DA_EC2_TO_S3_ROLE --assume-role-policy-document file://DA_EC2_TO_S3_ROLE-Trust-Policy.json

----------------------------------------------------------------------
|                             CreateRole                             |
+--------------------------------------------------------------------+
||                               Role                               ||
|+------------+-----------------------------------------------------+|
||  Arn       |  arn:aws:iam::016454647794:role/DA_EC2_TO_S3_ROLE   ||
||  CreateDate|  2020-06-17T23:28:41+00:00                          ||
||  Path      |  /                                                  ||
||  RoleId    |  AROAQHVGF77ZPAWKT3HUK                              ||
||  RoleName  |  DA_EC2_TO_S3_ROLE                                  ||
|+------------+-----------------------------------------------------+|
|||                    AssumeRolePolicyDocument                    |||
||+---------------------------+------------------------------------+||
|||  Version                  |  2012-10-17                        |||
||+---------------------------+------------------------------------+||
||||                           Statement                          ||||
|||+---------------------+----------------------------------------+|||
||||  Action             |  sts:AssumeRole                        ||||
||||  Effect             |  Allow                                 ||||
|||+---------------------+----------------------------------------+|||
|||||                          Principal                         |||||
||||+-------------------+----------------------------------------+||||
|||||  Service          |  ec2.amazonaws.com                     |||||
||||+-------------------+----------------------------------------+||||

```

#### Attach S3 Read Only policy to the role

```
aws iam attach-role-policy --role-name DA_EC2_TO_S3_ROLE --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess
```

#### Create instance profile (to allow EC2 to pass IAM role)

```
aws iam create-instance-profile --instance-profile-name DA_EC2_TO_S3_ROLE-Instance-Profile

------------------------------------------------------------------------------------------------------------
|                                           CreateInstanceProfile                                          |
+----------------------------------------------------------------------------------------------------------+
||                                             InstanceProfile                                            ||
|+---------------------+----------------------------------------------------------------------------------+|
||  Arn                |  arn:aws:iam::016454647794:instance-profile/DA_EC2_TO_S3_ROLE-Instance-Profile   ||
||  CreateDate         |  2020-06-17T23:37:31+00:00                                                       ||
||  InstanceProfileId  |  AIPAQHVGF77ZBZPA2U2SL                                                           ||
||  InstanceProfileName|  DA_EC2_TO_S3_ROLE-Instance-Profile                                              ||
||  Path               |  /                                                                               ||
|+---------------------+----------------------------------------------------------------------------------+|


aws iam add-role-to-instance-profile --role-name DA_EC2_TO_S3_ROLE --instance-profile-name DA_EC2_TO_S3_ROLE-Instance-Profile

```

#### Attach role to the EC2 instance previously created 

```
aws ec2 associate-iam-instance-profile --instance-id i-068d692611d480ca0 --iam-instance-profile Name=DA_EC2_TO_S3_ROLE-Instance-Profile

----------------------------------------------------------------------------------------------------------------
|                                          AssociateIamInstanceProfile                                         |
+--------------------------------------------------------------------------------------------------------------+
||                                        IamInstanceProfileAssociation                                       ||
|+-----------------------------------------------+------------------------------------+-----------------------+|
||                 AssociationId                 |            InstanceId              |         State         ||
|+-----------------------------------------------+------------------------------------+-----------------------+|
||  iip-assoc-06c38b487474b83cf                  |  i-068d692611d480ca0               |  associating          ||
|+-----------------------------------------------+------------------------------------+-----------------------+|
|||                                            IamInstanceProfile                                            |||
||+---------------------------------------------------------------------------------+------------------------+||
|||                                       Arn                                       |          Id            |||
||+---------------------------------------------------------------------------------+------------------------+||
|||  arn:aws:iam::016454647794:instance-profile/DA_EC2_TO_S3_ROLE-Instance-Profile  |  AIPAQHVGF77ZBZPA2U2SL |||
||+---------------------------------------------------------------------------------+------------------------+||
```



- Commands to copy the S3 file to a folder inside the instace (executed from inside the EC2 Instance):

SSH to the jumphost.

The instance was created with Amazon Linux, hence AWS cli is installed by default.

```
aws s3 ls
aws s3 cp  s3://da-bucket-carlos/textfile.txt textfile.txt
```

- Add a brief descrition of the challenges you faced:
```
- Understanding first the concept of the trusted policy.
- The concept of instance profile was different to what I saw in via the console procedure.
```

***
Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)
