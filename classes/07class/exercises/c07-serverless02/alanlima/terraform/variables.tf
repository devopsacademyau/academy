
variable "project" {
  type    = string
  default = "da_c07serverless02"
}

variable "region" {
  type    = string
  default = "ap-southeast-2"
}

variable "common_tags" {
  type = map(string)
  default = {
    project     = "da_c07serverless02"
    deployed_by = "terraform"
  }
}
