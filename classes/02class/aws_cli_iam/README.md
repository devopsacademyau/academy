# Introduction to AWS CLI and IAM service

This class is an introduction to the AWS IAM service. 

The AWS CLI is also introduced as an import tool to help in the daily activities of a Cloud Engineer.

**Contents**
- [Introduction to AWS CLI and IAM service](#introduction-to-aws-cli-and-iam-service)
- [AWS Command Line Interface (CLI)](#aws-command-line-interface-cli)
  - [Why AWS CLI?](#why-aws-cli)
  - [Installation (now CLIv2)](#installation-now-cliv2)
  - [Configuration](#configuration)
    - [Setting Access Keys and Secrets](#setting-access-keys-and-secrets)
      - [Alternative method to set credentials (not recommended)](#alternative-method-to-set-credentials-not-recommended)
      - [Checking who are you with AWS Security Token Service (STS)](#checking-who-are-you-with-aws-security-token-service-sts)
  - [CLI Documentation and Help](#cli-documentation-and-help)
  - [Example: List your S3 buckets](#example-list-your-s3-buckets)
- [AWS Identity and Access Management (IAM)](#aws-identity-and-access-management-iam)
  - [What's IAM?](#whats-iam)
  - [IAM - Four Pillars (Users, Groups, Roles, Policies)](#iam---four-pillars-users-groups-roles-policies)
    - [Users](#users)
    - [Groups](#groups)
    - [Roles](#roles)
    - [Policies and Permissions](#policies-and-permissions)
      - [Policy structure](#policy-structure)
      - [Policy Evaluation Logic](#policy-evaluation-logic)
  - [Let's not depend on users - Using STS to assume roles!](#lets-not-depend-on-users---using-sts-to-assume-roles)
      - [A cleaner way to assume roles using AWS CLI](#a-cleaner-way-to-assume-roles-using-aws-cli)
- [Main class takeaways](#main-class-takeaways)
- [Appendix](#appendix)

# AWS Command Line Interface (CLI)

## Why AWS CLI?
The AWS Command Line Interface is a unified tool that provides a consistent interface for interacting with several AWS services.

It is used by professionals on a daily basis to perform troubleshooting and automation, so it is an essential tool for any AWS professional.

## Installation (now CLIv2)

> For AWS CLI version 2, it doesn't matter if you have Python installed and if you do, it doesn't matter which version. AWS CLI version 2 uses only the embedded version of Python (and any other dependencies) that is included in the installer.


MacOS:
```
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
```

Linux:
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

Test it:
```
$ aws --version
aws-cli/2.0.2 Python/3.7.4 Darwin/19.0.0 botocore/2.0.0dev6
```

## Configuration

For using the AWS CLI to access any AWS service, you need to be authenticated and authorised.
There are two main authentication and authorisation methods: 
- access keys/secrets
- temporary credentials (by assuming a Role or exchanging an authentication token for temporary credentials)

### Setting Access Keys and Secrets
Configure your user credentials in the CLI:

```
aws configure --profile <NAME_OF_PROFILE>
```

You will need to fill your Access Key ID and Secret, as in the example below:

```bash
$ aws configure --profile default
AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [None]: us-west-2
Default output format [None]: ENTER
```

This Access Key ID is used when authenticating in AWS with an User. It can be easily generated with a new User is created in the IAM service with the `Programmatic Access` enabled. [Check this tutorial here]().

Information about which profiles are already configured can be obtained in the AWS CLI configuration file, usually in `~/.aws/config`, try:

`cat ~/.aws/config`

Credentials are in:

`cat ~/.aws/credentials`

You will see something like this, every word between brackets refers to an AWS profile followed by its credentials:
```
[default]
aws_access_key_id = <MY_SECRET_ID>
aws_secret_access_key = <MY_SECRET_KEY>

[denisprod]
aws_access_key_id = <MY_SECRET_ID>
aws_secret_access_key = MY_SECRET_KEY

[denisdev]
aws_access_key_id = <MY_SECRET_ID>
aws_secret_access_key = QMY_SECRET_KEY
```

For using a specific profile during a terminal session, you can set the environment variable `AWS_PROFILE`:

```
export AWS_PROFILE=denisdev
```

#### Alternative method to set credentials (not recommended)

You can also set the environment variables below to set up the credentials:

```
export AWS_ACCESS_KEY_ID=AKIAI44QH8DHBEXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_SESSION_TOKEN=AQoDYXdzEJr...<remainder of security token>
```

You can unset it with:
```
unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_SECURITY_TOKEN
```

#### Checking who are you with AWS Security Token Service (STS)
```bash
aws sts get-caller-identity
```
Output:
```
{
    "UserId": "AIDAUDBAHX4WB4YEJPINL",
    "Account": "281387974444",
    "Arn": "arn:aws:iam::281387974444:user/denismac"
}
```

## CLI Documentation and Help

Usually any click that you perform in the AWS Console will have a correspondent AWS CLI command (be curious, use the `help` command a lot!).

Try any command or subcommand followed by `help`:
```
aws help
```
or
```
aws s3 help
```
or
```
aws s3 cp help
```

You can also check the [web documentation.](https://docs.aws.amazon.com/cli/latest/index.html)

## Example: List your S3 buckets

> The credentials configured must be allowed to `s3:ListBucket` 

> https://docs.aws.amazon.com/cli/latest/reference/s3api/list-buckets.html

Run:

`aws s3 ls`

IAM will validate if your user has rights to perform this operation, if so AWS will return a list of buckets in the account.

***

# AWS Identity and Access Management (IAM)

## What's IAM?
AWS IAM is a web service that helps you securely control access to AWS resources. You use IAM to control who is **authenticated** (signed in) and **authorized** (has permissions) to use resources.

Example: How do you grant read-only access to your friend's AWS user for your EC2 instances?

## IAM - Four Pillars (Users, Groups, Roles, Policies)

![](./assets/iam_overview.jpg)

### Users
An AWS IAM user is an entity that you create in AWS to represent the person or application that uses it to interact with AWS. A user in AWS consists of a name and credentials.

A primary use for IAM users is to give people the ability to sign in to the AWS Management Console for interactive tasks and to make programmatic requests to AWS services using the API or CLI.

An [ARN](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) for an IAM user might look like the following:

`arn:aws:iam::account-ID-without-hyphens:user/Richard`

### Groups
An IAM group is a collection of IAM users. You can use groups to specify permissions for a collection of users, which can make those permissions easier to manage for those users. 

For example, you could have a group called Admins and give that group the types of permissions that administrators typically need.

### Roles
An IAM role is very similar to a user, in that it is an identity with permission policies that determine what the identity can and cannot do in AWS. However, a role does not have any credentials (password or access keys) associated with it. 

Instead of being uniquely associated with one person, a role is ***intended to be assumable*** by anyone who needs it. 

An IAM user can assume a role to temporarily take on different permissions for a specific task.

![](./assets/iam_role.png)

### Policies and Permissions

You manage access in AWS by creating policies and **attaching** them to IAM identities (users, groups of users, or roles) or AWS resources. For other types of policies, [check here](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html).

A ***policy*** is an object in AWS that, when associated with an identity or resource, defines their ***permissions***.

AWS evaluates these policies when an **IAM principal (user or role) makes a request**.

> Other types of permissions are not included in this course as Service Control Policies (SCPs) and Access Control Lists (ACLs).

#### Policy structure
A permission contains the following attributes:

![](./assets/permission_format.png)

- **Version** – Specify the version of the policy language that you want to use. As a best practice, use the latest 2012-10-17 version.

- **Statement** – Use this main policy element as a container for the following elements. You can include more than one statement in a policy.

- **Sid** (Optional) – Include an optional statement ID to differentiate between your statements.

- **Effect** – Use Allow or Deny to indicate whether the policy allows or denies access.

- **Principal** (Required in only some circumstances) – If you create a resource-based policy, you must indicate the account, user, role, or federated user to which you would like to allow or deny access. If you are creating an IAM permissions policy to attach to a user or role, you cannot include this element. The principal is implied as that user or role.

- **Action** – Include a list of actions that the policy allows or denies.

- **Resource** (Required in only some circumstances) – If you create an IAM permissions policy, you must specify a list of resources to which the actions apply. If you create a resource-based policy, this element is optional. If you do not include this element, then the resource to which the action applies is the resource to which the policy is attached.

- **Condition** (Optional) – Specify the circumstances under which the policy grants permission.

Reference [IAM JSON Policy Elements Reference](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements.html) and [Access Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html).

Permissions in the policies determine whether the request is ALLOWED or DENIED.

Policies are defined in JSON, for example:
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "FirstStatement",
      "Effect": "Allow",
      "Action": ["iam:ChangePassword"],
      "Resource": "*"
    },
    {
      "Sid": "SecondStatement",
      "Effect": "Allow",
      "Action": "s3:ListAllMyBuckets",
      "Resource": "*"
    },
    {
      "Sid": "ThirdStatement",
      "Effect": "Allow",
      "Action": [
        "s3:List*",
        "s3:Get*"
      ],
      "Resource": [
        "arn:aws:s3:::confidential-data",
        "arn:aws:s3:::confidential-data/*"
      ],
      "Condition": {"Bool": {"aws:MultiFactorAuthPresent": "true"}}
    }
  ]
}
```


#### Policy Evaluation Logic

> Disconsider for now the columns that contain services not presented up to this point in the course (SCPs, permission boundaries)

![](./assets/PolicyEvaluationHorizontal.png)

For more details, check: https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html

## Let's not depend on users - Using STS to assume roles!

This is called Session Policy.

The AWS Security Token Service (STS) is a web service that enables you to request temporary credentials for AWS IAM users or for users that you authenticate (federated users).

First, the role needs to allow other entities to assume it.

This can be done and checked via the `Trust relationships` in the Console:
![](./assets/trust_relationships.png)

Or via CLI:
```
aws iam get-role --role-name Admin
```
Output:
```
{
    "Role": {
        "Path": "/",
        "RoleName": "Admin",
        "RoleId": "AROAUDBAHX4WG3MUDETMG",
        "Arn": "arn:aws:iam::281387974444:role/Admin",
        "CreateDate": "2019-09-12T05:46:01Z",
        "AssumeRolePolicyDocument": {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Effect": "Allow",
                    "Principal": {
                        "AWS": "arn:aws:iam::855297612111:root"
                    },
                    "Action": "sts:AssumeRole",
                    "Condition": {}
                }
            ]
        },
        "MaxSessionDuration": 3600
    }
}
```

You can see that this role has ARN `arn:aws:iam::281387974444:role/Admin`, meaning that it belongs to the account `281387974444`, and it is allowing the account `855297612111` in the Principal attribute to access it.

```
aws sts assume-role --role-arn arn:aws:iam::281387974444:role/Admin  --role-session-name crossAccountAccess
```

The output for this command is an object containing temporary credentials:
```
{
    "Credentials": {
        "AccessKeyId": "ASIAUDBAHX4WPBBUER6K",
        "SecretAccessKey": "HsdNDdWnhuAZXHLfbtI9UBLShrk4Rkqu63jlCdsn",
        "SessionToken": "IQoJb3JpZ2luX2VjEIT//////////wEaDmFwLXNvdXRoZWFzdC0yIkcwRQIgDpb643Rut9wy4Xi4nqclpr3Mvs7rwApHba4UzLXuYvECIQCa7nQFr6YXzLky8URnEVq/1FL8t6TmR07x88C3Cm8PUCrSaQhdEAEaDDI4MTM4Nzk3NDQ0NCIMtgw1FJs2+OFK/zn1Kq8Bxu9uGBsHrkX2AIqJGZSdo1AsslHww75TtAPobm5Jm3Lp3HGJkSpFnFws4Aly6QMY9j2Q1rQK+lO71kviWOuE0mZKQzT8z6vKdzZ1hRTqyaDj7i0AM00OL3++Zh2fTynK0OdoC3ijJVhPCbAFcXlfdZpywVPyyN45x5iMFhXjLG4jVkkthM6sCHMMkPtsR6KD8CzKSlo5yuEaHucatz2vJc4kWyudPtqxbWVH2DaPCzCCof7yBTrjAZnLzyGwEmdEWJf98SPUjJANvb/p0yl6onJI6fIFGAsBFoz+5d7UgbSwKYlqUtmhbGBuN7eYYLTINhyvhBJsNqSMuQlLW36iFhYoPL884RlCXdQtVsBbjXuoNqcgdobFZeXampmh0R/kgl58LL2L22RxKavwTQ9yhxZNuh8fzjBkA75dslZsVaeuIavHBYlT9N2IMXezukmIVUbmllS7mBXkMdliezI26lvfrMQnlqo3HDSWy1icCJaHfRbgxC5yKxLW6T0avzne5Z8G+QKkdoe3/Vl4cc/rszHt8AITBD0h9I8s",
        "Expiration": "2020-03-04T12:26:58+00:00"
    },
    "AssumedRoleUser": {
        "AssumedRoleId": "AROAUDBAHX4WBGCONOMO4:crossAccess",
        "Arn": "arn:aws:sts::281387974444:assumed-role/Admin/crossAccountAccess"
    }
}
```

#### A cleaner way to assume roles using AWS CLI

1. Configure a new profile and set `role_arn` (the role to be assumed)
   
   ```
   aws configure --profile new-profile set role_arn arn:aws:iam::281387974444:role/Admin
   ```
2. Set the source profile (example, `default`):
    ```
   aws configure --profile new-profile set source_profile default
   ```
2. Just use the new profile:

```
export AWS_PROFILE=new-profile
```
3. Temporary credentials are stored in `~/.aws/cli/cache`.


The image below contains the 3 steps that just happened in the commands above:
![](./assets/iam_sts_for_accessing_accs.png)

*Check the full* [*article here.*](https://aws.amazon.com/blogs/security/how-to-use-a-single-iam-user-to-easily-access-all-your-accounts-by-using-the-aws-cli/)


> Don't forget! You can also use STS service to know who you are!
> 
> Run `aws sts get-caller-identity`
> 
> Experiment attaching a S3 instance role to an EC2 instance
>
> Can you see that the role assumed as exactly the one you attached to the instance? Awesome!

# Main class takeaways 

- CLI can be configured with different profiles and credentials, or assume temporary permissions using Roles
- Remember the main building blocks of IAM - Identities and Policies (Users, Groups, Roles, Policies)
- IAM Policy structure (Effect, Action, Principal, Resource, Condition)

# Appendix

- [AWS CLI Configuration](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)
