#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd.service
systemctl enable httpd.service
echo "Hi Friend , I am $(hostname -f) hosted by Custom VPC" > /var/www/html/index.html
EOF
}