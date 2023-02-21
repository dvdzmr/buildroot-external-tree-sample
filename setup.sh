#!/bin/bash

# This script will install the dependencies for building with buildroot.

echo "Do you want to install all required dependencies for buildroot? (y/n)"
read -r answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Installing dependencies..."
    echo "Detecting Linux distribution..."
    DNF_CMD=$(which dnf)
    YUM_CMD=$(which yum)
    APT_GET_CMD=$(which apt)
    PACMAN=$(which pacman)

    # Arch based distributions
    if [ -n "$PACMAN" ]; then
        echo "Installing dependencies for Arch Linux..."
        sudo pacman -S --needed base-devel ncurses bison flex patch texinfo help2man gawk gperf \
            libtool autoconf automake pkg-config ccache wget unzip rsync bc

    # I'll be honest, I dont know if all of these package names below here are correct I tried my best guess.

    # Red Hat based distributions
    # DNF is preferred over YUM so lets that check first.
    elif [ -n "$DNF_CMD" ]; then
        echo "Installing dependencies for RedHat/CentOS..."
        sudo yum install -y gcc gcc-c++ make ncurses-devel bison flex patch \
            texinfo help2man gawk gperf libtool libtool-libs autoconf automake \
            pkgconfig ccache wget unzip rsync bc
    elif [ -n "$YUM_CMD" ]; then
        echo "Installing dependencies for RedHat/CentOS..."
        sudo yum install -y gcc gcc-c++ make ncurses-devel bison flex patch \
            texinfo help2man gawk gperf libtool libtool-libs autoconf automake \
            pkgconfig ccache wget unzip rsync bc

    # Debian based distributions
    elif [ -n "$APT_GET_CMD" ]; then
        echo "Installing dependencies for Debian/Ubuntu..."
        sudo apt-get install -y build-essential gcc g++ make ncurses-dev bison flex patch \
            texinfo help2man gawk gperf libtool autoconf automake pkg-config ccache wget unzip \
            rsync bc
    else
        echo "Could not detect Linux distribution. Please install the dependencies manually."
        echo "https://buildroot.org/downloads/manual/manual.html"
        echo "Chapter 2.1 has the list of dependencies."
    fi