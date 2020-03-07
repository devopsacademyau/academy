# S3 Bucket and EC2 Instance (c04-iac01)

In this exercise, you'll need to an EC2 instance and an S3 Bucket. The EC2 instance needs to be accessible through SSH(Port 22) and the EC2 instance needs to have permission to access the S3 bucket being created in this exercise. All resources must be created through Terraform code, with the exception of the EC2 Keypair, that you can use an existing one from your AWS Account.

For your EC2 instance to be able to access the S3 bucket, use an IAM Instance Profile with proper permissions to the bucket.

## Submit a PR with the following files:
- README.md based on the [ANSWER.md file](ANSWER.md) with a link to all files from your answer. The links are already in the ANSWER.md file, but if you have any additional files, include a link to it.
- All your Terraform code used to create the resources listed above
- output.txt with the output of the `terraform plan` command

Your state file can be local, and should not be include it in your PR.

## References
- [Terraform AWS Resources](https://www.terraform.io/docs/providers/aws/index.html)
