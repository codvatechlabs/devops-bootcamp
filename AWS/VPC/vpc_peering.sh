#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd.service
systemctl enable httpd.service
echo "Hi Friend , I am $(hostname -f) VPC Peering Demo" > /var/www/html/index.html