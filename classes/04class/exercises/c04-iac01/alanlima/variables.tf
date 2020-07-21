variable "region" {
  description = "define the aws region to deploy the resources"
  type        = string
  default     = "ap-southeast-2"
}

variable "availability_zones" {
  description = "define the available zones"
  type        = list
  default = [
    "ap-southeast-2a"
  ]
}

variable "sg_allowed_ip_addresses" {
  description = "define the local ip address which will be allowed to connect to the resources"
  type        = list
}

variable "devops_class" {
  description = "define the class id from devops academy"
  type        = string
}

variable "key_pair_name" {
  description = "key pair name to connect to EC2 instance"
  type        = string
}

variable "bucket_name" {
  description = "define the s3 bucket name"
  type        = string
}