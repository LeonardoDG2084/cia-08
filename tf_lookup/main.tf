variable "env" {
   type = string
}

variable "size" {
  type = map
    default = {
     "qa" = "Large",
     "dev" = "small",
     "prod" = "xLarge"
  }
}

output "ambiente"{
  value = lookup(var.size, var.env)
}
