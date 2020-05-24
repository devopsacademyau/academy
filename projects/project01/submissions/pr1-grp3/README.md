DevOps Academy - Project 1 - Group 3
==================

# Application Migration: from On-Premise to The Cloud

The objective of this project is to migrate a single server and deployments from a FTP to AWS services.
- We have used [Terraform](https://www.terraform.io/) to create to create the resources in AWS.
- [Makefile](Makefile) to automate the scripts.
- [Docker](Dockerfile) to create the Wordpress image.


<b>Team:</b>
- Anderson
- Carine
- Heaven

## Architecture Diagram
Diagram of the proposed AWS Architecture:

![Diagram](images/PR1-grp3(5).png)


### Prerequisites
The ecr repository need to be created in you aws account before you push the image to the ecr.
Run below command to create a ecr repository if you don't have the repository created.
```
make prep_ecr
```

You also need to have a domain registered under AWS Route53 and configure it in var.domainname
You need to configure the variable var.certificate_arn with your aws certificate arn to enable HTTPS.
Here you'll find the file with variables to update [main.tfvars](./terraform/main.tfvars)

### How to Run
Run below to push wordpress image to ECR from the Dockerfile. 
```
make push_image
```

Run below to deploy the whole stack that will run ec2 instances from the image that you pushed to the ecr
```
make apply_aws
```

Destroy everything! Also de DB, be careful!
```
make destroy_aws
```
