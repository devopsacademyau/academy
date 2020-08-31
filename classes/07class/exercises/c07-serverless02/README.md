- Add S3 website that calls REST APIs to add new customers
  - Add Cognito Auth to your API gateway
- DynamoDB streams
  - Add message to SQS queue for async processing
    - Lambda consumer send email to subscribers via SNS
- cloudwatch events



"s3 trigger lambda for file conversion"


"if ec2 instance is not tagged with CostCentre, terminate it and notify subscribed admins"

- DDB streams --> lambda --> subscribe email to SNS topic
- lambda for terminating instances

SNS_TOPIC	arn:aws:sns:ap-southeast-2:835575113948:Default_CloudWatch_Alarms_Topic
TAG_NAME	alow

- cloud watch events:
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


{
  "source": [
    "aws.ec2"
  ],
  "detail-type": [
    "AWS API Call via CloudTrail"
  ],
  "detail": {
    "eventSource": [
      "ec2.amazonaws.com"
    ],
    "eventName": [
      "DeleteTags"
    ]
  }
}