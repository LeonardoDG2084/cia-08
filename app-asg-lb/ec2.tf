resource "aws_instance" "mongodb" {
  ami                         = data.aws_ami.app_ami.id
  instance_type               = lookup(var.instance_type, var.env)
  subnet_id                   = data.aws_subnet.app_subnet.id
  associate_public_ip_address = false
  tags = {
    Name = format("%s-mongodb_server-%s", var.project, var.env)
  }
  key_name  = aws_key_pair.app_ssh_key.id
  user_data = data.template_file.mongodb_startup_script.rendered
}

resource "aws_key_pair" "app_ssh_key" {
  key_name   = format("%s-ssh-%s", var.project, var.env)
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC8EjNzo5WuDUv+oxbDmvnNbpXnj6qZ8uRFOEP58xwKkwIv1IyEg9/T9rZLQLm/ZJ2wu4iW68kNti6VasMY7+MJktV8mnv4PSysOkN4AsrjFmbN94HwSN76Q3TVpJcQJg6BeKYpcdHldBDmmY3CXwQ5EIzjVpM85ht1u7EPP19pLNx5w3K4Pxx17HFPggsUjALJsg9ZW5pdiJQHGJdlrFVDnjhZRnjJjiiE9yoc4QdpCxLoOckZVRWmsFuNbg7sIoayAtRsCTX3KrhTpGFIG8LtquwhhGxOVYCuA7SoIBWBtdkZ/qKMbTzIyx7O/cs0FWJ+ItosGjw8ckL09s0zWwLNX2BEWLQK5rK8mYc5s7qgs6ry2PQYYVZkoSyXRQnIRPhRklfwe7Zx3oe3N/JJL2gIVnojTekVUHXpsSV45tv1/rO5ZZO+x1IzjsPpyCujQ+sq4BqJLVQlqHfNP9JQpLulke3hPgny8/RmKX/YfRH0TPWhNlR6+SQOIFc0io3+530= appkey"
}
