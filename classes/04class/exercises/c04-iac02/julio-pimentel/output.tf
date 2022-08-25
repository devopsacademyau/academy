# All subnet CIDR blocks 
output "c04_iac02_subnets" {
  value = {
    public = [
      aws_subnet.c04_iac02_public_1.cidr_block,
      aws_subnet.c04_iac02_public_2.cidr_block
    ],
    private = [
      aws_subnet.c04_iac02_private_1.cidr_block,
      aws_subnet.c04_iac02_private_2.cidr_block
    ]
  }
}

#VPC CIDR
output "c04_iac02_vpc" {
  value = aws_vpc.devopsacademy_iac.cidr_block
}