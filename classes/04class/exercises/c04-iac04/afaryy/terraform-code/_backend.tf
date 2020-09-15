
terraform {
  backend "s3" {
    # enable remote state storage with S3
    bucket         = "terraform-state-backend-bucket-da-c04"
    key            = "c04-iac04/terraform.tfstate"
    region         = "ap-southeast-2"

    # use DynamoDB for locking with Terraform
    dynamodb_table = "terraform-locks-da-c04" # create a DynamoDB table that has a primary key called LockID
    encrypt        = true
  }
}

/*
terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}
*/