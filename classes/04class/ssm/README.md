# System Manager
This class is an introduction to AWS System Manager.
The main goal is to explain the purpose, the benefits and how to use it.

***Contents***
- [System Manager](#system-manager)
	- [What is AWS SSM?](#what-is-aws-ssm)
	- [SSM Parameter Store](#ssm-parameter-store)
	- [Main use cases](#main-use-cases)
	- [Appendix](#appendix)

## What is AWS SSM?
AWS Systems Manager is an AWS service that you can use to view and control your infrastructure on AWS. Using the Systems Manager console, you can view operational data from multiple AWS services and automate operational tasks across your AWS resources.

For the purpose of this class, just the SSM Parameter Store section of the SSM Service will be covered.

## SSM Parameter Store
The SSM Parameter Store is a `mini service` under the AWS SSM an it's main purpose is to manage your configuration data by storing  key/value strings to be retrieved by applications(running on EC2, Containers or Lambdas, for example).

The SSM Parameter store keys can have its values encrypted using KMS keys so sensitive information can also be stored in this service.

The keys are normally formed by a path so multiple applications/environment can be properly organized in the Parameter Store service, as the example below:

```
/application-a/development/db-host
/application-a/development/db-user
/application-a/development/db-password
/application-a/production/db-host
/application-a/production/db-user
/application-a/production/db-password
/application-b/development/db-host
/application-b/development/db-user
/application-b/development/db-password
/application-b/production/db-host
/application-b/production/db-user
/application-b/production/db-password
```

By organising the keys this way, you can also set IAM permissions to those keys based on the path, so application A Development servers/containers/lambdas would only have permission to keys under the path `/application-a/develoepment/*`.

The keys can have its value changed and SSM will keep track of all changes that happen in the key, by using a version feature. Every time that the value is changed the version is increased. The previous values can be seen through the key historic information as well as the modificaion date and the user who modified the value.

## Main use cases
It is a best practice to store configuration data and secrets separately from the code and this is the main use for SSM Parameter Store. 

Having your configuration data in the SSM Parameter Store also increases the security and improves your application management, since all application's parameter, includiding sensitive data, can be stored in the same place.

## Appendix
- [SSM Developer Guide](https://docs.aws.amazon.com/systems-manager/latest/userguide)
