#step-1-logic to create aws asg
resource "aws_autoscaling_group" "ASG-Demo" {
  name                      = "ASG-Demo"
  max_size                  = 1
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true
  launch_configuration      = aws_launch_configuration.javatemplet.name
  vpc_zone_identifier       = ["subnet-b5345ace", "subnet-eef0d4a2", "subnet-6f19ee04"]
  target_group_arns         = [aws_alb_target_group.JavaTG.arn]
}
#step2 - create load balancer
resource "aws_alb" "ALB-JAVA" {
  name               = "ALB-JAVA"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-02d28ca360b63e927"]
  subnets            = ["subnet-b5345ace", "subnet-eef0d4a2", "subnet-6f19ee04"]
}

#step3 - Target_group
resource "aws_alb_target_group" "JavaTG" {
  name     = "JavaTG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-18824b73"
  health_check {
    port     = 80
    protocol = "HTTP"
  }
}

resource "aws_alb_listener" "front_end" {
  load_balancer_arn = aws_alb.ALB-JAVA.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.JavaTG.arn
  }
}