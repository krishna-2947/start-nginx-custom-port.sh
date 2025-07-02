#!/bin/bash

# This script installs and runs NGINX on port 80 and shows real-time logs

# Check for root permissions
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root: sudo $0"
  exit 1
fi

# Update package list
echo "Updating package list..."
apt update

# Install nginx
echo "Installing NGINX..."
apt install -y nginx

# Enable and start nginx service
echo "Enabling and starting NGINX..."
systemctl enable nginx
systemctl restart nginx

# Confirm status
echo "Checking NGINX status..."
systemctl status nginx --no-pager

# Show IP to access
echo
echo "✅ NGINX is running. You can access it via:"
echo "   → http://$(hostname -I | awk '{print $1}')"
echo

# Show real-time access log
echo "📜 Showing real-time NGINX access log (press Ctrl+C to stop)..."
tail -f /var/log/nginx/access.log
