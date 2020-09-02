variable app-version {
  type        = string
  description = "Application version to be deployed"
  default     = "1.0"
}

# SSM

variable db-name {
  description = "Name of the dynamodb database"
  type        = string
  default     = "serverless-db"
}

variable project-name {
  description = "Name of the project to use across al  resources"
  type        = string
  default     = "c06-serverless-01"
}

