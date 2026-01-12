#!/bin/bash

# Update and install packages
yum update -y
yum install nginx git python3 python3-pip -y

# Start Nginx
systemctl start nginx
systemctl enable nginx

# cloning repo
cd /home/ec2-user
sudo -u ec2-user git clone -b mini-project https://github.com/techbleat/fruits-veg_market.git

# deploy frontend
sudo cp -r fruits-veg_market/frontend/* /usr/share/nginx/html/

# Done
echo "Setup complete"