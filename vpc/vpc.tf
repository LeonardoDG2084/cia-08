module "turma08" {
 source = "terraform-aws-modules/vpc/aws" 
 name = var.vpc_name
 cidr = var.cidr

 azs = [ "us-east-1a", "us-east-1b" ]
 public_subnets = var.cidr_subnet_public

 enable_nat_gateway = false
 enable_vpn_gateway = false
 enable_dns_hostnames = true

 tags = var.labels
}
