resource "aws_autoscaling_group" "dashboard-asg" {
  name = "dashboard-asg"
  launch_template {
    id      = aws_launch_template.dashboard_asg_template.id
    version = "$Latest"
  }
  min_size            = 1
  max_size            = 1
  vpc_zone_identifier = data.aws_subnet_ids.selected.ids

  target_group_arns = [aws_alb_target_group.dashboard_target_group.arn]

  lifecycle {
    create_before_destroy = true
  }
}