output albdnsname {
  value = aws_lb.lb.dns_name
}
output albarn {
  value = aws_lb_target_group.lbtg.arn
}