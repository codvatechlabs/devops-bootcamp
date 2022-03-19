resource "aws_instance" "ec2_demo" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = "subnet-6f19ee04"
  vpc_security_group_ids = [aws_security_group.ec2_demo_sg.id]

  tags = {
    Name = "Created_By_Terraform_Automation"
  }

  user_data = <<-EOF
              #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Welcome to Terraform Demo!!!, I am $(hostname -f) hosted by Terraform" > /var/www/html/index.html
              EOF

}