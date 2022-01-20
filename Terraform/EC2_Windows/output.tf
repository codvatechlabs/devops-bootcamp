output "instance_id-EC2" {
  value = aws_instance.Windows_Terraform_Demo.id
}

output "Private_IP-EC2" {
  value = aws_instance.Windows_Terraform_Demo.private_ip
}

output "Public_IP-EC2" {
  value = aws_instance.Windows_Terraform_Demo.public_ip
}