output "vpc_cidr" {
  value = "${aws_vpc.devopsacademy-iac.cidr_block}"
}

output "subnet1_cidr" {
  value = "${aws_subnet.subnet1.cidr_block}"
}

output "subnet2_cidr" {
  value = "${aws_subnet.subnet2.cidr_block}"
}

output "subnet3_cidr" {
  value = "${aws_subnet.subnet3.cidr_block}"
}

output "subnet4_cidr" {
  value = "${aws_subnet.subnet4.cidr_block}"
}

