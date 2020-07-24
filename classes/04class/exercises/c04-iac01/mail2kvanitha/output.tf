output "bucket" {
	value = "${aws_s3_bucket.class04-bucket.bucket}"
}


output "bucket_arn" {
	value = "${aws_s3_bucket.class04-bucket.arn}"
}

output "bucket_id" {
	value = "${aws_s3_bucket.class04-bucket.id}"
}

output "bucket_domain_name" {
	value = "${aws_s3_bucket.class04-bucket.bucket_domain_name}"
}

output "ec2_public_ip" {
	value = "${aws_instance.class04-ec2.public_ip}"
}

output "ec2_instance_id" {
	value = "${aws_instance.class04-ec2.id}"
}

output "vpc_id" {
	value = "${aws_vpc.class04-vpc.id}"
}

output "security_group_id" {
	value = "${aws_security_group.class04-sg.id}"
}

output "subnet_id" {
	value = "${aws_subnet.class04-subnet.id}"
}

output "route_table_id" {
	value = "${aws_route_table.class04-routetable.id}"
}
