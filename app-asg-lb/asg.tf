resource "aws_launch_template" "app_template" {
  name_prefix   = format("%s-app_tpl-%s", var.project, var.env)
  image_id      = data.aws_ami.app_ami.id
  instance_type = lookup(var.instance_type, var.env)
  user_data     = data.template_file.app_startup_script.rendered
  key_name      = aws_key_pair.app_ssh_key.id
  vpc_security_group_ids = [aws_security_group.allow-http-ssh.id]
}

