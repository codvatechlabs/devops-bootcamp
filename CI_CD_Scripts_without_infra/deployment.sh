#!/bin/bash
systemctl stop tomcat
url=https://ctlbootcamp.jfrog.io/artifactory/libs-snapshot-local/CrudDemoWithMySql/CrudDemoWithMySql/0.0.1-SNAPSHOT/CrudDemoWithMySql-0.0.1-SNAPSHOT.war
wget --user=ctlsep2022@gmail.com --password=Bootcamp@1234 -q -N $url
rm -rf /tmp/artifacts
mkdir /tmp/artifacts
mv CrudDemoWithMySql-0.0.1-SNAPSHOT.war CrudDemoWithMySql.war
cp CrudDemoWithMySql.war /tmp/artifacts
cp /tmp/artifacts/CrudDemoWithMySql.war /usr/share/tomcat/webapps
sudo systemctl start tomcat
