# c07-serverless02

## Compliance - Shutdown EC2 instances not tagged

- [_provider.tf](_provider.tf)
- [main.tf](main.tf)
- [iam.tf](iam.tf)
- [sns.tf](sns.tf)
- [snssubscribe](Shell script to subscribe sns)
- [lamda_remove_untagged.tf](lamda terraform)
- [docker-compose.yaml](docker-compose.yaml)
- [Makefile](Makefile)

> Solution might contain other files than the ones listed above.

## Command Execution Output
``make deploy``
docker-compose run --rm shell make _buildzip
mkdir terraform/lamda_zip;cd src;zip ../terraform/lamda_zip/remove_untagged_instance.zip remove_untagged_instance.py;
mkdir: cannot create directory 'terraform/lamda_zip': File exists
updating: remove_untagged_instance.py (deflated 59%)
docker-compose run --rm shell make _plan
cd terraform;terraform init;terraform plan  -out serverless_07_02

Initializing the backend...

Initializing provider plugins...

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_cloudwatch_event_rule.this will be created
  + resource "aws_cloudwatch_event_rule" "this" {
      + arn           = (known after apply)
      + description   = "Capture EC2 instance state"
      + event_pattern = jsonencode(
            {
              + detail      = {
                  + state = [
                      + "running",
                    ]
                }
              + detail-type = [
                  + "EC2 Instance State-change Notification",
                ]
              + source      = [
                  + "aws.ec2",
                ]
            }
        )
      + id            = (known after apply)
      + is_enabled    = true
      + name          = "ec2instancestate"
    }

  # aws_cloudwatch_event_target.stop_instance will be created
  + resource "aws_cloudwatch_event_target" "stop_instance" {
      + arn       = (known after apply)
      + id        = (known after apply)
      + rule      = "ec2instancestate"
      + target_id = "stop_istance"
    }

  # aws_cloudwatch_log_group.remove_untagged_instance will be created
  + resource "aws_cloudwatch_log_group" "remove_untagged_instance" {
      + arn               = (known after apply)
      + id                = (known after apply)
      + name              = "/aws/lambda/remove_untagged_instance"
      + retention_in_days = 1
    }

  # aws_iam_role.iam_for_lambda will be created
  + resource "aws_iam_role" "iam_for_lambda" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "lambda.amazonaws.com"
                        }
                      + Sid       = ""
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + max_session_duration  = 3600
      + name                  = "iam_for_lambda"
      + path                  = "/"
      + unique_id             = (known after apply)
    }

  # aws_iam_role_policy.cloudwatch will be created
  + resource "aws_iam_role_policy" "cloudwatch" {
      + id     = (known after apply)
      + name   = "lambda_cloudwatch_iam"
      + policy = jsonencode(
            {
              + Statement = [
                  + {
                      + Action   = [
                          + "logs:CreateLogStream",
                          + "logs:PutLogEvents",
                        ]
                      + Effect   = "Allow"
                      + Resource = "arn:aws:logs:*:*:*"
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + role   = (known after apply)
    }

  # aws_iam_role_policy.ec2 will be created
  + resource "aws_iam_role_policy" "ec2" {
      + id     = (known after apply)
      + name   = "lambda_ec2_iam"
      + policy = jsonencode(
            {
              + Statement = [
                  + {
                      + Action   = [
                          + "ec2:DescribeInstances",
                          + "ec2:TerminateInstances",
                          + "ec2:CreateTags",
                        ]
                      + Effect   = "Allow"
                      + Resource = "*"
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + role   = (known after apply)
    }

  # aws_iam_role_policy.sns will be created
  + resource "aws_iam_role_policy" "sns" {
      + id     = (known after apply)
      + name   = "lambda_sns_iam"
      + policy = (known after apply)
      + role   = (known after apply)
    }

  # aws_lambda_function.remove_untagged_instance will be created
  + resource "aws_lambda_function" "remove_untagged_instance" {
      + arn                            = (known after apply)
      + filename                       = "lamda_zip/remove_untagged_instance.zip"
      + function_name                  = "remove_untagged_instance"
      + handler                        = "remove_untagged_instance.lambda_handler"
      + id                             = (known after apply)
      + invoke_arn                     = (known after apply)
      + last_modified                  = (known after apply)
      + memory_size                    = 128
      + publish                        = false
      + qualified_arn                  = (known after apply)
      + reserved_concurrent_executions = -1
      + role                           = (known after apply)
      + runtime                        = "python3.8"
      + source_code_hash               = "hOXRvXTuNHXFPdJrQIkeKZJEY5fv8tw6c3Wz9QAVLrE="
      + source_code_size               = (known after apply)
      + tags                           = {
          + "Name" = "da_c06_serverless-remove_untagged_instance-lamda"
        }
      + timeout                        = 3
      + version                        = (known after apply)

      + environment {
          + variables = (known after apply)
        }

      + tracing_config {
          + mode = (known after apply)
        }
    }

  # aws_lambda_permission.cloudwatchevent will be created
  + resource "aws_lambda_permission" "cloudwatchevent" {
      + action        = "lambda:InvokeFunction"
      + function_name = "remove_untagged_instance"
      + id            = (known after apply)
      + principal     = "events.amazonaws.com"
      + source_arn    = (known after apply)
      + statement_id  = "AllowExecutionFromCloudWatch"
    }

  # aws_ses_email_identity.from will be created
  + resource "aws_ses_email_identity" "from" {
      + arn   = (known after apply)
      + email = "raghunadhpokkalath@gmail.com"
      + id    = (known after apply)
    }

  # aws_ses_email_identity.to will be created
  + resource "aws_ses_email_identity" "to" {
      + arn   = (known after apply)
      + email = "raghunadhp@gmail.com"
      + id    = (known after apply)
    }

  # aws_sns_topic.this will be created
  + resource "aws_sns_topic" "this" {
      + arn    = (known after apply)
      + id     = (known after apply)
      + name   = "EC2InstanceRemoved"
      + policy = (known after apply)
    }

Plan: 12 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

This plan was saved to: serverless_07_02

To perform exactly these actions, run the following command to apply:
    terraform apply "serverless_07_02"

docker-compose run --rm shell make _deploy
cd terraform; terraform apply serverless_07_02;
aws_iam_role.iam_for_lambda: Creating...
aws_cloudwatch_event_rule.this: Creating...
aws_ses_email_identity.to: Creating...
aws_sns_topic.this: Creating...
aws_ses_email_identity.from: Creating...
aws_ses_email_identity.from: Creation complete after 1s [id=raghunadhpokkalath@gmail.com]
aws_cloudwatch_event_rule.this: Creation complete after 1s [id=ec2instancestate]
aws_ses_email_identity.to: Creation complete after 1s [id=raghunadhp@gmail.com]
aws_sns_topic.this: Provisioning with 'local-exec'...
aws_sns_topic.this (local-exec): Executing: ["/bin/sh" "-c" "sh scripts/snssubscribe.sh"]
aws_sns_topic.this (local-exec): raghunadhp@gmail.com
aws_sns_topic.this (local-exec): {
aws_sns_topic.this (local-exec):     "SubscriptionArn": "pending confirmation"
aws_sns_topic.this (local-exec): }
aws_sns_topic.this: Creation complete after 2s [id=arn:aws:sns:ap-southeast-2:230681605246:EC2InstanceRemoved]
aws_iam_role.iam_for_lambda: Creation complete after 3s [id=iam_for_lambda]
aws_iam_role_policy.cloudwatch: Creating...
aws_iam_role_policy.ec2: Creating...
aws_iam_role_policy.sns: Creating...
aws_lambda_function.remove_untagged_instance: Creating...
aws_iam_role_policy.cloudwatch: Creation complete after 2s [id=iam_for_lambda:lambda_cloudwatch_iam]
aws_iam_role_policy.sns: Creation complete after 2s [id=iam_for_lambda:lambda_sns_iam]
aws_iam_role_policy.ec2: Creation complete after 2s [id=iam_for_lambda:lambda_ec2_iam]
aws_lambda_function.remove_untagged_instance: Still creating... [10s elapsed]
aws_lambda_function.remove_untagged_instance: Still creating... [20s elapsed]
aws_lambda_function.remove_untagged_instance: Creation complete after 22s [id=remove_untagged_instance]
aws_lambda_permission.cloudwatchevent: Creating...
aws_cloudwatch_log_group.remove_untagged_instance: Creating...
aws_cloudwatch_event_target.stop_instance: Creating...
aws_lambda_permission.cloudwatchevent: Creation complete after 0s [id=AllowExecutionFromCloudWatch]
aws_cloudwatch_event_target.stop_instance: Creation complete after 0s [id=ec2instancestate-stop_istance]
aws_cloudwatch_log_group.remove_untagged_instance: Creation complete after 1s [id=/aws/lambda/remove_untagged_instance]

Apply complete! Resources: 12 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path: terraform.tfstate


``make startec2``
This creates an ec2 instance without tag and cloud watch event will remove this.Below mail from AWS received


AWS Notifications <no-reply@sns.amazonaws.com>
10:38 PM (10 minutes ago)
to me

Instances terminated: ["i-0dae4f49f787dd8bb"]


``make start_ec2_with_tag``

This create an ec2 with costcenter tag and it will not be removed as part of cloudwatch event rule


<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c07-serverless02](https://github.com/devopsacademyau/academy/blob/b06b4cc323b9349d904562e45551c22974928952/classes/07class/exercises/c07-serverless02/README.md)
