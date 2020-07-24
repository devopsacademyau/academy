variable bucket_name {
	default = "class04-s3-bucket04"
	description = "Class04 bucket name"
}

variable "ec2_image_id" {
  description = "EC2 AMI ID of the instance"
  type        = string
}
