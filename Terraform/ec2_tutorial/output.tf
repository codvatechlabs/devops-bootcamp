output "Instance_id_EC2" {
  value = aws_instance.web.id
}

output "Private_IP_EC2" {
  value = aws_instance.web.private_ip
}

output "Public_IP_EC2" {
  value = aws_instance.web.public_ip
}
