variable "vpc" {
  type = map
}

variable "public_subnet_ids" {
  type = list
}

variable "ami_id" {
  type = string
}

variable "tags" {
  type = map
}

variable "scales" {
  type = map
}

variable user_data {
  type = string
  description = "User Data for EC2"
  default = <<EOF
    #! /bin/bash
    yum update -y
    yum install -y httpd
    curl 169.254.169.254/latest/meta-data/hostname > index.html
    mv index.html /var/www/html/
    service httpd start
  EOF
}