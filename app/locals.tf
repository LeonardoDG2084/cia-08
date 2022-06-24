locals {
  name = format("%s-%s", var.project, local.env)
  env = terraform.workspace
}