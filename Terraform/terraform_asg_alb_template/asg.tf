resource "aws_autoscaling_group" "dashboard-asg" {
  name = var.asg_name
  launch_template {
    id      = aws_launch_template.dashboard_asg_template.id
    version = "$Latest"
  }
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity
  vpc_zone_identifier = data.aws_subnets.selected.ids

  target_group_arns = [aws_alb_target_group.dashboard_target_group.arn]

  lifecycle {
    create_before_destroy = true
  }
}