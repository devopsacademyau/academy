variable "lamda_filename" {
  type=string
  description="Lamda File Name"
  default = "lambda_da.zip"
}

variable "lamda_runtime" {
  type= string
  description="Lamda Runtime"
  default = "python3.8"
}

variable "project_name" {
  type=string
  description="Project Name"
  default = "da_c06_serverless"
}

variable "db_name" {
  type=string
  description="DB Name"
  default=""
}