variable "project" {
  type = string
  default = "coxinha"
}

variable "env" {
  type = string
  default = "dev"
}

variable "cidr_block" {
  type = string
}

variable "instance_type_app" {
  type = string
  default = "t2.micro"
}

variable "instance_type_mongodb" {
  type = string
  default = "t2.small"
}

variable "vpc_name" {
  type = string
}