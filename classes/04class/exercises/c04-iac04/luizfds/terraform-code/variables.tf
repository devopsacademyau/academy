# variable "public_key_path" {
#   description = <<DESCRIPTION
# Path to the SSH public key to be used for authentication.
# Ensure this keypair is added to your local SSH agent so provisioners can
# connect.
# Example: ~/.ssh/terraform.pub
# DESCRIPTION
#   type        = string
# }

# variable "key_name" {
#   description = "Desired name of AWS key pair"
#   type        = string
# }

variable "aws_region" {
  description = "AWS region to launch servers."
  type        = string
}

variable "aws_amis" {
  description = "Amazon Linux 2 AMI"
  type        = object({ ap-southeast-2 = string })
}

variable "vpc_id" {
  description = "the vpc id"
  type        = string
}

variable "subnets" {
  description = "Subnets"
  type        = list(string)
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  type        = string
}
variable "min_size" {
  description = "The minimum number of EC2 Instances in the ASG"
  type        = number
}
variable "max_size" {
  description = "The maximum number of EC2 Instances in the ASG"
  type        = number
}
