output "subnets" {
  value = {
    public = [
      aws_subnet.public[0].cidr_block,
      aws_subnet.public[1].cidr_block,
    ],
    private = [
      aws_subnet.private[0].cidr_block,
      aws_subnet.private[1].cidr_block,
    ]
  }
}

output "vpc" {
  value = aws_vpc.devops-iac02.cidr_block
}