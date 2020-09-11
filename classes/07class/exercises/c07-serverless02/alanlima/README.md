# c07-serverless02

## Compliance - Shutdown EC2 instances not tagged

- [terraform/_provider.tf](terraform/_provider.tf)
- [terraform/main.tf](terraform/main.tf)
- [terraform/outputs.tf](terraform/outputs.tf)
- [terraform/variables.tf](terraform/variables.tf)
- [scripts/sns-subscriber.sh](scripts/sns-subscriber.sh)
- [scripts/sns-unsubscriber.sh](scripts/sns-unsubscriber.sh)
- [.env.tpl](.env.tpl)
- [docker-compose.yml](docker-compose.yml)
- [Makefile](Makefile)

## Getting Started

1. Rename [`.env.tpl`](.env.tpl) to `.env` and set the values for all variables

2. Run `make kick-n-run` to initialise and deploy all resources.

    a. AWS will send a confirmation e-mail to verify the subscription for the SNS topic.

## List of `make` Commands:

- **`deploy`**: deploy **(auto-approve)** terraform resources.

- **`apply`**: run `terraform apply` without approve it. You will be prompted to confirm the deployment.

- **`clean`**: tidy up all resources/files created.

- **`run-instance-without-tag`**: it will create a new EC2 instance without `CostCenter` tag. The lambda should terminate this instance after a few seconds.

- **`run-instance-with-tag`**: same as previous but it will add `CostCenter` tag so this instance should NOT be terminated.

- **`list-instances`**: list instances created by previous commands. It filters instances with tag `untagged-tracker` so if you created an instance from console or via AWS CLI, it might not be showing here.

- **`terminate-instances`**: teminate running EC2 instances created.

- **`sns-topic-subscribe`**: create a sns topic subscription using the e-mail from variable `SNS_TARGET_EMAIL`. You will receive an e-mail to confirm. _It called from `make deploy` command_

- **`sns-topic-unsubscribe`**: remove the SNS topic subscription. _It called from `make clean` command_

## Command Execution Output

### Initialising

```bash
$ make kick-n-run

Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/aws versions matching "~> 3.0"...
- Finding latest version of hashicorp/archive...
- Installing hashicorp/archive v1.3.0...
- Installed hashicorp/archive v1.3.0 (signed by HashiCorp)
- Installing hashicorp/aws v3.5.0...
- Installed hashicorp/aws v3.5.0 (signed by HashiCorp)

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, we recommend adding version constraints in a required_providers block
in your configuration, with the constraint strings suggested below.

* hashicorp/archive: version = "~> 1.3.0"

Terraform has been successfully initialized!
make[1]: Entering directory '/home/alima/projects/github/devops-academy/classes/07class/exercises/c07-serverless02/alanlima'
data.archive_file.remove_untagged_lambda: Refreshing state...
aws_iam_policy.lambda: Creating...
aws_iam_role.lambda: Creating...
aws_sns_topic.untagged_instance_removed: Creating...
aws_cloudwatch_event_rule.untagged_instances: Creating...
aws_cloudwatch_event_rule.untagged_instances: Creation complete after 1s [id=da_c07serverless02-capture-untagged-instances]
aws_sns_topic.untagged_instance_removed: Creation complete after 1s [id=arn:aws:sns:ap-southeast-2:097922957316:da_c07serverless02-untagged_instance_removed]
aws_iam_role.lambda: Creation complete after 3s [id=da_c07serverless02_lambda_role]
aws_lambda_function.remove_untagged: Creating...
aws_iam_policy.lambda: Creation complete after 4s [id=arn:aws:iam::097922957316:policy/da_c07serverless02_lambda_policy]
aws_iam_role_policy_attachment.lambda: Creating...
aws_iam_role_policy_attachment.lambda: Creation complete after 2s [id=da_c07serverless02_lambda_role-20200910233812338800000001]
aws_lambda_function.remove_untagged: Still creating... [10s elapsed]
aws_lambda_function.remove_untagged: Still creating... [20s elapsed]
aws_lambda_function.remove_untagged: Creation complete after 22s [id=func_remove_untagged_ec2]
aws_cloudwatch_log_group.func_remove_untagged: Creating...
aws_lambda_permission.allow_cloudwatch: Creating...
aws_cloudwatch_event_target.untagged_instances: Creating...
aws_lambda_permission.allow_cloudwatch: Creation complete after 0s [id=AllowExecutionFromCloudWatch]
aws_cloudwatch_event_target.untagged_instances: Creation complete after 0s [id=da_c07serverless02-capture-untagged-instances-terraform-20200910233831823300000002]
aws_cloudwatch_log_group.func_remove_untagged: Creation complete after 0s [id=/aws/lambda/func_remove_untagged_ec2]

Apply complete! Resources: 9 added, 0 changed, 0 destroyed.

Outputs:

untagged_instance_removed_topic_arn = arn:aws:sns:ap-southeast-2:097922957316:da_c07serverless02-untagged_instance_removed
make[1]: Leaving directory '/home/alima/projects/github/devops-academy/classes/07class/exercises/c07-serverless02/alanlima'
Creating subscription for topic arn:aws:sns:ap-southeast-2:097922957316:da_c07serverless02-untagged_instance_removed
SubscriptionArn: pending confirmation
Subscription created...
Please check your e-mail to confirm the subscription
```

### Running an instance **without** `CostCentre` tag

```bash
$ make run-instance-without-tag
Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: f7d4c40b-a5e1-489f-86c7-343cc4e5064c
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-04025138b31328de6
  InstanceId: i-04aab589e26cec71f
  InstanceType: t2.micro
  LaunchTime: '2020-09-10T23:41:10+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-09-10T23:41:10+00:00'
      AttachmentId: eni-attach-097f739be5154a7e2
      DeleteOnTermination: true
      DeviceIndex: 0
      Status: attaching
    Description: ''
    Groups:
    - GroupId: sg-df6655aa
      GroupName: default
    InterfaceType: interface
    Ipv6Addresses: []
    MacAddress: 06:18:f1:37:47:c8
    NetworkInterfaceId: eni-0956ab24ae274e09d
    OwnerId: '097922957316'
    PrivateDnsName: ip-172-31-39-4.ap-southeast-2.compute.internal
    PrivateIpAddress: 172.31.39.4
    PrivateIpAddresses:
    - Primary: true
      PrivateDnsName: ip-172-31-39-4.ap-southeast-2.compute.internal
      PrivateIpAddress: 172.31.39.4
    SourceDestCheck: true
    Status: in-use
    SubnetId: subnet-957b9bdd
    VpcId: vpc-fc020c9b
  Placement:
    AvailabilityZone: ap-southeast-2a
    GroupName: ''
    Tenancy: default
  PrivateDnsName: ip-172-31-39-4.ap-southeast-2.compute.internal
  PrivateIpAddress: 172.31.39.4
  ProductCodes: []
  PublicDnsName: ''
  RootDeviceName: /dev/xvda
  RootDeviceType: ebs
  SecurityGroups:
  - GroupId: sg-df6655aa
    GroupName: default
  SourceDestCheck: true
  State:
    Code: 0
    Name: pending
  StateReason:
    Code: pending
    Message: pending
  StateTransitionReason: ''
  SubnetId: subnet-957b9bdd
  Tags:
  - Key: untagged-tracker
    Value: 'true'
  VirtualizationType: hvm
  VpcId: vpc-fc020c9b
OwnerId: '097922957316'
ReservationId: r-09d1f1a377bbbc575
```

### Running an instance **with** `CostCentre` tag

```bash
$ make run-instance-with-tag
Groups: []
Instances:
- AmiLaunchIndex: 0
  Architecture: x86_64
  BlockDeviceMappings: []
  CapacityReservationSpecification:
    CapacityReservationPreference: open
  ClientToken: f9dc9292-8ad3-4a02-a4df-d06ddeff62b7
  CpuOptions:
    CoreCount: 1
    ThreadsPerCore: 1
  EbsOptimized: false
  Hypervisor: xen
  ImageId: ami-04025138b31328de6
  InstanceId: i-0d42e836480e38abd
  InstanceType: t2.micro
  LaunchTime: '2020-09-10T23:40:39+00:00'
  MetadataOptions:
    HttpEndpoint: enabled
    HttpPutResponseHopLimit: 1
    HttpTokens: optional
    State: pending
  Monitoring:
    State: disabled
  NetworkInterfaces:
  - Attachment:
      AttachTime: '2020-09-10T23:40:39+00:00'
      AttachmentId: eni-attach-0615cf08955edd3d4
      DeleteOnTermination: true
      DeviceIndex: 0
      Status: attaching
    Description: ''
    Groups:
    - GroupId: sg-df6655aa
      GroupName: default
    InterfaceType: interface
    Ipv6Addresses: []
    MacAddress: 06:74:4e:e2:80:44
    NetworkInterfaceId: eni-0249dcb2ef33f1610
    OwnerId: '097922957316'
    PrivateDnsName: ip-172-31-32-208.ap-southeast-2.compute.internal
    PrivateIpAddress: 172.31.32.208
    PrivateIpAddresses:
    - Primary: true
      PrivateDnsName: ip-172-31-32-208.ap-southeast-2.compute.internal
      PrivateIpAddress: 172.31.32.208
    SourceDestCheck: true
    Status: in-use
    SubnetId: subnet-957b9bdd
    VpcId: vpc-fc020c9b
  Placement:
    AvailabilityZone: ap-southeast-2a
    GroupName: ''
    Tenancy: default
  PrivateDnsName: ip-172-31-32-208.ap-southeast-2.compute.internal
  PrivateIpAddress: 172.31.32.208
  ProductCodes: []
  PublicDnsName: ''
  RootDeviceName: /dev/xvda
  RootDeviceType: ebs
  SecurityGroups:
  - GroupId: sg-df6655aa
    GroupName: default
  SourceDestCheck: true
  State:
    Code: 0
    Name: pending
  StateReason:
    Code: pending
    Message: pending
  StateTransitionReason: ''
  SubnetId: subnet-957b9bdd
  Tags:
  - Key: CostCentre
    Value: dev
  - Key: untagged-tracker
    Value: 'true'
  VirtualizationType: hvm
  VpcId: vpc-fc020c9b
OwnerId: '097922957316'
ReservationId: r-0d3139696da4a2240
```

```bash
$ make list-instances
- Instance: i-0d42e836480e38abd
  State: running
  Tags:
  - Key: CostCentre
    Value: dev
  - Key: untagged-tracker
    Value: 'true'
- Instance: i-04aab589e26cec71f
  State: terminated
  Tags:
  - Key: Name
    Value: INVALID_TAGS
  - Key: untagged-tracker
    Value: 'true'
```

### Listing created instances

```bash
$ make list-instances
- Instance: i-04a4148cfdfa9826d
  State: running
  Tags:
  - Key: untagged-tracker
    Value: 'true'
  - Key: CostCentre
    Value: dev
- Instance: i-0d42e836480e38abd
  State: running
  Tags:
  - Key: CostCentre
    Value: dev
  - Key: untagged-tracker
    Value: 'true'
- Instance: i-04aab589e26cec71f
  State: terminated
  Tags:
  - Key: Name
    Value: INVALID_TAGS
  - Key: untagged-tracker
    Value: 'true'
```


***
Answer for exercise [c07-serverless02](https://github.com/devopsacademyau/academy/blob/b06b4cc323b9349d904562e45551c22974928952/classes/07class/exercises/c07-serverless02/README.md)
