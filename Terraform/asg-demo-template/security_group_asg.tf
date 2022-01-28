resource "aws_security_group" "allow_http_asg" {
  name        = var.asg_security_group_name
  description = "Allow HTTP inbound traffic from LB"

  ingress {
    #http
    from_port         = 80
    to_port           = 80
    protocol          = "TCP"
    security_groups = [aws_security_group.allow_http.id]
    description       = "allow http inbound"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow all traffic outbound"
  }
}