variable "region" {
  description = "define the aws region to deploy the resources"
  type        = string
  default     = "ap-southeast-2"
}

variable "availability_zones" {
  description = "define the available zones"
  type        = list(string)
  default = [
    "ap-southeast-2a",
    "ap-southeast-2b",
    "ap-southeast-2c"
  ]
}

variable "devops_class" {
  description = "define the class id from devops academy"
  type        = string
}

variable "common_tags" {
  description = "define tags which will be applied for every resource created"
  type        = map(string)
  default     = {}
}