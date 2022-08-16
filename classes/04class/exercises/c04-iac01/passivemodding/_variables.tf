# region used to configure aws provider
variable "region" {
  default = "ap-southeast-2"
}

# standard tag for all created resources for better tracking
variable "tag" {
  default = "lj_setup_c04_iac01"
}

# key used for ec2 access
variable "key" {
  default = "lj_c04_iac01"
}

# s3 bucket name
variable "s3bucketname" {
  default = "lj-s3-c04-iac01"
}