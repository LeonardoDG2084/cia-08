variable "project" {
  type    = string
  default = "coxinha"
}

variable "cidr_block" {
  type = string
}

variable "instance_type_app" {
  type    = map
  default = {
    dev  = "t2.micro"
    qa   = "t3.large"
    prod = "t3.medium"
  }
}

variable "instance_type_mongodb" {
  type    = string
  default = "t2.small"
}

variable "vpc_name" {
  type = string
}

variable "env" {
  type = string
  default = "dev"
}
