key_pair_name   = "MyDevopsAcademyKey" 
vpc_cidr = "10.0.0.0/16"

public_subnets = {
   public_a = {
      cidr_block = "10.0.64.0/18"
      zone       = "ap-southeast-2a"
   }
   public_b = {
      cidr_block = "10.0.128.0/18"
      zone       = "ap-southeast-2b"
   }
}

private_subnets = {
   private_a = {
      cidr_block = "10.0.0.0/19"
      zone       = "ap-southeast-2a"
   }
   private_b = {
      cidr_block = "10.0.32.0/19"
      zone       = "ap-southeast-2b"
   }
} 