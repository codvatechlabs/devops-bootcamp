resource "aws_launch_configuration" "javatemplet" {
  name_prefix   = "javatemplet"
  image_id      = "ami-052cef05d01020f1d"
  instance_type = "t2.micro"


  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Welcome to EC2 advance Demo Terraform Demo!!!, I am $(hostname -f) hosted by Terraform" > /var/www/html/index.html
                EOF




}

resource "aws_autoscaling_group" "ASG-JAVA" {
  availability_zones   = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  desired_capacity     = 1
  max_size             = 2
  min_size             = 1
  launch_configuration = aws_launch_configuration.javatemplet.name
}

