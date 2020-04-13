module "website_s3_bucket" {
  source = "./iac-04-module"

  bucket_name = "luizfds-devopsacademy"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}