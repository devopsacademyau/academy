
variable "AWS_REGION" {
  type        = string
  description = "AWS region"
  default     = "ap-southeast-2"
}


variable "AMIS" {
  type = map(string)
  description = "AMIS"
  default = {
    ap-southeast-2 = "ami-0ded330691a314693"
  }
}

variable "project_name" {
  type        = string
  description = "Project Name"
  default     = "da-c04-iac01"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default     = "vpc-02ec2836691642ace"
}

variable "subnet" {
  description = "subnet ID"
  type        = string
  default     = "subnet-04709dce111382a62" 
}

/*
variable "subnets" {
  description = "List of subnet IDs to use"
  type        = list(string)
  default     = ["subnet-04709dce111382a62","subnet-00d8a496401ddc8de"]
}
*/

variable "your_home_network_cidr" {
  type        = string
  description = "Your home network CIDR"
  default     = "120.148.174.1/32"
}

