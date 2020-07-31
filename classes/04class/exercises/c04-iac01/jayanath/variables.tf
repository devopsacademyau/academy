variable "aws_profile" {
  type    = string
  default = "devopsadmin"
}

variable "bucket_name" {
  type    = string
  default = "jay-doa-c04-iac01-9930.com"
}

variable "key_pair" {
  type        = string
  description = "Keys for the EC2 SSH access"
  default     = "PubHostKeyPair"
}

variable "vpc_id" {
  type    = string
  default = "vpc-007774900b7f4c596"
}

variable "public_subnet_id" {
  type    = string
  default = "subnet-05ba54dadeae3a83c"
}

variable "ssh_allowed_ip" {
  type        = string
  description = "SSH is allowed only for this IP"
  default     = "121.200.5.90/32"
}