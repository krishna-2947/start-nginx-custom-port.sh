#!/bin/bash

# Set your custom port (not 80)
CUSTOM_PORT=8085

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker not found. Please install Docker first."
    exit 1
fi

# Pull the latest nginx image
echo "Pulling the latest NGINX image..."
docker pull nginx:latest

# Run nginx container on the custom port
echo "Running NGINX on port $CUSTOM_PORT..."
docker run -d --name nginx-webserver -p $CUSTOM_PORT:80 nginx:latest

# Show running container
echo "NGINX is now running on http://<your-ip>:$CUSTOM_PORT"
docker ps | grep nginx
