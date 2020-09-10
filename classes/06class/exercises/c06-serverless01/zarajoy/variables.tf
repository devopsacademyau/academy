variable "project" {
  type    = string
  default = "c06-serverless01"
}

variable "DB_NAME" {
  type    = string
  default = "DA_Serverless"
} 

variable "lambda" {
  type    = string
  default = "./src/lambda.zip"
}

