devops_class = "c04-iac02"
vpc_cidr     = "10.0.0.0/16"

common_tags = {
  devops-class = "c04-iac02"
  deployed-by  = "terraform"
}

public_subnets = {
  public_1 = {
    cidr_block = "10.0.10.0/24"
    zone       = "ap-southeast-2a"
  }
  public_2 = {
    cidr_block = "10.0.11.0/24"
    zone       = "ap-southeast-2b"
  }
}

private_subnets = {
  private_1 = {
    cidr_block = "10.0.20.0/24"
    zone       = "ap-southeast-2a"
  }
  private_2 = {
    cidr_block = "10.0.21.0/24"
    zone       = "ap-southeast-2b"
  }
}