#!/bin/bash

# Stop Docker services
sudo systemctl stop docker
sudo systemctl stop docker.socket

# Uninstall Docker packages
sudo apt-get remove --purge -y docker.io docker-ce docker-ce-cli containerd runc

# Remove unused dependencies
sudo apt-get autoremove -y

# Remove Docker configuration and data
sudo rm -rf /etc/docker
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd

# Remove Docker group (if it exists)
if getent group docker > /dev/null; then
    sudo groupdel docker
fi

# Clean up package cache
sudo apt-get clean

# Verify removal
if ! command -v docker &> /dev/null; then
    echo "Docker has been successfully removed."
else
    echo "Something went wrong. Docker may still be installed."
fi
