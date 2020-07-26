variable "aws_ami" {
    type = string
    description = "AWS AMI ID for the launch configuration"
}

variable "vpc_id" {
    type = string
    description = "VPC ID for deployments"
}

variable "private_subnet_ids" {
    type = list
    description = "Private subnet IDs for the ASG to provision instances"
}

variable "public_subnet_ids" {
    type = list
    description = "Public subnet IDs for ALB"
}

## Variables with default values
variable "key_pair" {
    type = string
    description = "Keys to be used for SSH connectivity"
    default = "PubHostKeyPair"
}

variable "instance_type" {
    type = string
    description = "AWS EC2 instance type"
    default = "t2.micro"
}

variable "ssh_allowed_ip" {
  type        = string
  description = "SSH is allowed only for this IP"
  default     = "121.200.5.90/32"
}

variable "asg_min" {
    type = int
    description = "ASG minimum number of hosts"
    default = 1
}

variable "asg_max" {
    type = int
    description = "ASG maximum number of hosts"
    default = 2
}