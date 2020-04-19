output "db_credentials" {
  value = "${aws_rds_cluster.default.master_username}@${random_string.default_password.result}"
}
