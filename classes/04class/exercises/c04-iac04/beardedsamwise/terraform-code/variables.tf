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
  description = "Ubuntu AMI ID for EC2 Instance (or similar)"
  type        = string
}
variable "high_cpu_threshold" {
  description = "Auto scaling high CPU threshold"
  type        = string
}
variable "low_cpu_threshold" {
  description = "Auto scaling low CPU threshold"
  type        = string
}