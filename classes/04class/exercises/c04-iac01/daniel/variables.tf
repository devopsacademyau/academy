variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "image_id" {
  default = "ami-088ff0e3bde7b3fdf"
}

variable "key_pair" {
  default = "danibook"
}

variable "subnet_id" {
  type    = string
  default = "subnet-091fd751e703a303b"
}
variable "bucket_name" {
  default = "boomera-c04-iac01.com"
}

variable "vpc_id" {
  type    = string
  default = "vpc-0c2c93451cdd28192"
}

variable "igw_id" {
  type    = string
  default = "igw-0047722be38dccb86"
}

variable "myip" {
  type        = string
  description = "Home IP"
  default     = "180.150.58.136/32"
}
##
 