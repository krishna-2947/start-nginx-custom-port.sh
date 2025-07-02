#!/bin/bash

# Script to install Apache2 on Ubuntu 22.04


echo "Installing Apache2..."
sudo apt install apache2 -y

echo "Apache2 installed successfully!"

echo " Starting Apache2 service..."
sudo systemctl start apache2

echo "Checking Apache2 status..."
sudo systemctl status apache2 --no-pager
