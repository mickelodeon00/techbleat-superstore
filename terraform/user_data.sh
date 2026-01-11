#!/bin/bash

# Update and install packages
sudo yum update -y
sudo yum install nginx git python3 python3-pip -y

# Start Nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# cloning repo
# Working in /home/ec2-user as ec2-user
cd /home/ec2-user
sudo -u ec2-user git clone https://github.com/techbleat/fruits-veg_market.git
cd fruits-veg_market/python
sudo -u ec2-user python3 -m venv venv

# Done
echo "Setup complete"