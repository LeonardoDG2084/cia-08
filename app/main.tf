
module "turma08_app" {
    source = "./modules/turma08_app"
    cidr_block = "10.0.100.0/24"
    vpc_name = "turma-08"
    project = "turma-08-modulo"
    env = var.env
    create_zone_dns = false
}

output "ip_app" {
  value = module.turma08_app.app_public_ip
}

