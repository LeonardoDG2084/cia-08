data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "aws_subnet" "app_subnet" {
  cidr_block = var.cidr_block
}

data "aws_subnet" "app_subnet2" {
  cidr_block = var.cidr_block2
}

data "template_file" "mongodb_startup_script" {
  template = file("mongodb.sh")
  vars = {
    "tag" = "5.0.2"
  }
}

data "template_file" "app_startup_script" {
  template = file("app.sh")
  vars = {
    image          = lookup(var.app_docker, "image")
    tag            = lookup(var.app_docker, "tag")
    port           = lookup(var.app_docker, "port")
    mongodb_server = aws_instance.mongodb.private_ip
  }
}


data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}