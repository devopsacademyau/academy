variable "project_name" {type = string}
variable "region" {type = string}
variable "private_subnet_id" {
  type = any
  default = ""
}
variable "vpc_id" {type = string}
variable "vpc_cidr" {type = string}
variable "security_group" {type = list(any)}
variable "ecs_nodes_secgrp_id" {type = string}
