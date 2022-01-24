resource "aws_instance" "web01" {
  ami           = "ami-0af25d0df86db00c1"
  instance_type = "t3.medium"
  key_name = "devops2022"
  subnet_id = "subnet-6f19ee04"


  tags = {
    Name = "Terraform_DevOpsDemo"
  }
}