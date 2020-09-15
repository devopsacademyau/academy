variable project-name {
  description = "Name of the project to use across al  resources"
  type        = string
  default     = "c06-serverless-01"
}



variable TAG_NAME {
  description = "Name of the ec2 tag"
  type        = string
  default     = "CostCentre"
}

variable SNS_TOPIC {
  description = "SNS topic to send notifications"
  type        = string
  default     = "EC2-updates"
}

