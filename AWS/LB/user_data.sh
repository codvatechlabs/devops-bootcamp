#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd.service
systemctl enable httpd.service
echo "Welcome to ALB Demo !!!, I am $(hostname -f) hosted by EC2" > /var/www/html/index.html