output "Private_IP_Linux" {
  value = aws_instance.ec2_terraform.private_ip
}

output "Public_IP_Linux" {
  value = aws_instance.ec2_terraform.public_ip
}
