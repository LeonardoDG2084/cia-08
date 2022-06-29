data "aws_ami" "amazon-lnx" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm*"]
  }

  filter {
<<<<<<< HEAD
    name   = "architecture"
=======
    name  = "architecture"
>>>>>>> d296ac2b8d4c7ac72a85397fcf53d2954b92de3f
    values = ["x86_64"]
  }
}

data "aws_subnet" "app-public-subnet" {
  cidr_block = var.cidr_block
}

data "aws_vpc" "vpc" {
  filter {
<<<<<<< HEAD
    name   = "tag:Name"
    values = [var.vpc_name]
=======
    name = "tag:Name"
    values = [var.vpc_name]

>>>>>>> d296ac2b8d4c7ac72a85397fcf53d2954b92de3f
  }
}