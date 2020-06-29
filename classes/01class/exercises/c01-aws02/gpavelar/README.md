# C01-AWS02

## Commands Execution Output

- Commands to create the S3 Bucket and to copy the file to the bucket:

```bash
## Creating bucket S3 - first way
$ aws s3 mb s3://mydevops-bucket
# output
make_bucket: mydevops-bucket

## Creating bucket S3 - second way
$ aws s3api create-bucket --bucket myseconddevops-bucket --region ap-southeast-2
# output
/myseconddevops-bucket

## Listing bucket S3
$ aws s3 ls
# output
2020-06-20 13:00:33 mydevops-bucket
2020-06-20 13:07:04 myseconddevops-bucket
## or
$ aws s3api list-buckets
# output
BUCKETS 2020-06-20T03:00:33+00:00       mydevops-bucket
BUCKETS 2020-06-20T03:07:04+00:00       myseconddevops-bucket
OWNER   gpavelardev     ***********

## copying a file to my s3 bucket.
aws s3 cp devops-classes/devops-rules.txt s3://mydevops-bucket/devops-classes
## Another test
aws s3 cp devops-classes/devops-aws.txt s3://mydevops-bucket/devops-classes/ --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers


```

- Commands to allow the EC2 instance to access the files in S3:

```bash
## Acessing instance via SSH. I stopped this instance
$ ssh -A ec2-user@3.104.223.187
## Trying to list aws s3
$ aws s3 ls
# output
Unable to locate credentials. You can configure credentials by running "aws configure".
$ aws configure
## Added my access key id and secret access key with a policy s3bucketreadonly.

## I had already created the user with s3 interface on browser.

## So, I also tried to create a IAM role using AWS CLI
## Creating role
aws iam create-role --role-name Test-Role --assume-role-policy-document file://Role-Read-Trust-Policy.json

```

Policy file used:

```json
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Principal": { "Service": "ec2.amazonaws.com" },
    "Action": "sts:AssumeRole"
  }
}
```

```bash
# output

ROLE arn:aws:iam::478433196210:role/Test-Role 2020-06-21T13:44:23+00:00 / AROAW6ZGXHCZNG4L6UYON Test-Role
ASSUMEROLEPOLICYDOCUMENT 2012-10-17
STATEMENT sts:AssumeRole Allow
PRINCIPAL ec2.amazonaws.com

## Attach a managed policy to an IAM role

aws iam attach-role-policy --policy-arn arn:aws:iam::aws:policy/ReadOnlyAccess --role-name Test-Role

# output

NONE


## After this because I was already using a ReadOnly IAM role, I couldn't perform any more actions, example:

aws iam list-access-keys

An error occurred (AccessDenied) when calling the ListAccessKeys operation: User: arn:aws:iam::478433196210:user/testing is not authorized to perform: iam:ListAccessKeys on resource: user nulltesting

## But, Because I was already using a ReadOnly IAM user, I could perform the following steps.
```

- Commands to copy the S3 file to a folder inside the instace (executed from inside the EC2 Instance):

```bash

### I'm already inside the EC2 instance, because I accessed it via SSH in the previous exercise.
mkdir testing-dir
aws s3 cp s3://mydevops-bucket/devops-classes/devops-aws.txt testing-dir
download: s3://mydevops-bucket/devops-classes/devops-aws.txt to ./testing-dir
## If i want to keep the same-directory from s3 bucket
## I should use the following command
aws s3 sync s3://mydevops-bucket/devops-classes/ devops-classes
download: s3://mydevops-bucket/devops-classes/devops-aws.txt to devops-classes/devops-aws.txt

```

- Add a brief description of the challenges you faced:

1. Execut the aws s3 sync
   It was not syncing my file to s3 bucket. So I prefered to use `aws s3 cp <local> <s3>` instead.

```

## output

aws s3 sync "devops-classes/devops-rules.txt" s3://mydevops-bucket/devops-classes
warning: Skipping file /home/devops-classes/devops-rules.txt/. File does not exist.

```

2. Documentation
   It seems to be simple when you already know how to do some tasks and steps. But There are a lot of details that you must know to accomplish some tasks on aws services.

3. Policy to Create role
   Find the correct policy file to allow create a example user

## S3 (C01-aws02)

- Use the CLI to create a S3 bucket and upload a file to it.
- Access the file on the S3 bucket from any the EC2 instance created in the previous exercise.
- Submit a PR to the DevOpsAcademy repo under the `/classes/01class/exercises/c01-aws02/<github-username>` folder of this class with a brief description of what you did to achieve this objective. The file containing the solution you used must be named README.md

## Submit a PR with the folowing file:

- README.md based on the [ANSWER.md](ANSWER.md) file with the commands requested.

## References

- [S3 Bucket Creation](https://docs.aws.amazon.com/cli/latest/reference/s3/mb.html)

### Tip:

You can access the file on the S3 bucket by creating an IAM role with a S3 policy(you can use the `AmazonS3ReadOnlyAccess`) and attaching it to your EC2 instance. One of the best practices when creating IAM policies is to grant least privilege to the users. The objective is to initially give the users only the access/permission they need to complete the intended task and grant additional permissions as necessary later. This is more secure than starting with permissions that are too lenient and then trying to tighten them later.

**Why using least privilege is important:**
Granting full access/excessive permissions might cause potential security breach if the account is compromised. The compromised account could execute malicious code or access sensitive data.

**Source**:

https://circleci.com/blog/minimize-risk-using-the-principle-of-least-privilege-and-aws-iam-permissions/
https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#grant-least-privilege

**Useful link on creating custom policy:**

https://aws.amazon.com/blogs/security/use-the-new-visual-editor-to-create-and-modify-your-aws-iam-policies/

---

Answer for exercise [c01-aws02](https://github.com/devopsacademyau/academy/blob/635775538e8ad7793b305f48064b09e23c626fb7/classes/01class/exercises/c01-aws02/README.md)
