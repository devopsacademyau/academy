# c07-serverless01

## How to Run

1. Edit [**`.env.template`**](.env.template) with your details and rename to `.env`.

```bash
# the e-mail which the report count report will be sent
SNS_REPORT_EMAIL=YOUR_EMAIL_HERE
# a test e-mail for the script to create the customer and simulate a trigger for the lambda functions (photo_handler and report_count) 
CUSTOMER_TEST_EMAIL=TEST_EMAIL_HERE
# the e-mail which the customers will be send FROM
# The e-mail must be added to SES and verified: https://ap-southeast-2.console.aws.amazon.com/ses/home?region=ap-southeast-2#verified-senders-email:
TF_VAR_mail_sender='{name = "YOUR_NAME", email = "YOUR_EMAIL_HERE" }'
# the name of the bucket where the photos will be uploaded
TF_VAR_photos_bucket=PHOTOS_BUCKET_NAME
```

2. Run **`make kick-n-run`** to initialise the terraform providers and deploy the resources. 

> 🛑 **STOP:** A SNS confirmation e-mail will be sent to your inbox, please confirm it before the run the next step.

3. Run **`make kick-test-n-run`** to trigger the following test cases:

| Action              | Expected                                 |
|---------------------|------------------------------------------|
| **Create Customer** | The report count lambda will be called and you should receive an e-mail containing the customers count |
| **List Customers**  | It just list the customers from DynamoDB to the console |
| **Upload Picture**  | The photo_handle lambda will be triggered and the table will be updated with the photo_location and the customer should receive an welcome e-mail |

4. Run **`make clean`** to remove all resources and files created. Those are the actions executed:
   - delete all files in S3 bucket
   - unsubscribe from the SNS
   - run `terraform destroy`
   - delete the zip files for the lambda code

## Uploading profile images and notifying 

- [`src/photos_lambda.py`](src/photos_lambda.py): Lambda for handling S3 event (the lambda DOES NOT need to be Python, you can use other languages)
- [`src/report_count_lambda.py`](src/report_count_lambda.py): Lambda for consuming from DDB stream and calling SNS (the lambda DOES NOT need to be Python, you can use other languages)
- [`docker-compose.yml`](docker-compose.yml): part of 3M 
- [`Makefile`](Makefile): 3 Musketeers implementation
- [`.env.template`](.env.template): environment template file to be used to run the code

- **terraform**:
   - [`terraform/_provider.tf`](terraform/_provider.tf)
   - [`terraform/main.tf`](terraform/main.tf): create the func_customer lambda and the DynamoDB
   - [`terraform/apigw.tf`](terraform/apigw.tf): define the API Gateway endpoint
   - [`terraform/c07-serverless01.tf`](terraform/c07-serverless01.tf): all code for this exercise
      - create lambdas for handling s3 events and notify for new customers
      - create S3 buckets for the photos
   - [`terraform/iam.tf`](terraform/iam.tf): define all IAM profiles for lambdas and APIGW
   - [`terraform/outputs.tf`](terraform/outputs.tf): define the outputs from terraform
   - [`terraform/variables.tf`](terraform/variables.tf): define the input variables for the terraform

> Solution might contain other files than the ones listed above.

## Comments and Challenges faced

- Problems reading the boto3 python docs for DynamoDB. It is not friendly for me. I just need to keep trying or find another resources that explain better what I need to do.
   - I decide to choice python because I am learning so it would be nice to put in practise...

- My SES account was in sandbox so I only can send e-mail to verified accounts. I need to request production upgrade via support ticket.

- Lambda sometimes cannot decrypt the KMS variables. I add `Encrypt` grant to the lambda and add the same KMS for the DB variables for the lambda to use, it looks like that it works. It is so random. Of 10 `clean / deploy tests`, 3 would fail during the initial customer creation and I need to wait a few minutes to create customers.


<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c07-serverless02](https://github.com/devopsacademyau/academy/blob/b06b4cc323b9349d904562e45551c22974928952/classes/07class/exercises/c07-serverless01/README.md)
