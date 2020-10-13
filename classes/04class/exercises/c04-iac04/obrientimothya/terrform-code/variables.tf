variable ami {
  type        = string
  description = "AMI identifier to be deployed to EC2 instances"
}

variable vpc_cidr {
  type        = string
  description = "VPC CIDR to contain all resources"
}

variable subnet_a_cidr {
  type        = string
  description = "Subnet CIDR in AZ A for deploying EC2 instances and resources"
}

variable subnet_b_cidr {
  type        = string
  description = "Subnet CIDR in AZ B for deploying EC2 instance and resources"
}

variable app_name {
  type        = string
  description = "App name appended to resources"
  default     = "c04-iac04"
}

variable mem_scale_up_threshold {
  type = string
  description = "MEM utilisation scale up threshold for ASG"
}

variable mem_scale_down_threshold {
  type = string
  description = "MEM utilisation scale down threshold for ASG"
}

variable min_size {
  type = string
  description = "ASG min size"
}

variable max_size {
  type = string
  description = "ASG max size"
}

variable desired_capacity {
  type = string
  description = "ASG desired_capacity"
}
