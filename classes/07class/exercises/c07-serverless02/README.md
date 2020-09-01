## Handle EC2 instances not tagged

Requirement:
- If an EC2 instance is running and is not tagged with `CostCentre` (any value), terminate it and notify subscribed admins

Tips:
- Solution will include a Cloudwatch event rule (see below) and a Lambda ([check the ./src folder](../c07-serverless02/src/))

Sample CloudWatch Event rule:
```json
{
  "source": [
    "aws.ec2"
  ],
  "detail-type": [
    "EC2 Instance State-change Notification"
  ],
  "detail": {
    "state": [
      "running"
    ]
  }
}
```