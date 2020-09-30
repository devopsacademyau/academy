resource "aws_cloudwatch_event_rule" "this" {
  name        = "ec2instancestate"
  description = "Capture EC2 instance state"

  event_pattern = <<PATTERN
{
  "source": [
    "aws.ec2"
  ],
  "detail-type": [
    "EC2 Instance State-change Notification"
  ],
  "detail" : { "state": [
      "running"
    ]}
}
PATTERN
}


resource "aws_cloudwatch_event_target" "stop_instance" {
  target_id = "stop_istance"
  rule      = aws_cloudwatch_event_rule.this.name
  arn       = aws_lambda_function.remove_untagged_instance.arn
}