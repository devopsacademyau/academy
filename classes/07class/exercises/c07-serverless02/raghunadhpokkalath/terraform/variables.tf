
variable "remove_untagged_instance" {
  type        = string
  description = "Remove Untagged instance Lamda File "
  default     = "lamda_zip/remove_untagged_instance.zip"
}

variable "lamda_runtime" {
  type        = string
  description = "Lamda Runtime"
  default     = "python3.8"
}

variable "project_name" {
  type        = string
  description = "Project Name"
  default     = "da_c06_serverless"
}


variable "sns_topic" {
  type        = string
  description = "SNS TOPIC"
  default     = "EC2InstanceRemoved"
}

variable sns_email {
  type        = string
  description = "SNS Email id"
  default     = "raghunadhp@gmail.com"

}