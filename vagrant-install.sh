#!/bin/bash

# Function to install VirtualBox and Vagrant on macOS
install_mac() {
    echo "Detected macOS. Installing VirtualBox and Vagrant..."
    brew install --cask virtualbox
    brew install --cask vagrant
}

# Function to install VirtualBox and Vagrant on Linux
install_linux() {
    echo "Detected Linux. Installing VirtualBox and Vagrant..."
    sudo apt-get update
    sudo apt-get install -y virtualbox
    sudo apt-get install -y vagrant
}

# Function to install VirtualBox and Vagrant on Windows
install_windows() {
    echo "Detected Windows. Installing VirtualBox and Vagrant..."
    choco install virtualbox
    choco install vagrant
}

# Main installation function
install() {
    # Detect the operating system
    OS="`uname`"
    case $OS in
      'Linux')
        install_linux
        ;;
      'Darwin')
        install_mac
        ;;
      'WindowsNT')
        # This part might need to be run in a PowerShell or Command Prompt script instead
        install_windows
        ;;
      *) ;;
    esac
}

# Run the installation function
install
