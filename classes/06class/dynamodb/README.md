# Lambda Functions
This class is an introduction to Lambda Functions.
The main goal is to explain the purpose, the benefits and how to use it.

***Contents***
- [What is Lambda Functions?](#what-is-lambda-functions)
- [Benefits](#benefits)
- [Lambda Invocation](#lambda-invocation)
- [Event Sources](#event-sources)
- [Execution Role](#execution-role)
- [Common Use Cases](#common-use-cases)


## What is Lambda Functions?
Lambda Functions is one of the services part of the AWS Compute Services Family. Similar to the EC2 service, where you can run your application code, the purpose of the Lambda Function service is also to run application code, but in a different way. 

With Lambda Functions, your code does not need a server. At least nothing that you need to provision or manage. That's why Lambda Functions is a serverless service. You upload your code (list of languages can be found [here](https://aws.amazon.com/lambda/faqs/)) and your code will be executed when invoked.

## Benefits

The biggest benefit of using Lambda Function is the fact that you only pay for what you use. For services like EC2, you pay for the time your instance is up, which already provide you with a lot of cost benefits, since you can turn some of your servers down when your application load is reduced.

This cost reduction that can be achieved with EC2 instances can be even more benefitial when using Lambda Functions to run your applications, since you'll only pay for the time your application is being executed. If your application has no requests, there is no invocations of your Lambda Function and no costs to you.

It's important to make clear that in order to move your application to a service like this, some code transformations might be required, so it will require somework to just move an existing application running on VMs to run on this AWS service.

## Lambda Invocation

Lambda Functions can be invoked in many ways. Those ways can be either Synchronous or Asynchronous.

In the Synchronous mode is when you directly invoke your lambda function and waits for a response from the execution. By invoking a lambda from the aws cli, like the example below, you're using the asynchronous mode.
```bash
aws lambda invoke --function-name my-function --payload '{ "key": "value" }' response.json
{
    "ExecutedVersion": "$LATEST",
    "StatusCode": 200
}
```

In the Asynchronous mode, the Lambda Function is normally invoked by an event in the AWS ecosystem. An event like a new file in a S3 bucket, a new update on your dynamodb or new new message ina SQS queue are good examples of asynchronous Lambda invocation. 

In this mode, the Lambda is invoked similar to the synchronous mode, but in this case, there is no wait for the Lambda response. For this kind of invocation, Lambda places the event in a queue and only returns a success reponse without any additional information.

It's still possible to invoke a Lambda function in this mode using the cli by using the `--invocation-type Event` parameter when invoking a function. In the example below, using the same function, you can see a differnt response from previous example.

```bash
$ aws lambda invoke --function-name my-function  --invocation-type Event --payload '{ "key": "value" }' response.json
{
    "StatusCode": 202
}
```

More details around those two types of invocation can be found [here](https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html) and [here](https://docs.aws.amazon.com/lambda/latest/dg/invocation-sync.html).

## Event Sources

There are multiple events that can be used to invoke a Lambda Function. Common event sources are S3 events (like a new file upload), a new message in a SNS Topic, a new message in a SQS queue, API Gateway requests and DynamoDB events(like new item), but there are many more. [Here](https://docs.aws.amazon.com/lambda/latest/dg/lambda-services.html) you can find a list of AWS services that integrates with Lambda with examples.

A Lambda can have one or more events configured to trigger it. Once the event happens, the function is executed.

## Execution Role

Because the Lambda Function may need to interact with other AWS services, like createing a file in S3, interacting with DynamoDB or even logging the execution, it's possible to configure a role to be used by the Lambda during it's execution.

This role is similar any other role in AWS and is created throught the IAM and policies attached to it. A single Execution Role can be attached to a Lambda Function, so make sure that all permissions that will be required by the Lambda to successfully interact with AWS services are included in the Role configured in the Function.

## Common Use Cases

Lambda Functions can be used for pretty much anything. From executing a daily job in your AWS Account, like shutting down instances that do not have a specific tag, to run an entire website, Lambda Function is one of the most powerfull services provided by AWS.

Some of the most common use cases are described below:

- Real Time Data Processing
    - Use AWS Lambda to thumbnail images, transcode videos, index files, process logs, validate content, and aggregate and filter data in real-time.
- Real Time Data Streaming
    - Use AWS Lambda and Amazon Kinesis to process real-time streaming data for application activity tracking, transaction order processing, click stream analysis, data cleansing, metrics generation, log filtering, indexing, social media analysis, and IoT device data telemetry and metering
- Web Applications
    - Use AWS Lambda with other AWS services to build powerful web applications that automatically scale up and down and run in a highly available configuration across multiple data centers 
- Operations Tasks
    - Use AWS Lambda to automate common task to manage your AWS environment, like cleaning up unused EIP or EBS volumes or shutting down resources that were not created with the right tags.