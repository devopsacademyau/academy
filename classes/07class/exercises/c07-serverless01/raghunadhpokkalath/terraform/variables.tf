variable "customer_lamda" {
  type        = string
  description = "Customer Lamda Zip File "
  default     = "lamda_zip/customer_handler.zip"
}

variable "photo_lamda" {
  type        = string
  description = "Photo Lamda Zip File "
  default     = "lamda_zip/photo_handler.zip"
}

variable "report_lamda" {
  type        = string
  description = "Report Photos Count Lamda Zip File "
  default     = "lamda_zip/report_photos_count.zip"
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

variable "db_name" {
  type        = string
  description = "DB Name"
  default     = ""
}

variable "sns_topic" {
  type        = string
  description = "SNS TOPIC"
  default     = "ReportCount"
}

variable sns_email {
  type        = string
  description = "SNS Email id"
  default     = "raghunadhp@gmail.com"

}