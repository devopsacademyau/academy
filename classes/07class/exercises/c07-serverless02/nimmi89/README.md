# Compliance - Shutdown EC2 instances not tagged

Requirement:

- If an EC2 instance is running and is not tagged with `CostCentre` (any value), terminate it and notify subscribed admins via a SNS topic that has only your email subscribed.

- Export the env variables as given in .env

  ```
  export AWS_ACCESS_KEY=yourvalue 
  export AWS_SECRET_ACCESS_KEY=yourvalue
  ```

- Create all the terraform resources using below make target

  ```
  make deploy 
  Note: Runs terraform init, plan , apply[You can also run the targets individually as make init,make plan] and produces the following output 
  Outputs: sns_topic_arn = arn:aws:sns:ap-southeast-2:438549961569:c07-serverless02-update-topic
  ```

- Subscribe to the SNS topic.

  ```
  The topic arn is returned by terraform outputs. Export the variable as below :
  export SNS_TOPIC=terraform-sns-output
  Then run the make target to subscribe to the topic [endpoint is your email]. You need to confirm the subscription through your email inbox.
  make sns-subscribe
  ```

- Run the ec2 instances with and without tag name to see if everything is working. Export tag name as below and launch instance.

  ```
  export TAG_NAME=CostCentre 
  make ec2-run
  ```

- Check if your correctly tagged instances are running using target:

  ```
  make ec2-check
  ```

  The wrongly tagged instances are terminated and given "INVALID_TAGS" and you will receive an email stating that.

- Clean your environment[ Destroy all the resources ] using below target

  ```
  make clean
  ```
