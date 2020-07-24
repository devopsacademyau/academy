variable "AMI_ID" {
  type    = string
  default = "ami-088ff0e3bde7b3fdf"
}
variable "EC2_INSTANCE_TYPE" {
  type    = string
  default     = "t2.micro"
}
variable "KEY_NAME" {
  type    = string
  default     = "MyKeyPair"
}
variable "AZ" {
  type    = string
  default = "ap-southeast-2a"
}
variable "FROMPORT" {
  type    = number
  default     = "22"
}
variable "TOPORT" {
  type    = number
  default     = "22"
}
variable "MYIP" {
  type    = list(string)
  default     = ["180.150.38.37/32"]
}
variable "PROTOCOL" {
  type    = string
  default = "tcp"
 
}
variable "BUCKETACL" {
  type    = string
  default = "private"
}
variable "REGION" {
  type    = string
  default = "ap-southeast-2"
}

