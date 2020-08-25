resource "aws_ses_email_identity" "from" {
  email = "raghunadhpokkalath@gmail.com"
}
resource "aws_ses_email_identity" "to" {
  email = "raghunadhp@gmail.com"
}

##Using AWS client for email as terraform doesnt support email sns
resource "aws_sns_topic" "this" {
  name = var.sns_topic
  provisioner "local-exec" {
    command = "sh scripts/snssubscribe.sh"
    environment = {
      sns_arn   = self.arn
      email_id = var.sns_email
    }

  }
}