

resource "aws_instance" "Windows_Terraform_Demo" {
  ami           = var.ami_id
  instance_type = var.instance_type

  root_block_device {
    volume_type = var.volume_type
    volume_size = var.volume_size
    encrypted   = "true"
  }
  tags      = var.tag_values
  key_name  = var.ec2_key_name
  subnet_id = var.subnet_name

}


resource "aws_security_group" "Windows_Demo" {
  name        = "Windows_Demo"
  description = "allow_all SSH and HTTP inbound,Allow all outbound traffic"

  ingress {
    #HTTP
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow_all SSH and inbound"
  }
  ingress {
    #SSH
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow_all and HTTP inbound"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow all traffic outbound"
  }
}


resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.Windows_Demo.id
  network_interface_id = aws_instance.Windows_Terraform_Demo.primary_network_interface_id
}