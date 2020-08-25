# c07-serverless02

## Uploading profile images and notifying 

- [terraform/_provider.tf](terraform/_provider.tf)
- [terraform/main.tf]: terraform code for creating dynao db,kms and ssm parameter
- [terraform/apigw.tf]: terraform code for creating api gateway resources
- [terraform/iam.tf]: terraform code for iam resources
- [terraform/lamda_customer.tf]: terraform code creating customer lamda
- [terraform/lamda_photo.tf]: terraform code creating photo lamda to send SES events
- [terraform/lamda_report_count.tf]: terraform code to trigger SNS event with  photo count 
- [terraform/s3.tf]: terraform code for creating s3 bucket and registering event on upload
- [terraform/ses_sns.tf]: terraform code for enabling ses and SNS
- [terraform/scripts/snssubscribe.sh]: terraform code to setup SNS email using AWS as teraform doesn;t support it 
- [`Makefile`](Makefile): 3 Musketeers implementation
- [docker-compose.yaml](docker-compose.yaml): part of 3M implementation
- [output.md] :Terraform output file

> Solution might contain other files than the ones listed above.

## Comments and Challenges faced

> List here any challenges faced and how you solved them


<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c07-serverless02](https://github.com/devopsacademyau/academy/blob/b06b4cc323b9349d904562e45551c22974928952/classes/07class/exercises/c07-serverless01/README.md)