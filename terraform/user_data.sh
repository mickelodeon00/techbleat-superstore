#!/bin/bash

# Update and install packages
sudo yum update -y
sudo yum install nginx git python3 python3-pip -y

# Start Nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# cloning repo
sudo git clone https://github.com/techbleat/fruits-veg_market.git

# Create virtual environment
cd fruits-veg_market
python3 -m venv venv

# Done
echo "Setup complete"