#!/bin/bash

# Update package lists
sudo apt-get update

# Install required packages
sudo apt-get install ca-certificates curl gnupg lsb-release -y

# Create directory for keyrings
sudo mkdir -m 0755 -p /etc/apt/keyrings

# Download and install Docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Add Docker repository to sources.list.d
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package lists with the new repository
sudo apt-get update

# Install Docker and related packages
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose -y
