#!/bin/bash
# Update packages
apt-get update -y
apt-get install -y docker.io

# Start Docker service
systemctl enable docker
systemctl start docker

# Pull Docker image from Docker Hub
docker pull jaweriaaslam925/demo-app:nginx-v1

# Run container automatically
docker run -d -p 80:80 --name nginx-server jaweriaaslam925/demo-app:nginx-v1
