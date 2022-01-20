resource "aws_instance" "ALB-Terraform-demo-1" {
  ami           = var.ami_id
  instance_type = var.instance_type

  root_block_device {
    volume_type = var.volume_type
    volume_size = var.volume_size
    encrypted   = "true"
  }
  tags                   = var.tag_values
  key_name               = var.ec2_key_name
  subnet_id              = var.subnet_name


  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Welcome to EC2 advance Demo Terraform Demo!!!, I am $(hostname -f) hosted by Terraform" > /var/www/html/index.html
                EOF
}

resource "aws_security_group" "ALB_Demo_SG" {
  name        = "ALB_Demo_SG"
  description = "allow_all SSH and HTTP inbound,Allow all outbound traffic"

  ingress {
    #HTTP
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow_all HTTP and inbound"
  }
  ingress {
    #SSH
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow_all and SSH inbound"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow all traffic outbound"
  }
}


resource "aws_network_interface_sg_attachment" "sg_attachment_to_EC2-1" {
  security_group_id    = aws_security_group.ALB_Demo_SG.id
  network_interface_id = aws_instance.ALB-Terraform-demo-1.primary_network_interface_id
}


resource "aws_instance" "ALB-Terraform-demo-2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  root_block_device {
    volume_type = var.volume_type
    volume_size = var.volume_size
    encrypted   = "true"
  }
  tags                   = var.tag_values
  key_name               = var.ec2_key_name
  subnet_id              = var.subnet_name


  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Welcome to EC2 advance Demo Terraform Demo!!!, I am $(hostname -f) hosted by Terraform" > /var/www/html/index.html
                EOF
}

resource "aws_network_interface_sg_attachment" "sg_attachment_to_EC2-2" {
  security_group_id    = aws_security_group.ALB_Demo_SG.id
  network_interface_id = aws_instance.ALB-Terraform-demo-2.primary_network_interface_id
}