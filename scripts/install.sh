#!/bin/bash
# Exit immediately if a command fails
set -e

# Check if the agent is already installed
if [ -f /opt/codedeploy-agent/bin/codedeploy-agent ]; then
    echo "CodeDeploy agent already installed. Restarting..."
    sudo systemctl restart codedeploy-agent
else
    echo "Installing CodeDeploy agent..."

    # Update system
    sudo yum update -y

    # Install Ruby (required for CodeDeploy agent)
    sudo yum install -y ruby wget

    # Download installer (replace region if needed)
    REGION="ap-south-1"
    cd /tmp
    wget https://aws-codedeploy-${REGION}.s3.${REGION}.amazonaws.com/latest/install

    # Make installer executable
    chmod +x ./install

    # Run installer
    sudo ./install auto
fi

# Enable and start the agent
sudo systemctl enable codedeploy-agent
sudo systemctl start codedeploy-agent

# Verify agent status
status=$(systemctl is-active codedeploy-agent)
if [ "$status" = "active" ]; then
    echo "CodeDeploy agent is running successfully."
else
    echo "Error: CodeDeploy agent failed to start."
    exit 1
fi
