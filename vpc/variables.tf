variable "vpc_name" {
 type = string
}

variable "cidr_subnet_public" {
  type = list(string)
  default = [ "10.0.100.0/24","10.0.104.0/24" ]
}

variable "labels" {
 type = map
 default = {
   "env" = "prod" 
   "projeto" = "vpc" 
  }
}

variable "cidr" {
  type = string
  default = "10.0.0.0/16"
}
