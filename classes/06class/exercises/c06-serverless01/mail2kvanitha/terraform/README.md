## STEPS TO CREATE SERVERLESS ARCHITECTURE:
> 1. TERRAFORM INIT:
  When 'terrafrom init' is run, it will download the terraform Configuration files from HashiCorp, which is required to initiase the working directory.

> 2. TERRAFORM PLAN:
  When 'terraform plan' is run, it will create a plan for creating AWS Services/ Resources in zip archive data format.
  The order in which the terraform will create AWS services/resources is that, independent services first followed by services dependent on these independent services.

     - [API-Gateway](./apigw.tf)
     - [IAM Roles and Policies](./iam.tf)
     - [AWS SSM Parameter](./ssm.tf)
     - [AWS KMS](./kms.tf)
     - [DynamoDB](./dynamodb.tf
     - [Lambda](./lambda.tf)

> 3. TERRAFORM APPLY:
  When 'terraform apply -auto-approve' is run, it will create the AWS resources/services and also create terraform.tfstate file to store the details of the resources created.
  It also creates a terraform.tfstate.backup file, which stores the previous state of AWS resources/services. Both these files are ASCI Text format, which means it can be read.

  NOTE: Once satisforctory, the AWS resources created can be destroyed using 'terraform destroy -auto-approve'
