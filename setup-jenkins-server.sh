#!/bin/bash

# Update system
sudo yum update -y

# Install Git
sudo yum install -y git

# Install Java 17 (required for Jenkins 2.528+)
sudo yum install -y java-17-amazon-corretto

# Install Jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum install -y jenkins


# Wait for installation to complete
echo "Waiting for Jenkins installation to settle..."
sleep 5

# Start Jenkins
sudo systemctl daemon-reload
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Wait for Jenkins to start
echo "Waiting for Jenkins to start..."
sleep 15

# Install Terraform
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum install -y terraform

# Verify Jenkins is running
sudo systemctl is-active jenkins

# Get initial Jenkins password
echo "=========================================="
echo "Jenkins Initial Admin Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo "=========================================="