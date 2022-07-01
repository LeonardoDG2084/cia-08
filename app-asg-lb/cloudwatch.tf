resource "aws_cloudwatch_metric_alarm" "app-scale-up" {
    alarm_name = format("%s-scale-up-alarm-%s", var.project, var.env)
    comparison_operator = "GreaterThanOrEqualtoThreshold"
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
    
}

