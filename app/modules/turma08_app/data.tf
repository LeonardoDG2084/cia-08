data "aws_ami" "amazon-lnx" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm*"]
  }

  filter {
    name  = "architecture"
    values = ["x86_64"]
  }
}

data "aws_subnet" "app-public-subnet" {
  cidr_block = var.cidr_block
}

data "aws_vpc" "vpc" {
  filter {
    name = "tag:Name"
    values = [var.vpc_name]
  }
}

data "template_file" "ec2-mongodb" {
  template = file("${path.module}/files/mongodb.sh")
  vars = {
    version = var.mongodb_version
  }
}

data "template_file" "ec2-app" {
  template = file("${path.module}/files/ec2.sh")
  vars = {
    image = lookup(var.ec2-app, "image")
    version = lookup(var.ec2-app, "version")
    port = lookup(var.ec2-app, "port")
    mongodb_server = aws_instance.app-mongdb.private_ip
  }
}