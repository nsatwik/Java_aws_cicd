#!/bin/bash
# Install CodeDeploy agent
echo "Installing CodeDeploy agent..."
yum install -y ruby wget
cd /home/ec2-user
wget https://aws-codedeploy-ap-south-1.s3.ap-south-1.amazonaws.com/latest/install
chmod +x ./install
./install auto
service codedeploy-agent start
echo "CodeDeploy agent installed and started."
