# Create an Route 53 record  (A record) in ur domain and point to the VM public ip
  resource "aws_route53_record" "do" {
  zone_id =  var.zone_id
  name    = "devopsacademy"
  type    = "A"

  alias {
    name                   = aws_lb.alb.dns_name
    zone_id                = aws_lb.alb.zone_id
    evaluate_target_health = true
  }
}
