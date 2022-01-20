resource "aws_lb" "ALB-Demo" {
  name               = "ALB-Demo"
  internal           = false
  load_balancer_type = "application"
  subnets            = ["subnet-b5345ace", "subnet-eef0d4a2", "subnet-6f19ee04"]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "ALBtargetGroup" {
  name     = "ALBtargetGroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-18824b73"
  health_check {
    port     = 80
    protocol = "HTTP"
  }
}

resource "aws_lb_target_group_attachment" "target2" {
  target_group_arn = aws_lb_target_group.ALBtargetGroup.arn
  target_id        = aws_instance.ALB-Terraform-demo-1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "target1" {
  target_group_arn = aws_lb_target_group.ALBtargetGroup.arn
  target_id        = aws_instance.ALB-Terraform-demo-2.id
  
  port             = 80
}


resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.ALB-Demo.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ALBtargetGroup.arn
  }
}