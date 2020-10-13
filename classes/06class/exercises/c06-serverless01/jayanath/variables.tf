variable "db_name_param" {
  type        = string
  description = "Parameter name of the DynamoDB"
  default     = "DB_NAME"
}

variable "db_name" {
  type        = string
  description = "Name of the DynamoDB table"
  default     = "DA_Serverless"
}
