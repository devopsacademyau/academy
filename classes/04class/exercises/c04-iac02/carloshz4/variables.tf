variable "aws_ip_cidr_range" {
  type        = "string"
  default     = "10.0.0.0/16"
  description = "IP CIDR range for AWS VPC"
}

variable "subnet-name" {
  type = "map"
  default = {
    subnet1 = "devopsacademy-PublicSubnet1-iac"
    subnet2 = "devopsacademy-PublicSubnet2-iac"
    subnet3 = "devopsacademy-PrivateSubnet1-iac"
    subnet4 = "devopsacademy-PrivateSubnet2-iac"
  }
}

variable "subnet-cidr" {
  type = "map"
  default = {
    subnet1 = "10.0.1.0/24"
    subnet2 = "10.0.2.0/24"
    subnet3 = "10.0.3.0/24"
    subnet4 = "10.0.4.0/24"
  }
}

