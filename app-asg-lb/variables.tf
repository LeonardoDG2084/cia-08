variable "instance_type" {
  type = map(any)
  default = {
    dev  = "t2.small"
    qa   = "t3.small"
    prod = "t3.medium"
  }
}

variable "env" {
  type    = string
  default = "dev"
}

variable "cidr_block" {
  type = string
}

variable "cidr_block2" {
  type = string
}

variable "project" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "app_docker" {
  type = map(any)
  default = {
    tag   = "1.1.0"
    port  = "8000"
    image = "slacko-api"
  }
}