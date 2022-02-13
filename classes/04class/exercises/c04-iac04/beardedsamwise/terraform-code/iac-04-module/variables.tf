# Input variable definitions

# Define two subnets in the 10.0.0.0/16 network
variable "subnet1_cidr" {
  description = "CIDR of the first subnet."
  type        = string
}
variable "subnet2_cidr" {
  description = "CIDR of the second subnet."
  type        = string
}

# Define the EC2 AMI - Preferably Ubuntu or similar due to user data scripts
variable "ec2_ami" {
  description = "Ubuntu AMI ID for EC2 Instance (or similar)"
  type        = string
}

# Define high and low CPU watermarks for auto scaling policy
variable "high_cpu_threshold" {
  description = "Auto scaling high CPU threshold"
  type        = string
}
variable "low_cpu_threshold" {
  description = "Auto scaling low CPU threshold"
  type        = string
}