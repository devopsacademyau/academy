# Introduction to Cloudwatch

**Contents**

- [What is Cloudwatch](#what-is-cloudwatch)
- [Free Tier](#free-tier)
- [Features](#features)
    - [Metrics](#metrics)
    - [Alarms](#alarms)
    - [Logs](#logs)
    - [Events](#events)
- [References](#references)

# What is Cloudwatch

Monitoring and observability service that provides data and actionable insights to monitor your environment on a unified view of operational health. Cloudwatch collects monitoring and operational data in the form of logs, metrics and events.

Access to write and read logs from Cloudwatch is managed via IAM. Most of AWS services requires explicit role permissions allowing to use the service.

# Free Tier

Cloudwatch is included on the free-tier and can help you get started with but not limited to:

- 5min frequency metrics. Up to 10 detailed monitoring metrics (1min frequency)
- 3 dashboards
- 10 alarms
- 5GB for logs
- all events

# Features
    
## Metrics
Time-ordered set of data points from various AWS Services.

Most common being from workloads running on EC2/ECS/EKS. Can track cpu usage, memory or disk space utilisation.

Cloudwatch does not collect memory/disk metrics out-of-the-box on EC2. You need to configure the Cloudwatch Agent on your instances to retrieve these metrics.


## Alarms
Alarms watch metric values against pre-defined or custom thresholds that when triggered can take actions like scaling up or down an EC2 ASG for capacity and resource planning.

Can also be used for creating AWS billing alarms.

## Logs
Explore/visualise application logs to address operational or performance issues. Quickly query and filter with the interactive console.

Native integration with Lambda functions, VPC Flow Logs, CloudTrail, among others common AWS services. EC2 instances requires configuring the CLoudwatch Agent to stream logs to cloudwatch.

## Events
Deliver near real-time stream of system events based on changes in AWS resources. In combination with CloudTrail being enabled, can trigger actions basedo on API calls. i.e:

If someone `s3:PutObject` under a specific path on a S3 bucket, run a Lambda that moves the file to a correct location.

- Events: actions happening on AWS resources
- Targets: where to send the event to be processed
- Rules: matches incoming event and send to targets

# References

- [AWS Cloudwatch](https://aws.amazon.com/cloudwatch/)
- [User Guide](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/acw-ug.pdf)