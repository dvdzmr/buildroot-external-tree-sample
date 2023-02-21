#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: ./setup.sh <board>"
    echo "Example: ./setup.sh raspberrypi3"
    exit 1
fi

cd ./buildroot

if [[ $1 == "menuconfig"* ]]; then
    make BR2_EXTERNAL=../external_tree menuconfig
else
    make BR2_EXTERNAL=../external_tree $1_defconfig
fi

echo "Do you want to execute 'make clean' before building? (y/n)"
read -r answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Cleaning..."
    make clean
    echo "Cleaned."
fi

echo "Building..."
make

# coping .img and .iso files from output/images to images folder.
cp ./output/images/*.img ../images
cp ./output/images/*.iso ../images