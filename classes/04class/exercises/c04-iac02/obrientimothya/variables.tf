variable app_name {
  type        = string
  description = "Friendly name for tags and resource names"
  default     = "c04-iac02"
}

variable vpc_cidr {
  type        = string
  description = "VPC IPv4 CIDR Range"
}

variable subnet_pvt_name_1 {
  type        = string
  description = "Private subnet 1 friendly name"
  default     = "subnet-private-1"
}

variable subnet_pvt_cidr_1 {
  type        = string
  description = "Private subnet 1 IPv4 CIDR"
}

variable subnet_pvt_name_2 {
  type        = string
  description = "Private subnet 2 friendly name"
  default     = "subnet-private-2"
}

variable subnet_pvt_cidr_2 {
  type        = string
  description = "Private subnet 2 IPv4 CIDR"
}

variable subnet_pub_name_1 {
  type        = string
  description = "Public subnet 1 friendly name"
  default     = "subnet-b-3"
}

variable subnet_pub_cidr_1 {
  type        = string
  description = "Public subnet 1 IPv4 CIDR"
}

variable subnet_pub_name_2 {
  type        = string
  description = "Public subnet 2 friendly name"
  default     = "subnet-b-3"
}

variable subnet_pub_cidr_2 {
  type        = string
  description = "Public subnet 2 IPv4 CIDR"
}

