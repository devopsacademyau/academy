variable "aws_ami" {
  type        = string
  description = "AWS AMI ID for the launch configuration"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for deployments"
}

variable "public_subnet_ids" {
  type        = list(string)
}

variable "scale_up_by" {
  type = number
}

variable "scale_down_by" {
  type = number
  description = "This should be a negative value"
}

## Variables with default values
variable "key_pair" {
  type        = string
  description = "Keys to be used for SSH connectivity"
  default     = "PubHostKeyPair"
}

variable "instance_type" {
  type        = string
  description = "AWS EC2 instance type"
  default     = "t2.micro"
}

variable "ssh_allowed_ip" {
  type        = string
  description = "SSH is allowed only for this IP"
  default     = "121.200.5.90/32"
}

variable "asg_min" {
  type        = number
  description = "ASG minimum number of hosts"
  default     = 1
}

variable "asg_max" {
  type        = number
  description = "ASG maximum number of hosts"
  default     = 3
}