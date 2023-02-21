#!/bin/bash

# This script will install the dependencies for building with buildroot.

echo "Do you want to install all required dependencies for buildroot? (y/n)"
read -r answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Installing dependencies..."
    echo "Detecting Linux distribution..."
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO=$NAME
    else
        echo "Automatic dependency installation is only supported on Major Linux distributions."
    fi
    echo "Detected Linux distribution: $DISTRO"
    if [ "$DISTRO" = "Ubuntu" ]; then
        sudo apt-get install build-essential git libncurses5-dev libssl-dev bc
    elif [ "$DISTRO" = "Fedora" ]; then
        sudo dnf install @development-tools git ncurses-devel openssl-devel bc
    elif [ "$DISTRO" = "CentOS Linux" ]; then
        sudo yum groupinstall "Development Tools" && sudo yum install git ncurses-devel openssl-devel bc
    elif [ "$DISTRO" = "Arch Linux" ]; then
        sudo pacman -S base-devel git ncurses openssl bc which sed binutils
    else
        echo "Automatic dependency installation is only supported on Major Linux distributions."
    fi
    echo "Dependencies installed."
else
    echo "Skipping dependency installation."
fi