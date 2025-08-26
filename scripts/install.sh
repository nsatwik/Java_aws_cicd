#!/bin/bash
# Install Java & Tomcat
echo "Installing Java and Tomcat..."
yum install -y java-17-amazon-corretto
yum install -y wget tar
cd /opt
wget https://downloads.apache.org/tomcat/tomcat-10/v10.1.15/bin/apache-tomcat-10.1.15.tar.gz
tar xvf apache-tomcat-10.1.15.tar.gz
mv apache-tomcat-10.1.15 tomcat
chmod +x /opt/tomcat/bin/*.sh
echo "Java and Tomcat installed."
