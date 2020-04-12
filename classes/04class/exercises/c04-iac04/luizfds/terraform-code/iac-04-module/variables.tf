variable "amazon_linux" {
  type = string
  default = "amzn2-ami-hvm-*-x86_64-gp2"
}

variable "subnets" {
  type = list(string)
}
