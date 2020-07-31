# Define variables
variable "instance_type" {
  type        = string
  description = "ec2 instance type"
  default     = "t2.nano"
}

variable "ami_id" {
  type        = string
  description = "ec2 instance ami"
  default     = "ami-0a58e22c727337c51"
}

variable "vpc_id" {
  type        = string
  description = "Devops academy VPC"
  default     = "vpc-076a05ec0f3be4895"
}

variable "subnet_id" {
  type        = string
  description = "Devops academy Subnet"
  default     = "subnet-0ff0ad4440d0df64e"
}

variable "home_ipaddress" {
  type        = string
  description = "Home ip to restrict ssh access"
  default     = "58.96.95.89/32"
}


