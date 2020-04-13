variable "image_id" {
  type        = string
  description = "AMI Id"
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

variable "subnets_id" {
  type        = list
  description = "Subnets Id"
}

variable "scaling_up" {
  type        = number
  description = "Auto Scaling Group - Policies Increase"
}

variable "scaling_down" {
  type        = number
  description = "Auto Scaling Group - Policies Decrease"
}