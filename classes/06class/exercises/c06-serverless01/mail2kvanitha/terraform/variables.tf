variable "lamda_filename" {
   type=string
   description="Lamda File Name"
   default = "lambda.zip"
 }

 variable "lamda_runtime" {
   type= string
   description="Lamda Runtime"
   default = "python3.8"
 }

 variable "project_name" {
   type=string
   description="Project Name"
   default = "serverless_06"
 }

 variable "db_name" {
   type=string
   description="DB Name"
   default=""
 }
