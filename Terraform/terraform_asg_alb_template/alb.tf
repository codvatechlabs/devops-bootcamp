resource "aws_alb" "dashboard_alb" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http.id]
  subnets            = data.aws_subnets.selected.ids

  tags = {
    Environment = "lb-demo"
  }
}

resource "aws_alb_target_group" "dashboard_target_group" {
  name     = "dashboard-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.selected.id
}

resource "aws_alb_listener" "front_end" {
  load_balancer_arn = aws_alb.dashboard_alb.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.dashboard_target_group.arn
  }
}