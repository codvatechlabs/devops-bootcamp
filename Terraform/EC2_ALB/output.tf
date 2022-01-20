output "instance_id-EC2-1" {
  value = aws_instance.ALB-Terraform-demo-1.id
}

output "Private_IP-EC2-1" {
  value = aws_instance.ALB-Terraform-demo-1.private_ip
}

output "Public_IP-EC2-1" {
  value = aws_instance.ALB-Terraform-demo-1.public_ip
}

###################################################################

output "instance_id-EC2-2" {
  value = aws_instance.ALB-Terraform-demo-1.id
}

output "Private_IP-EC2-2" {
  value = aws_instance.ALB-Terraform-demo-2.private_ip
}

output "Public_IP-EC2-2" {
  value = aws_instance.ALB-Terraform-demo-2.public_ip
}

output "alb_dns" {
  value = aws_lb.ALB-Demo.dns_name
}