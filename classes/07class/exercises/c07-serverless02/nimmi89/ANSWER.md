# c07-serverless02

## Compliance - Shutdown EC2 instances not tagged

- [_provider.tf](_provider.tf)
- [main.tf](main.tf)
- [docker-compose.yaml](docker-compose.yaml)
- [Makefile](Makefile)

> Solution might contain other files than the ones listed above.

## Command Execution Output

$make deploy
```
terraform init

Initializing the backend...

Initializing provider plugins...


Warning: Interpolation-only expressions are deprecated

  on main.tf line 27, in resource "aws_cloudwatch_event_target" "event_target":
  27:     arn = "${aws_lambda_function.tf_lambda_fn.arn}"

Terraform 0.11 and earlier required all non-constant expressions to be
provided via interpolation syntax, but this pattern is now deprecated. To
silence this warning, remove the "${ sequence from the start and the }"
sequence from the end of this expression, leaving just the inner expression.

Template interpolation syntax is still used to construct strings from
expressions when the template includes multiple interpolation sequences or a
mixture of literal strings and interpolations. This deprecation applies only
to templates that consist entirely of a single interpolation sequence.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
terraform plan -var-file=c07-serverless02.tfvars -out=c07-serverless02.tfplan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_cloudwatch_event_rule.event will be created
  + resource "aws_cloudwatch_event_rule" "event" {
      + arn           = (known after apply)
      + description   = "Terminate tagged instances"
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
      + name          = "c07-serverless02-event"
    }

  # aws_cloudwatch_event_target.event_target will be created
  + resource "aws_cloudwatch_event_target" "event_target" {
      + arn       = (known after apply)
      + id        = (known after apply)
      + rule      = "c07-serverless02-event"
      + target_id = "c07-serverless02-func"
    }

  # aws_iam_role.tf_lambda_role will be created
  + resource "aws_iam_role" "tf_lambda_role" {
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
              + Version   = "2008-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + max_session_duration  = 3600
      + name                  = "c07-serverless02-lambda-role"
      + path                  = "/"
      + tags                  = {
          + "Name" = "c07-serverless02-lambda-role"
        }
      + unique_id             = (known after apply)
    }

  # aws_iam_role_policy.tf_lambda_policy will be created
  + resource "aws_iam_role_policy" "tf_lambda_policy" {
      + id     = (known after apply)
      + name   = "c07-serverless02-lambda-policy"
      + policy = jsonencode(
            {
              + Statement = [
                  + {
                      + Action   = [
                          + "logs:CreateLogGroup",
                          + "logs:CreateLogStream",
                          + "logs:PutLogEvents",
                        ]
                      + Effect   = "Allow"
                      + Resource = "arn:aws:logs:*:*:*"
                      + Sid      = "AllowCloudWatchLog"
                    },
                  + {
                      + Action   = [
                          + "ec2:DescribeInstances",
                        ]
                      + Effect   = "Allow"
                      + Resource = "*"
                      + Sid      = "AllowDescribeEC2Instances"
                    },
                  + {
                      + Action   = [
                          + "ec2:CreateTags",
                          + "ec2:TerminateInstances",
                        ]
                      + Effect   = "Allow"
                      + Resource = "arn:aws:ec2:*:*:instance/*"
                      + Sid      = "AllowEC2Management"
                    },
                  + {
                      + Action   = [
                          + "sns:Publish",
                        ]
                      + Effect   = "Allow"
                      + Resource = "*"
                      + Sid      = "AllowPublishSNSTopic"
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + role   = (known after apply)
    }

  # aws_lambda_function.tf_lambda_fn will be created
  + resource "aws_lambda_function" "tf_lambda_fn" {
      + arn                            = (known after apply)
      + filename                       = "lambda_handler.zip"
      + function_name                  = "c07-serverless02-func"
      + handler                        = "remove_untagged_instances.lambda_handler"
      + id                             = (known after apply)
      + invoke_arn                     = (known after apply)
      + last_modified                  = (known after apply)
      + memory_size                    = 128
      + publish                        = false
      + qualified_arn                  = (known after apply)
      + reserved_concurrent_executions = -1
      + role                           = (known after apply)
      + runtime                        = "python3.8"
      + source_code_hash               = (known after apply)
      + source_code_size               = (known after apply)
      + tags                           = {
          + "Name" = "c07-serverless02-lambda"
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

  # aws_lambda_permission.events_lambda will be created
  + resource "aws_lambda_permission" "events_lambda" {
      + action        = "lambda:InvokeFunction"
      + function_name = "c07-serverless02-func"
      + id            = (known after apply)
      + principal     = "events.amazonaws.com"
      + source_arn    = (known after apply)
      + statement_id  = "AllowExecutionFromCloudWatchEvents"
    }

  # aws_sns_topic.ec2_updates will be created
  + resource "aws_sns_topic" "ec2_updates" {
      + arn    = (known after apply)
      + id     = (known after apply)
      + name   = "c07-serverless02-update-topic"
      + policy = (known after apply)
    }

Plan: 7 to add, 0 to change, 0 to destroy.

Warning: Interpolation-only expressions are deprecated

  on main.tf line 27, in resource "aws_cloudwatch_event_target" "event_target":
  27:     arn = "${aws_lambda_function.tf_lambda_fn.arn}"

Terraform 0.11 and earlier required all non-constant expressions to be
provided via interpolation syntax, but this pattern is now deprecated. To
silence this warning, remove the "${ sequence from the start and the }"
sequence from the end of this expression, leaving just the inner expression.

Template interpolation syntax is still used to construct strings from
expressions when the template includes multiple interpolation sequences or a
mixture of literal strings and interpolations. This deprecation applies only
to templates that consist entirely of a single interpolation sequence.


------------------------------------------------------------------------

This plan was saved to: c07-serverless02.tfplan

To perform exactly these actions, run the following command to apply:
    terraform apply "c07-serverless02.tfplan"

terraform apply c07-serverless02.tfplan
aws_iam_role.tf_lambda_role: Creating...
aws_cloudwatch_event_rule.event: Creating...
aws_sns_topic.ec2_updates: Creating...
aws_cloudwatch_event_rule.event: Creation complete after 1s [id=c07-serverless02-event]
aws_sns_topic.ec2_updates: Creation complete after 1s [id=arn:aws:sns:ap-southeast-2:438549961569:c07-serverless02-update-topic]
aws_iam_role.tf_lambda_role: Creation complete after 3s [id=c07-serverless02-lambda-role]
aws_iam_role_policy.tf_lambda_policy: Creating...
aws_lambda_function.tf_lambda_fn: Creating...
aws_iam_role_policy.tf_lambda_policy: Creation complete after 3s [id=c07-serverless02-lambda-role:c07-serverless02-lambda-policy]
aws_lambda_function.tf_lambda_fn: Still creating... [10s elapsed]
aws_lambda_function.tf_lambda_fn: Creation complete after 14s [id=c07-serverless02-func]
aws_lambda_permission.events_lambda: Creating...
aws_cloudwatch_event_target.event_target: Creating...
aws_lambda_permission.events_lambda: Creation complete after 1s [id=AllowExecutionFromCloudWatchEvents]
aws_cloudwatch_event_target.event_target: Creation complete after 1s [id=c07-serverless02-event-c07-serverless02-func]

Warning: Interpolation-only expressions are deprecated

  on main.tf line 27, in resource "aws_cloudwatch_event_target" "event_target":
  27:     arn = "${aws_lambda_function.tf_lambda_fn.arn}"

Terraform 0.11 and earlier required all non-constant expressions to be
provided via interpolation syntax, but this pattern is now deprecated. To
silence this warning, remove the "${ sequence from the start and the }"
sequence from the end of this expression, leaving just the inner expression.

Template interpolation syntax is still used to construct strings from
expressions when the template includes multiple interpolation sequences or a
mixture of literal strings and interpolations. This deprecation applies only
to templates that consist entirely of a single interpolation sequence.


Apply complete! Resources: 7 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path: ./terraform.tfstate

Outputs:

sns_topic_arn = arn:aws:sns:ap-southeast-2:438549961569:c07-serverless02-update-topic



 
***
Answer for exercise [c07-serverless02](https://github.com/devopsacademyau/academy/blob/b06b4cc323b9349d904562e45551c22974928952/classes/07class/exercises/c07-serverless02/README.md)
