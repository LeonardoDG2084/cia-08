variable "env" {
 type = string
}

data "template_file" "conditional" {
   template = file("arquivo.txt")
   vars = {
       "value" = var.env == "prod" ? "PROD" : "QA"
   }
}

output "conditional" {
   value = data.template_file.conditional.*.rendered
}
