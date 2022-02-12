# Input variable definitions
variable "subnet1_cidr" {
  description = "CIDR of the first subnet."
  type        = string
}
variable "subnet2_cidr" {
  description = "CIDR of the second subnet."
  type        = string
}
variable "ec2_ami" {
  description = "Ubuntu AMI ID for the EC2 instance"
  type        = string
}