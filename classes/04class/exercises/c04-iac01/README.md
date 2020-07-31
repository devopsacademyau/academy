# S3 Bucket and EC2 Instance (c04-iac01)

In this exercise, you'll need to create an EC2 instance and a S3 Bucket. The EC2 instance needs to be accessible through SSH (Port 22) and the EC2 instance needs to have permission to access the S3 bucket being created in this exercise. 

All resources must be created and deployed through **Terraform**, with the exception of the EC2 Keypair, that you can use an existing one from your AWS Account. 

For your EC2 instance to be able to access the S3 bucket, use an **IAM Instance Profile** with proper permissions to the bucket.

## Submit a PR with the following files:
- README.md based on the [ANSWER.md file](ANSWER.md) with a link to the following files from your answer:
    - _backend.tf
        - with the backend configuration
    - _provider.tf
        - with the provider configuration
    - ec2.tf
        - with all your ec2 related resources
    - iam.tf
        - with all your iam related resources
    - s3.tf
        - with all your s3 related resources
    - security-group.tf
        - with all your Security Group related resources
    - output.txt 
        - with the output of the `terraform plan` command

Your state file can be local, and should not be include it in your PR.

## References
- [Terraform AWS Resources](https://www.terraform.io/docs/providers/aws/index.html)
