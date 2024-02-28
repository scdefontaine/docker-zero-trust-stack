#!/bin/bash

# run this file with sudo
  # i.e sudo install.sh

# Install required packages for Docker
apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# Add the Docker repository to APT sources
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update the package database with Docker packages from the newly added repo
apt-get update

# Install Docker
apt-get install -y docker-ce

# Install Docker Compose
# Check the latest release at https://github.com/docker/compose/releases and update the version number accordingly
COMPOSE_VERSION='1.29.2'
curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Create the Docker group if it doesn't already exist
if ! getent group docker > /dev/null; then
  groupadd docker
fi

# Create a dedicated Docker user without sudo permissions
useradd -m -s /bin/bash -G docker dockeruser

# Create the /opt/docker directory for Docker configurations
mkdir -p /opt/docker

# Change the ownership of the /opt/docker directory to the dockeruser
chown dockeruser:docker /opt/docker

# Make sure permissions are set correctly on /opt/docker
chmod 755 /opt/docker

