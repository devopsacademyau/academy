variable "image_id" {
  type        = string
  description = "AMI Id used to launch EC2"
}

variable "user_data" {
  type        = string
  description = "User_Data for Launch Template"
  default = <<EOF
    #! /bin/bash
    yum update -y
    yum install -y httpd
    echo DevOps exercise c04-iac04!! > index.html
    mv index.html /var/www/html/
    systemctl start httpd
 EOF
}

variable "vpc_security_group_ids" {
    type    = list
}