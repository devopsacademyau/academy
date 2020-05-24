variable project_name {
    default = "devopsacademy-project"
    type = string
}

variable db_name {
    default = "db1"
    type = string
}
variable vpc_cidr {
    type = string
    default = "10.0.0.0/16"
}

variable db_sg_name {
    default = "devopsacademy-project-db-sg"
    type = string
}

variable cluster_name {
    default = "devopsacademy-project-cluster"
    type = string
}

variable private_subnet_id1 {
    type = string
}

variable private_subnet_id2 {
    type = string
}

variable availability_zones {
    type = list
    default = ["ap-southeast-2a", "ap-southeast-2b"]
}

variable "vpc_id" {
    type = string
}

variable "wordpress_db_host_parameter" {
    type = string
    default = "/wordpress/WORDPRESS_DB_HOST"
}

variable "wordpress_db_user_parameter" {
    type = string
    default = "/wordpress/WORDPRESS_DB_USER"
}

variable "wordpress_db_password_parameter" {
    type = string
    default = "/wordpress/WORDPRESS_DB_PASSWORD"
}

variable "wordpress_db_name_parameter" {
    type = string
    default = "/wordpress/WORDPRESS_DB_NAME"
}

variable "db_user_name" {
    type = string
    default = "admin"
}

variable "db_password" {
    type = string
    default = "changeme"
}

variable "ecs_nodes_secgrp_id" {
    type = string
}