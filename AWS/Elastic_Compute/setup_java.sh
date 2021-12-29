#!/bin/bash
yum install -y git
amazon-linux-extras install tomcat8.5
systemctl start tomcat
cd /tmp
git clone https://github.com/CodvaTech-Labs/ctl-java-demo.git
cp /tmp/ctl-java-demo/CrudDemoWithMySql.war /usr/share/tomcat/webapps
systemctl stop tomcat
systemctl start tomcat