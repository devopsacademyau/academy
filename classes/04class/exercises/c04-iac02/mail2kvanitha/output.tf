output "aws_vpc" {
	value = "${aws_vpc.devopsacademy-iac.cidr_block}"
}


output "aws_internet_gateway" {
	value = "${aws_internet_gateway.devopsacademy-iac-igw.id}"
}


output "aws_nat_gateway" {
	value = "${aws_nat_gateway.iac-nat-gateway.id}"
}


output "public-subnet-1a-name" {
	value = "${aws_subnet.iac-public-1a.tags.Name}"
}

output "public-subnet-1a-cidr" {
	value = "${aws_subnet.iac-public-1a.cidr_block}"
}

output "public-subnet-1b-name" {
	value = "${aws_subnet.iac-public-1b.tags.Name}"
}

output "public-subnet-1b-cidr" {
	value = "${aws_subnet.iac-public-1b.cidr_block}"
}

output "private-subnet-1a-name" {
	value = "${aws_subnet.iac-private-1a.tags.Name}"
}

output "private-subnet-1a-cidr" {
	value = "${aws_subnet.iac-private-1a.cidr_block}"
}


output "private-subnet-1b-name" {
	value = "${aws_subnet.iac-private-1b.tags.Name}"
}

output "private-subnet-1b-cidr" {
	value = "${aws_subnet.iac-private-1b.cidr_block}"
}
