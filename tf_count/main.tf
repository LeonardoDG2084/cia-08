variable "usernames" {
    type = list
   default = ["neo","leonardo","Leandro","Paulo"]
}

variable "size" {
    type = map
    default = {
      "dev" = 2
      "qa" = 4
      "prod" = 8
   }
}

variable "env" {
  type = string
}

resource "aws_iam_user" "names" {
    count = var.create_dns == false ? 0 : 1
    name = "leonardo" 
}

variable "create_dns" {
  type = bool
  default = false
}