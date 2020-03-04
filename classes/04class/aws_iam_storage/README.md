# Introduction to Containers

This class is an introduction to the AWS storage service S3, AWS IAM and database service RDS.

The AWS CLI is also introduced as an import tool to help in the daily activities of a Cloud Engineer.

**Contents**
- [Introduction to Containers](#introduction-to-containers)
- [AWS Command Line Interface (CLI)](#aws-command-line-interface-cli)
  - [Why AWS CLI?](#why-aws-cli)
  - [Installation (now CLIv2)](#installation-now-cliv2)
  - [Configuration](#configuration)
    - [Access Keys and Secrets](#access-keys-and-secrets)
  - [CLI Documentation and Help](#cli-documentation-and-help)
- [AWS Identity and Access Management (IAM)](#aws-identity-and-access-management-iam)
  - [What's IAM?](#whats-iam)
  - [IAM - Four Pillars (Users, Groups, Roles, Policies)](#iam---four-pillars-users-groups-roles-policies)
    - [Users](#users)
    - [Groups](#groups)
    - [Roles](#roles)
    - [Policies and Permissions](#policies-and-permissions)
      - [Policy format](#policy-format)
      - [Policy Evaluation Logic](#policy-evaluation-logic)
  - [Let's not depend on users - Using STS to assume roles!](#lets-not-depend-on-users---using-sts-to-assume-roles)
- [AWS Simple Storage Service (S3)](#aws-simple-storage-service-s3)
  - [What's S3?](#whats-s3)
  - [Main Use Cases](#main-use-cases)
  - [When not to use it](#when-not-to-use-it)
  - [Use case 1: Distribute static content](#use-case-1-distribute-static-content)
  - [Use case 2: Host entire static websites](#use-case-2-host-entire-static-websites)
- [AWS Relational Database Service (RDS)](#aws-relational-database-service-rds)
  - [Why RDS?](#why-rds)
    - [Database Engines available](#database-engines-available)
    - [Database on EC2 vs RDS](#database-on-ec2-vs-rds)
- [Main class takeaways](#main-class-takeaways)
- [Appendix](#appendix)
  - [Archiving/Backup - Amazon Glacier](#archivingbackup---amazon-glacier)




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

### Access Keys and Secrets
Configure your user credentials in the CLI:

```
aws configure
```

You will need to fill your Access Key ID and Secret, as in the example below:

```bash
$ aws configure
AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [None]: us-west-2
Default output format [None]: ENTER
```

This Access Key ID is used when authenticating in AWS with an User. It can be easily generated with a new User is created in the IAM service with the `Programmatic Access` enabled. [Check this tutorial here]().


Checking who are you with AWS Security Token Service (STS)
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



# AWS Identity and Access Management (IAM)

## What's IAM?
AWS Identity and Access Management (IAM) is a web service that helps you securely control access to AWS resources. You use IAM to control who is **authenticated** (signed in) and **authorized** (has permissions) to use resources.

Example: How do you grant read-only access to your friend's AWS user for your EC2 instances?

## IAM - Four Pillars (Users, Groups, Roles, Policies)

![](./assets/iam_overview.jpg)

### Users
An AWS Identity and Access Management (IAM) user is an entity that you create in AWS to represent the person or application that uses it to interact with AWS. A user in AWS consists of a name and credentials.

A primary use for IAM users is to give people the ability to sign in to the AWS Management Console for interactive tasks and to make programmatic requests to AWS services using the API or CLI.

An [ARN](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) for an IAM user might look like the following:

`arn:aws:iam::account-ID-without-hyphens:user/Richard`

### Groups
An IAM group is a collection of IAM users. You can use groups to specify permissions for a collection of users, which can make those permissions easier to manage for those users. 

For example, you could have a group called Admins and give that group the types of permissions that administrators typically need.

### Roles
An IAM role is very similar to a user, in that it is an identity with permission policies that determine what the identity can and cannot do in AWS. However, a role does not have any credentials (password or access keys) associated with it. 

Instead of being uniquely associated with one person, a role is intended to be assumable by anyone who needs it. 

An IAM user can assume a role to temporarily take on different permissions for a specific task.

![](./assets/iam_role.png)

### Policies and Permissions

You manage access in AWS by creating policies and **attaching** them to IAM identities (users, groups of users, or roles) or AWS resources. 

A policy is an object in AWS that, when associated with an identity or resource, defines their permissions. 

AWS evaluates these policies when an **IAM principal (user or role) makes a request**. 

Permissions in the policies determine whether the request is ALLOWED or DENIED.

Policies are defined in JSON, for example:
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "ec2:*",
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "cloudwatch:*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "autoscaling:*",
            "Resource": "*"
        }
    ]
}
```

#### Policy format
A policy contains four main attributes: Effect, Action, Principal, Resource

**WIP - EXPLAIN FORMAT **

#### Policy Evaluation Logic

> Desconsider for now the columns that contain services not presented up to this point in the course (SCPs, permission boundaries)

![](./assets/PolicyEvaluationHorizontal.png)

For more details, check: https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html

## Let's not depend on users - Using STS to assume roles!

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


> You can also use STS service to know who you are!
> 
> Run `aws sts get-caller-identity`
> 
> Experiment attaching a S3 instance role to an EC2 instance, as you've done in class 02.
>
> Can you see that the role assumed as exactly the one you attached to the instance? Awesome!


The image below contains the 3 steps that just happened in the commands above:
![](./assets/iam_sts_for_accessing_accs.png)

*Check the full* [*article here.*](https://aws.amazon.com/blogs/security/how-to-use-a-single-iam-user-to-easily-access-all-your-accounts-by-using-the-aws-cli/)







# AWS Simple Storage Service (S3)

Extracted from [AWS Whitepaper - AWS Storage Services Overview](https://d0.awsstatic.com/whitepapers/AWS%20Storage%20Services%20Whitepaper-v9.pdf)

## What's S3?
Amazon Simple Storage Service (Amazon S3) provides developers and IT teams secure, durable, highly scalable object storage at a very low cost.

You can store and retrieve any amount of data, at any time, from anywhere on the web through a simple web service interface.

You can write, read, and delete objects containing from zero to 5 TB of data.

## Main Use Cases
There are four common usage patterns for Amazon S3:

1. Store and distribute **static web content and media**. This content can be delivered directly from Amazon S3 because each object in S3 has a unique HTTP URL.
2. Host entire **static websites**. Amazon S3 provides a low-cost, highly available, and highly scalable solution, including storage for static HTML files, images, videos, and client-side scripts in formats such as JavaScript.
3. **Data store** for computation and large-scale analytics, such as financial transaction analysis and clickstream analytics. You can access your data from multiple computing nodes concurrently without being constrained by a single connection.
4. **Backup and archiving** of critical data.

## When not to use it

![](./assets/anti_patterns_s3_usage.png)

*AWS Whitepaper - AWS Storage Services Overview* [[source]](https://d0.awsstatic.com/whitepapers/AWS%20Storage%20Services%20Whitepaper-v9.pdf)

## Use case 1: Distribute static content

**WIP - DETAIL **

## Use case 2: Host entire static websites

**WIP - DETAIL  **





# AWS Relational Database Service (RDS)

## Why RDS?

**WIP - HIGH LEVEL  **

### Database Engines available

### Database on EC2 vs RDS



# Main class takeaways 
- IAM - Four Pillars (Users, Groups, Roles, Policies)
- Policy statements format (Effect, Action, Principal, Resource)



# Appendix
- https://docs.aws.amazon.com/whitepapers/latest/aws-overview/storage-services.html
- https://docs.aws.amazon.com/whitepapers/latest/aws-overview/database.html

## Archiving/Backup - Amazon Glacier
Ref: https://aws.amazon.com/glacier/

Amazon Glacier is a storage service for data archiving and online backup.

You store data in Amazon Glacier as **archives**. An archive can represent a single file, or you can combine several files to be uploaded as a single archive.

Amazon Glacier is designed for use with other Amazon web services. You can seamlessly move data between Amazon Glacier and Amazon S3 using S3 data lifecycle policies.