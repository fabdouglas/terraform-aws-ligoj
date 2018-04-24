variable "access_key" {}
variable "secret_key" {}
variable "key_name" {}
variable "public_key" {}
variable "region" {}
variable "project" {}
variable "project_key" {}
variable "project_name" {}
variable "subscription" {}
variable "ligoj_url" {}

variable "it" {
  default = true
}

variable "tags" {
  default = {}
}

variable "ingress" {
  default = {}
}

variable "ingress-elb" {
  default = {}
}

variable "servers_per_az" {
  default = 1
}

variable "azs" {
  type = "list"
}

variable cidr {}

variable private_subnets {
  type = "list"
}

variable public_subnets {
  type = "list"
}
