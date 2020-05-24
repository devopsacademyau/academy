output "endpoint" {
    value = aws_rds_cluster.rdsclu.endpoint
    description = "Thd DNS address of the rds instance"
}

output "db_host_arn" {
    value = aws_ssm_parameter.db-host.arn
    description = "The arn of the db host that stored in ssm"
}

output "db_user_arn" {
    value = aws_ssm_parameter.db-user.arn
    description = "The arn of the db user that stored in ssm"
}

output "db_passowrd_arn" {
    value = aws_ssm_parameter.db-passowrd.arn
    description = "The arn of the db password that stored in ssm"
}

output "db_name_arn" {
    value = aws_ssm_parameter.db-name.arn
    description = "The arn of the db name that stored in ssm"
}