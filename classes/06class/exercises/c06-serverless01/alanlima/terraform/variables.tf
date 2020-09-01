variable "project" {
  type    = string
  default = "devops_serverless01"
}

variable "region" {
  type    = string
  default = "ap-southeast-2"
}

variable "common_tags" {
  type = map(string)
  default = {
    project     = "devops_serverless01"
    deployed_by = "terraform"
  }
}

variable "db_name" {
  type    = string
  default = "DA_Serverless"
}