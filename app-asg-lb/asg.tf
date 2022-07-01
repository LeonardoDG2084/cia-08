resource "aws_launch_template" "app_template" {
  name_prefix   = format("%s-app_tpl-%s", var.project, var.env)
  image_id      = data.aws_ami.app_ami.id
  instance_type = lookup(var.instance_type, var.env)
  user_data     = base64encode(data.template_file.app_startup_script.rendered)
  key_name      = aws_key_pair.app_ssh_key.id
  vpc_security_group_ids = [aws_security_group.allow-http-ssh.id]
}

resource "aws_autoscaling_group" "app-asg" {
  name = format("%s-asg-%s", var.project, var.env)
  max_size = 5
  min_size = 1
  health_check_grace_period = 150
  health_check_type = "ELB"
  desired_capacity = 2
  force_delete = true
  placement_group = aws_placement_group.app_placement_group.id
  vpc_zone_identifier = [data.aws_subnet.app_subnet.id]
  target_group_arns = [aws_lb_target_group.app-tg.arn]

  launch_template {
    id = aws_launch_template.app_template.id
    version = "$Latest"
  }
 
  timeouts {
    delete = "15m"
  }

}

resource "aws_placement_group" "app_placement_group" {
  name = format("%s-pl_grp-%s", var.project, var.env)
  strategy = "spread"
}

resource "aws_autoscaling_policy" "app-scale-up" {
  name = format("%s-scale-up-%s", var.project, var.env)
  scaling_adjustment = 1
  adjustment_type = "ChangeInCapacity"
  cooldown = 300
  autoscaling_group_name = aws_autoscaling_group.app-asg.name
  policy_type = "SimpleScaling"
}

resource "aws_autoscaling_policy" "app-scale-down" {
  name = format("%s-scale-down-%s", var.project, var.env)
  scaling_adjustment = -1
  adjustment_type = "ChangeInCapacity"
  cooldown = 300
  autoscaling_group_name = aws_autoscaling_group.app-asg.name
  policy_type = "SimpleScaling"
}

resource "aws_autoscaling_attachment" "app-auto-attach" {
  autoscaling_group_name = aws_autoscaling_group.app-asg.id
  alb_target_group_arn = aws_lb_target_group.app-tg.arn
}
