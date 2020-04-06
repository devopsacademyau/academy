output "vpc_id" {
  value = "${aws_vpc.devopsacademy-iac.id}"
}
output "public_subnet-a" {
  value = ["${aws_subnet.public-iac-a.id}"]
}
output "public_subnet-b" {
  value = ["${aws_subnet.public-iac-b.id}"]
}
output "private_subnet-a" {
  value = ["${aws_subnet.private-iac-a.id}"] 
}

output "private_subnet-b" {
  value = ["${aws_subnet.private-iac-b.id}"] 
}

