#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install java-openjdk11 -y
sudo yum install -y tomcat
sudo systemctl enable tomcat
sudo systemctl start tomcat