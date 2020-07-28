terraform {
  backend "s3" {
    bucket = "terraform-fr"
    key    = "da/c04-iac02"
    region = "ap-southeast-2"
  }
}