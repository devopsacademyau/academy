variable "ami_web" {
  type = string
  default = "ami-02a45d709a415958a"
  #Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type - ami-02a45d709a415958a (64-bit x86) / ami-02ba5140a4539f3fb (64-bit Arm)
}

variable "subnet1" {
  type = string
  default = "subnet-01b270057f65a803b"
}

variable "subnet2" {
  type = string
  default = "subnet-0ab7b0283a24023ca"
}

variable "scale_out_amount" {
  type = string
  default = "1"
}

variable "scale_in_amount" {
  type = string
  default = "-1"
}
