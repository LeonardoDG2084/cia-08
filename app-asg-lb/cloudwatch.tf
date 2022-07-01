resource "aws_cloudwatch_metric_alarm" "app-scale-up" {
    alarm_name = format("%s-scale-up-alarm-%s", var.project, var.env)
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    period = "120"
    statistic = "Average"
    threshold = "70"

    dimensions = {
       AutoScalingGroupName = aws_autoscaling_group.app-asg.name
    }
    alarm_description = "Scale up by CPU"
    alarm_actions = [aws_autoscaling_policy.app-scale-up.arn]
}

resource "aws_cloudwatch_metric_alarm" "app-scale-down" {
    alarm_name = format("%s-scale-down-alarm-%s", var.project, var.env)
    comparison_operator = "LessThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    period = "120"
    statistic = "Average"
    threshold = "5"

    dimensions = {
       AutoScalingGroupName = aws_autoscaling_group.app-asg.name
    }
    alarm_description = "Scale down by CPU"
    alarm_actions = [aws_autoscaling_policy.app-scale-down.arn]
}