output "elb_dns_name" {
  value = "${aws_elb.elb.dns_name}"
}

output "alb_dns_name" {
  value = "${aws_lb.alb.dns_name}"
}

output "nlb_dns_name" {
  value = "${aws_lb.nlb.dns_name}"
}